using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using EdFi.Ods.Common.Configuration;
using EdFi.Ods.Sandbox.Admin.Initialization;
using log4net;
using Microsoft.Extensions.Options;
using Quartz;
using Quartz.Impl;

namespace EdFi.Ods.Sandbox.Admin.Services
{
    public class BackgroundJobService : IBackgroundJobService
    {
        private readonly ILog _log = LogManager.GetLogger(typeof(BackgroundJobService));
        private readonly IInitializationEngine _engine;
        private readonly Dictionary<string, UserOptions> _users;
        private readonly ApiSettings _apiSettings;

        public BackgroundJobService(IInitializationEngine engine, IOptions<Dictionary<string, UserOptions>> users,
            ApiSettings apiSettings)
        {
            _engine = engine;
            _users = users.Value;
            _apiSettings = apiSettings;
        }

        /// <summary>
        /// Create background jobs to populate users and sandboxes
        /// This class separates the initialization engine from Quartz
        /// </summary>
        public async void Configure()
        {
            StdSchedulerFactory factory = new StdSchedulerFactory();
            IScheduler scheduler = await factory.GetScheduler();
            
            await scheduler.Start();
            
            await CreateAndScheduleNewJob<CreateIdentityRolesJob>("createIdentityRoles", "setupAdminDatabase", scheduler);
            await CreateAndScheduleNewJob<CreateIdentityUsersJob>("createIdentityUsers", "setupAdminDatabase", scheduler);
            await CreateAndScheduleNewJob<CreateVendorsJob>("createVendors", "setupAdminDatabase", scheduler);
            
            await CreateAndScheduleNewJob<CreateSandboxesJob>("createSandboxes", "setupAdminDatabase", scheduler);
            
            foreach (var user in _users)
            {
                // refresh existing sandboxes periodically
                if (user.Value.Sandboxes.Any(s => s.Value.Refresh))
                {
                    // Change the recurrence to suit your needs using Cron functions or a unix CRON expressions (i.e. "* */6 * * *" = every 6 hours)
                    await CreateAndScheduleNewJob<CreateSandboxesJob>("createSandboxes", "setupAdminDatabase", scheduler, "* */24 * * *");
                }
            }
        }

        private async Task<IJobDetail> CreateAndScheduleNewJob<T>(string idName, string idGroup, IScheduler scheduler, string cronExpression = null)
            where T : IJob
        {
            var newJob = JobBuilder.Create<T>().WithIdentity(idName, idGroup).Build();
            newJob.JobDataMap.Put("engine", _engine);
            ITrigger newTrigger;
            
            // If no cron expression is provided, then use a simple schedule that runs once
            if (string.IsNullOrEmpty(cronExpression))
            {
                newTrigger = TriggerBuilder.Create()
                    .WithIdentity(idName, idGroup)
                    .WithSimpleSchedule()
                    .StartNow()
                    .Build();
            }
            else
            {
                newTrigger = TriggerBuilder.Create()
                    .WithIdentity(idName, idGroup)
                    .WithCronSchedule(cronExpression)
                    .StartNow()
                    .Build();
            }

            await scheduler.ScheduleJob(newJob, newTrigger);
            return newJob;
        }
    }

    [DisallowConcurrentExecution]
    public class CreateIdentityRolesJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            await ((IInitializationEngine)context.MergedJobDataMap["engine"]).CreateIdentityRoles();
        }
    }

    [DisallowConcurrentExecution]
    public class CreateIdentityUsersJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            await ((IInitializationEngine)context.MergedJobDataMap["engine"]).CreateIdentityUsers();
        }
    }

    [DisallowConcurrentExecution]
    public class CreateVendorsJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            ((IInitializationEngine)context.MergedJobDataMap["engine"]).CreateVendors();
        }
    }

    [DisallowConcurrentExecution]
    public class RebuildSandboxesJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            ((IInitializationEngine)context.MergedJobDataMap["engine"]).CreateSandboxes();
        }
    }

    [DisallowConcurrentExecution]
    public class CreateSandboxesJob : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            ((IInitializationEngine)context.MergedJobDataMap["engine"]).CreateSandboxes();
        }
    }
}
