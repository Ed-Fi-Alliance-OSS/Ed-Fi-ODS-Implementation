// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.
 
using System.Threading;
using System.Threading.Tasks;
using EdFi.Ods.Api.Common.Dtos;
using EdFi.Ods.Common;
using EdFi.Ods.Common.Repositories;
using EdFi.Ods.Common.Security;
using EdFi.Ods.Common.Security.Claims;
using EdFi.Ods.Security.Authorization.Repositories;

namespace EdFi.Ods.Features.OwnershipBasedAuthorization.Security
{
    public class OwnershipInitializationCreateEntityDecorator<T>
        : RepositoryOperationAuthorizationDecoratorBase<T>, ICreateEntity<T>
        where T : AggregateRootWithCompositeKey
    {
        private readonly IApiKeyContextProvider _apiKeyContext;
        private readonly ICreateEntity<T> _next;

        /// <summary>
        /// Initializes a new instance of the <see cref="OwnershipInitializationCreateEntityDecorator{T}"/> class.
        /// </summary>
        /// <param name="next">The decorated instance for which authorization is being performed.</param>
        /// <param name="apiKeyContext"></param>
        /// <param name="authorizationContextProvider">Provides access to the authorization context, such as the resource and action.</param>
        /// <param name="authorizationProvider">The component capable of authorizing the request, given necessary context.</param>
        public OwnershipInitializationCreateEntityDecorator(
            ICreateEntity<T> next,
            IApiKeyContextProvider apiKeyContext,
            IAuthorizationContextProvider authorizationContextProvider,
            IEdFiAuthorizationProvider authorizationProvider)
            : base(authorizationContextProvider, authorizationProvider)
        {
            _next = Preconditions.ThrowIfNull(next, nameof(next));
            _apiKeyContext = Preconditions.ThrowIfNull(apiKeyContext, nameof(apiKeyContext));
        }

        public async Task CreateAsync(T entity, bool enforceOptimisticLock, CancellationToken cancellationToken)
        {
            Preconditions.ThrowIfNull(entity, nameof(entity));

            // POST comes in as an "Upsert", but at this point we know it's actually about to create an entity,
            // so we'll use the more explicit action for authorization.
            short? creatorOwnershipTokenId = _apiKeyContext.GetApiKeyContext().CreatorOwnershipTokenId;

            entity.CreatedByOwnershipTokenId = creatorOwnershipTokenId;

            // Pass the call through to the decorated repository method
            await _next.CreateAsync(entity, enforceOptimisticLock, cancellationToken);
        }
    }
}
