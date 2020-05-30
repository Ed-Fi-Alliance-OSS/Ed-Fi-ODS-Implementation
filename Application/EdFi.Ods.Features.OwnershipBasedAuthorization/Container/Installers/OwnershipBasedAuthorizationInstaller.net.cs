#if NETFRAMEWORK
// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using Castle.Windsor;
using EdFi.Ods.Api.Common.Infrastructure.Configuration;
using EdFi.Ods.Common.Extensions;
using EdFi.Ods.Common.InversionOfControl;
using EdFi.Ods.Common.Repositories;
using EdFi.Ods.Features.OwnershipBasedAuthorization.NHibernate;
using EdFi.Ods.Features.OwnershipBasedAuthorization.Security;
using Component = Castle.MicroKernel.Registration.Component;

namespace EdFi.Ods.Features.OwnershipBasedAuthorization.Installers
{
    public class OwnershipBasedAuthorizationInstaller : RegistrationMethodsInstallerBase
    {
        private void RegisterNHibernateConfigurationActivities(IWindsorContainer container)
        {
            container.Register(
                Component
                   .For<INHibernateBeforeBindMappingActivity>()
                   .ImplementedBy<OwnershipBasedAuthorizationNHibernateConfigurationActivity>());

            container.Register(
                Component
                   .For(typeof(ICreateEntity<>))
                   .ImplementedBy(typeof(OwnershipInitializationCreateEntityDecorator<>)).IsDecorator());
        }
    }
}
#endif
