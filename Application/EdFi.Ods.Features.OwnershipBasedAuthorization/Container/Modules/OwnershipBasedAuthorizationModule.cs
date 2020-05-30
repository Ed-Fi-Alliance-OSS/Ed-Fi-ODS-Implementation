#if NETCOREAPP
using Autofac;
using EdFi.Ods.Api.Common.Configuration;
using EdFi.Ods.Api.Common.Constants;
using EdFi.Ods.Api.Common.Container;
using EdFi.Ods.Api.Common.Infrastructure.Configuration;
using EdFi.Ods.Common.Repositories;
using EdFi.Ods.Features.OwnershipBasedAuthorization.NHibernate;
using EdFi.Ods.Features.OwnershipBasedAuthorization.Security;

namespace EdFi.Ods.Features.OwnershipBasedAuthorization.Container.Modules
{
    public class OwnershipBasedAuthorizationModule : ConditionalModule
    {
        public OwnershipBasedAuthorizationModule(ApiSettings apiSettings)
            : base(apiSettings, nameof(OwnershipBasedAuthorizationModule)) { }

        public override bool IsSelected() => IsFeatureEnabled(ApiFeature.OwnershipBasedAuthorization);

        public override void ApplyConfigurationSpecificRegistrations(ContainerBuilder builder)
        {
            builder.RegisterType<OwnershipBasedAuthorizationNHibernateConfigurationActivity>()
                .As<INHibernateBeforeBindMappingActivity>();

            builder.RegisterGenericDecorator(typeof(OwnershipInitializationCreateEntityDecorator<>), typeof(ICreateEntity<>));
        }
    }
}
#endif