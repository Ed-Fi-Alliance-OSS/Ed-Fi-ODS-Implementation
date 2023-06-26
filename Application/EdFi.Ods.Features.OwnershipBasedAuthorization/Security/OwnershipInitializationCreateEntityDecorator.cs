// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System.Threading;
using System.Threading.Tasks;
using EdFi.Common;
using EdFi.Ods.Api.Security.Authorization;
using EdFi.Ods.Api.Security.Authorization.Filtering;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Models.Domain;
using EdFi.Ods.Common.Repositories;
using EdFi.Ods.Common.Security;
using EdFi.Ods.Common.Security.Claims;
using EdFi.Ods.Api.Security.Authorization.Repositories;
using EdFi.Ods.Api.Security.AuthorizationStrategies.Relationships.Filters;
using EdFi.Ods.Common.Context;
using EdFi.Ods.Common.Infrastructure.Filtering;
using EdFi.Security.DataAccess.Repositories;
using NHibernate;

namespace EdFi.Ods.Features.OwnershipBasedAuthorization.Security
{
    public class OwnershipInitializationCreateEntityDecorator<T>
        : RepositoryOperationAuthorizationDecoratorBase<T>, ICreateEntity<T>
        where T : AggregateRootWithCompositeKey
    {
        private readonly IApiClientContextProvider _apiClientContextProvider;
        private readonly ICreateEntity<T> _next;

        /// <summary>
        /// Initializes a new instance of the <see cref="OwnershipInitializationCreateEntityDecorator{T}"/> class.
        /// </summary>
        /// <param name="next">The decorated instance for which authorization is being performed.</param>
        /// <param name="authorizationContextProvider">Provides access to the authorization context, such as the resource and action.</param>
        /// <param name="authorizationFilteringProvider">The component capable of authorizing the request, given necessary context.</param>
        /// <param name="authorizationFilterDefinitionProvider"></param>
        /// <param name="explicitObjectValidators"></param>
        /// <param name="authorizationBasisMetadataSelector"></param>
        /// <param name="securityRepository"></param>
        /// <param name="sessionFactory"></param>
        /// <param name="apiClientContextProvider"></param>
        /// <param name="viewBasedSingleItemAuthorizationQuerySupport"></param>
        /// <param name="dataManagementResourceContextProvider"></param>
        public OwnershipInitializationCreateEntityDecorator(
            ICreateEntity<T> next,
            IAuthorizationContextProvider authorizationContextProvider,
            IAuthorizationFilteringProvider authorizationFilteringProvider,
            IAuthorizationFilterDefinitionProvider authorizationFilterDefinitionProvider,
            IExplicitObjectValidator[] explicitObjectValidators,
            IAuthorizationBasisMetadataSelector authorizationBasisMetadataSelector,
            ISecurityRepository securityRepository,
            ISessionFactory sessionFactory,
            IApiClientContextProvider apiClientContextProvider,
            IViewBasedSingleItemAuthorizationQuerySupport viewBasedSingleItemAuthorizationQuerySupport,
            IContextProvider<DataManagementResourceContext> dataManagementResourceContextProvider)
            : base(
                authorizationContextProvider,
                authorizationFilteringProvider,
                authorizationFilterDefinitionProvider,
                explicitObjectValidators,
                authorizationBasisMetadataSelector,
                securityRepository,
                sessionFactory,
                apiClientContextProvider,
                viewBasedSingleItemAuthorizationQuerySupport,
                dataManagementResourceContextProvider)
        {
            _next = Preconditions.ThrowIfNull(next, nameof(next));
            _apiClientContextProvider = Preconditions.ThrowIfNull(apiClientContextProvider, nameof(apiClientContextProvider));
        }

        public async Task CreateAsync(T entity, bool enforceOptimisticLock, CancellationToken cancellationToken)
        {
            Preconditions.ThrowIfNull(entity, nameof(entity));

            // POST comes in as an "Upsert", but at this point we know it's actually about to create an entity,
            // so we'll use the more explicit action for authorization.
            short? creatorOwnershipTokenId = _apiClientContextProvider.GetApiClientContext().CreatorOwnershipTokenId;

            entity.CreatedByOwnershipTokenId = creatorOwnershipTokenId;

            // Pass the call through to the decorated repository method
            await _next.CreateAsync(entity, enforceOptimisticLock, cancellationToken);
        }
    }
}
