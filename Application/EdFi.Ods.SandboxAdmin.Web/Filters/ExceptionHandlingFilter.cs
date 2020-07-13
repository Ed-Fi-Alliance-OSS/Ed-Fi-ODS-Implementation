// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Filters;
using log4net;

namespace EdFi.Ods.SandboxAdmin.Web.Filters
{
    public class ExceptionHandlingFilter : IExceptionFilter
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(ExceptionHandlingFilter));        
        
        public Task ExecuteExceptionFilterAsync(HttpActionExecutedContext actionExecutedContext, CancellationToken cancellationToken)
        {          
            return Task.Run(
                () =>
                {
                    _logger.Error(actionExecutedContext.Exception);

                    actionExecutedContext.Response =
                        actionExecutedContext.Request.CreateErrorResponse(
                            HttpStatusCode.InternalServerError,
                            new HttpError(actionExecutedContext.Exception, false));
                },
                cancellationToken);
        }

        public bool AllowMultiple
        {
            get { return true; }
        }
    }
}
