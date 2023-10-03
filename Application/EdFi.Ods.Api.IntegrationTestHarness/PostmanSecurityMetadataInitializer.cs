using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using EdFi.Common;
using EdFi.Common.Utils.Extensions;
using EdFi.Security.DataAccess.Contexts;
using EdFi.Security.DataAccess.Models;
using EdFi.Security.DataAccess.Utils;
using Action = EdFi.Security.DataAccess.Models.Action;

namespace EdFi.Ods.Api.IntegrationTestHarness
{
    public class PostmanSecurityMetadataInitializer : IPostmanSecurityMetadataInitializer
    {
        private readonly ISecurityContextFactory _securityContextFactory;
        private const string ClaimsBaseUri = "http://ed-fi.org/ods/identity/claims";

        public PostmanSecurityMetadataInitializer(ISecurityContextFactory securityContextFactory)
        {
            _securityContextFactory = Preconditions.ThrowIfNull(securityContextFactory, nameof(securityContextFactory));


            Initialize(
                GetActions,
                GetClaimSets,
                GetResourceClaims,
                GetAuthorizationStrategies,
                GetClaimSetResourceClaimActions,
                GetResourceClaimActionAuthorizations);
        }
        

        protected ResettableLazy<List<Action>> Actions { get; private set; }

        protected ResettableLazy<List<ClaimSet>> ClaimSets { get; private set; }

        protected ResettableLazy<List<ResourceClaim>> ResourceClaims { get; private set; }

        protected ResettableLazy<List<AuthorizationStrategy>> AuthorizationStrategies { get; private set; }

        protected ResettableLazy<List<ClaimSetResourceClaimAction>> ClaimSetResourceClaimActions { get; private set; }

        protected ResettableLazy<List<ResourceClaimAction>> ResourceClaimActions { get; private set; }
        
        protected void Initialize(
            Func<List<Action>> actions,
            Func<List<ClaimSet>> claimSets,
            Func<List<ResourceClaim>> resourceClaims,
            Func<List<AuthorizationStrategy>> authorizationStrategies,
            Func<List<ClaimSetResourceClaimAction>> claimSetResourceClaimActions,
            Func<List<ResourceClaimAction>> resourceClaimActions)
        {
            Actions = new ResettableLazy<List<Action>>(actions);
            ClaimSets = new ResettableLazy<List<ClaimSet>>(claimSets);
            ResourceClaims = new ResettableLazy<List<ResourceClaim>>(resourceClaims);
            AuthorizationStrategies = new ResettableLazy<List<AuthorizationStrategy>>(authorizationStrategies);
            ClaimSetResourceClaimActions = new ResettableLazy<List<ClaimSetResourceClaimAction>>(claimSetResourceClaimActions);
            ResourceClaimActions = new ResettableLazy<List<ResourceClaimAction>>(resourceClaimActions);
        }
        
        /// <summary>
        /// Clears the cache, the database will be hit lazily.
        /// </summary>
        protected void Reset()
        {
            Actions.Reset();
            ClaimSets.Reset();
            ResourceClaims.Reset();
            AuthorizationStrategies.Reset();
            ClaimSetResourceClaimActions.Reset();
            ResourceClaimActions.Reset();
        }
        
        public void LoadMultipleAuthorizationStrategyData()
        {
            int createActionId, readActionId, updateActionId, deleteActionId;

            using (var context = _securityContextFactory.CreateContext())
            {
                var multipleAuthStrategyNames = new[] {
                    "OwnershipBased",
                    "RelationshipsWithEdOrgsAndPeople",
                    "RelationshipsWithStudentsOnlyThroughResponsibility"
                };

                var claimNameList = new string[] {
                    $"{ClaimsBaseUri}/studentSectionAssociation",
                    $"{ClaimsBaseUri}/studentEducationOrganizationResponsibilityAssociation",
                    $"{ClaimsBaseUri}/educationContent",
                };

                var resourceClaims = context.ResourceClaims.Where(x => claimNameList.Contains(x.ClaimName)).ToList();

                var educationContentsResourceClaimId = resourceClaims
                    .FirstOrDefault(x => x.ClaimName.Equals($"{ClaimsBaseUri}/educationContent"))
                    .ResourceClaimId;

                var studentSectionAssociationResourceClaimId = resourceClaims
                    .FirstOrDefault(x => x.ClaimName.Equals($"{ClaimsBaseUri}/studentSectionAssociation"))
                    .ResourceClaimId;

                var seoraResourceClaimId = resourceClaims.FirstOrDefault(
                        x => x.ClaimName.Equals($"{ClaimsBaseUri}/studentEducationOrganizationResponsibilityAssociation"))
                    .ResourceClaimId;

                createActionId = context.Actions.FirstOrDefault(a => a.ActionName.ToLower() == "create").ActionId;
                readActionId = context.Actions.FirstOrDefault(a => a.ActionName.ToLower() == "read").ActionId;
                updateActionId = context.Actions.FirstOrDefault(a => a.ActionName.ToLower() == "update").ActionId;
                deleteActionId = context.Actions.FirstOrDefault(a => a.ActionName.ToLower() == "delete").ActionId;

                var allCrudActions = new[]
                {
                    createActionId,
                    readActionId,
                    updateActionId,
                    deleteActionId
                };

                var edFiSandboxClaimSetId = context.ClaimSets.FirstOrDefault(a => a.ClaimSetName == "Ed-Fi Sandbox").ClaimSetId;

                var allAuthorizationStrategies = context.AuthorizationStrategies.ToArray();

                var multipleAuthStrategies = allAuthorizationStrategies
                    .Where(a => multipleAuthStrategyNames.Contains(a.AuthorizationStrategyName))
                    .ToArray();

                var relationshipsWithEdOrgsOnlyAuthorizationStrategy =
                    allAuthorizationStrategies.Single(a => a.AuthorizationStrategyName.Equals("RelationshipsWithEdOrgsOnly"));

                var claimSetResourceClaimActions = new List<ClaimSetResourceClaimAction>();

                // Ensure resource/claim entries for studentSectionAssociations, Ed-Fi Sandbox and all CRUD actions 
                allCrudActions
                    .ForEach(
                        actionId =>
                        {
                            if (!context.ClaimSetResourceClaimActions.Any(
                                    a => a.ActionId == actionId
                                        && a.ResourceClaimId == studentSectionAssociationResourceClaimId
                                        && a.ClaimSetId == edFiSandboxClaimSetId))
                            {
                                claimSetResourceClaimActions.Add(
                                    new ClaimSetResourceClaimAction
                                    {
                                        ResourceClaimId = studentSectionAssociationResourceClaimId,
                                        ActionId = actionId,
                                        ClaimSetId = edFiSandboxClaimSetId
                                    });
                            }
                        });

                // Ensure resource/claim entries for educationContents, Ed-Fi Sandbox and all CRUD actions 
                allCrudActions
                    .ForEach(
                        actionId =>
                        {
                            if (!context.ClaimSetResourceClaimActions.Any(
                                    a => a.ActionId == actionId
                                        && a.ResourceClaimId == educationContentsResourceClaimId
                                        && a.ClaimSetId == edFiSandboxClaimSetId))
                            {
                                claimSetResourceClaimActions.Add(
                                    new ClaimSetResourceClaimAction
                                    {
                                        ResourceClaimId = educationContentsResourceClaimId,
                                        ActionId = actionId,
                                        ClaimSetId = edFiSandboxClaimSetId
                                    });
                            }
                        });

                if (!context.ClaimSetResourceClaimActions.Any(
                        a => a.ActionId == createActionId
                            && a.ResourceClaimId == seoraResourceClaimId
                            && a.ClaimSetId == edFiSandboxClaimSetId))
                {
                    claimSetResourceClaimActions.Add(
                        new ClaimSetResourceClaimAction
                        {
                            ResourceClaimId = seoraResourceClaimId,
                            ActionId = createActionId,
                            ClaimSetId = edFiSandboxClaimSetId
                        });
                }

                if (claimSetResourceClaimActions.Any())
                {
                    context.ClaimSetResourceClaimActions.AddRange(claimSetResourceClaimActions);
                    context.SaveChanges();
                }

                var claimSetResourceClaimActionAuthorizationStrategyOverrides = new List<ClaimSetResourceClaimActionAuthorizationStrategyOverrides>();

                // Add authorization strategy overrides for StudentSectionAssociation resource claim
                var claimSetStudentSectionAssociationResourceClaimActions = context.ClaimSetResourceClaimActions.Where(
                    x => x.ResourceClaimId == studentSectionAssociationResourceClaimId
                        && x.ClaimSetId == edFiSandboxClaimSetId
                        && allCrudActions.Contains(x.ActionId))
                    .ToArray();

                multipleAuthStrategies.ForEach(
                    authorizationStrategy =>
                    {
                        claimSetStudentSectionAssociationResourceClaimActions.ForEach(
                            resourceClaimAction =>
                            {
                                // Don't add OwnershipBased authorization for creation of items
                                if (resourceClaimAction.ActionId == createActionId
                                    && authorizationStrategy.AuthorizationStrategyName == "OwnershipBased")
                                {
                                    return;
                                }

                                if (!context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.Any(
                                        a => a.ClaimSetResourceClaimActionId == resourceClaimAction.ClaimSetResourceClaimActionId
                                            && a.AuthorizationStrategyId == authorizationStrategy.AuthorizationStrategyId))
                                {
                                    claimSetResourceClaimActionAuthorizationStrategyOverrides.Add(
                                        new ClaimSetResourceClaimActionAuthorizationStrategyOverrides
                                        {
                                            ClaimSetResourceClaimAction = resourceClaimAction,
                                            ClaimSetResourceClaimActionId =
                                                resourceClaimAction.ClaimSetResourceClaimActionId,
                                            AuthorizationStrategy = authorizationStrategy,
                                            AuthorizationStrategyId = authorizationStrategy.AuthorizationStrategyId
                                        });
                                }
                            });
                    });

                var multipleAuthStrategyNamesForNamespace = new[] {
                    "OwnershipBased",
                    "NamespaceBased",
                };

                var multipleAuthStrategiesForNamespace = allAuthorizationStrategies
                    .Where(a => multipleAuthStrategyNamesForNamespace.Contains(a.AuthorizationStrategyName))
                    .ToArray();

                // Add authorization strategy overrides for EducationContent resource claim
                var claimSetEducationContentResourceClaimActions = context.ClaimSetResourceClaimActions.Where(
                    x => x.ResourceClaimId == educationContentsResourceClaimId
                        && x.ClaimSetId == edFiSandboxClaimSetId
                        && allCrudActions.Contains(x.ActionId))
                    .ToArray();

                multipleAuthStrategiesForNamespace.ForEach(
                    authorizationStrategy =>
                    {
                        claimSetEducationContentResourceClaimActions.ForEach(
                            resourceClaimAction =>
                            {
                                // Don't add OwnershipBased authorization for creation of items
                                if (resourceClaimAction.ActionId == createActionId
                                    && authorizationStrategy.AuthorizationStrategyName == "OwnershipBased")
                                {
                                    return;
                                }

                                if (!context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.Any(
                                        a => a.ClaimSetResourceClaimActionId == resourceClaimAction.ClaimSetResourceClaimActionId
                                            && a.AuthorizationStrategyId == authorizationStrategy.AuthorizationStrategyId))
                                {
                                    claimSetResourceClaimActionAuthorizationStrategyOverrides.Add(
                                        new ClaimSetResourceClaimActionAuthorizationStrategyOverrides
                                        {
                                            ClaimSetResourceClaimAction = resourceClaimAction,
                                            ClaimSetResourceClaimActionId =
                                                resourceClaimAction.ClaimSetResourceClaimActionId,
                                            AuthorizationStrategy = authorizationStrategy,
                                            AuthorizationStrategyId = authorizationStrategy.AuthorizationStrategyId
                                        });
                                }
                            });
                    });

                // Add authorization strategy overrides for StudentEdOrgResponsibilityAssociation
                var claimSetSeoraResourceClaimAction = context.ClaimSetResourceClaimActions.Single(x => x.ResourceClaimId == seoraResourceClaimId && x.ClaimSetId == edFiSandboxClaimSetId
                    && x.ActionId == createActionId);

                if (!context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.Any(a => a.ClaimSetResourceClaimActionId == claimSetSeoraResourceClaimAction.ClaimSetResourceClaimActionId
                    && a.AuthorizationStrategyId == relationshipsWithEdOrgsOnlyAuthorizationStrategy.AuthorizationStrategyId))
                {
                    claimSetResourceClaimActionAuthorizationStrategyOverrides.Add(
                      new ClaimSetResourceClaimActionAuthorizationStrategyOverrides
                      {
                          ClaimSetResourceClaimAction = claimSetSeoraResourceClaimAction,
                          ClaimSetResourceClaimActionId = claimSetSeoraResourceClaimAction.ClaimSetResourceClaimActionId,
                          AuthorizationStrategy = relationshipsWithEdOrgsOnlyAuthorizationStrategy,
                          AuthorizationStrategyId = relationshipsWithEdOrgsOnlyAuthorizationStrategy.AuthorizationStrategyId,

                      });
                }

                if (claimSetResourceClaimActionAuthorizationStrategyOverrides.Any())
                {
                    context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.AddRange(claimSetResourceClaimActionAuthorizationStrategyOverrides);
                    context.SaveChanges();
                }
            }

            this.Reset();
        }

        public void LoadRecordOwnershipData()
        {
            using (var context = _securityContextFactory.CreateContext())
            {

                context.ClaimSets.Add(new ClaimSet
                {
                    ClaimSetName = "Ownership Based Test",
                    IsEdfiPreset = true,
                    ForApplicationUseOnly = true
                });
                context.SaveChanges();

                var claimNameList = new string[] {
                    $"{ClaimsBaseUri}/domains/educationOrganizations",
                    $"{ClaimsBaseUri}/studentSectionAssociation",
                    $"{ClaimsBaseUri}/gradingPeriod",
                    $"{ClaimsBaseUri}/session",
                    $"{ClaimsBaseUri}/course",
                    $"{ClaimsBaseUri}/courseOffering",
                    $"{ClaimsBaseUri}/section",
                    $"{ClaimsBaseUri}/studentSchoolAssociation",
                    $"{ClaimsBaseUri}/domains/people"
                };

                var ownershipBasedClaimSetId = context.ClaimSets.FirstOrDefault(a => a.ClaimSetName == "Ownership Based Test").ClaimSetId;
                var ownershipBasedAuthorizationStrategyId = context.AuthorizationStrategies.FirstOrDefault(a => a.AuthorizationStrategyName == "OwnershipBased").AuthorizationStrategyId;

                var resourceClaims = context.ResourceClaims.Where(x => claimNameList.Contains(x.ClaimName)).ToList();
                var actions = context.Actions.ToList();

                var claimSetResourceClaimActions = new List<ClaimSetResourceClaimAction>();

                resourceClaims.ForEach(resourceClaim =>
                {
                    actions.ForEach(action =>
                    {
                        if (!context.ClaimSetResourceClaimActions.Any(a => a.ActionId == action.ActionId && a.ResourceClaimId == resourceClaim.ResourceClaimId
                        && a.ClaimSetId == ownershipBasedClaimSetId))
                        {
                            claimSetResourceClaimActions.Add(
                               new ClaimSetResourceClaimAction
                               {
                                   ResourceClaimId = resourceClaim.ResourceClaimId,
                                   ActionId = action.ActionId,
                                   ClaimSetId = ownershipBasedClaimSetId
                               });
                        }
                    });

                });

                if (claimSetResourceClaimActions.Any())
                {
                    context.ClaimSetResourceClaimActions.AddRange(claimSetResourceClaimActions);
                    context.SaveChanges();
                }

                var resourceClaimList = resourceClaims.Select(x => x.ResourceClaimId);
                var claimSetResourceClaimActionList = context.ClaimSetResourceClaimActions.Where(x => resourceClaimList.Contains(x.ResourceClaimId))
                    .Where(x => x.ClaimSetId == ownershipBasedClaimSetId).ToList();

                var claimSetResourceClaimActionAuthorizationStrategyOverrides = new List<ClaimSetResourceClaimActionAuthorizationStrategyOverrides>();

                claimSetResourceClaimActionList.ForEach(claimSetResourceClaimAction =>
                {
                    if (!context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.Any(a => a.ClaimSetResourceClaimActionId == claimSetResourceClaimAction.ClaimSetResourceClaimActionId
                        && a.AuthorizationStrategyId == ownershipBasedAuthorizationStrategyId))
                    {
                        claimSetResourceClaimActionAuthorizationStrategyOverrides.Add(
                          new ClaimSetResourceClaimActionAuthorizationStrategyOverrides
                          {
                              ClaimSetResourceClaimActionId = claimSetResourceClaimAction.ClaimSetResourceClaimActionId,
                              AuthorizationStrategyId = ownershipBasedAuthorizationStrategyId
                          });
                    }
                });

                if (claimSetResourceClaimActionAuthorizationStrategyOverrides.Any())
                {
                    context.ClaimSetResourceClaimActionAuthorizationStrategyOverrides.AddRange(claimSetResourceClaimActionAuthorizationStrategyOverrides);
                    context.SaveChanges();
                }
            }
        }

        private List<EdFi.Security.DataAccess.Models.Action> GetActions()
        {
            using var context = _securityContextFactory.CreateContext();

            return context.Actions.ToList();
        }

        private List<ClaimSet> GetClaimSets()
        {
            using var context = _securityContextFactory.CreateContext();

            return context.ClaimSets.ToList();
        }

        private List<ResourceClaim> GetResourceClaims()
        {
            using var context = _securityContextFactory.CreateContext();

            return context.ResourceClaims
                .Include(rc => rc.ParentResourceClaim)
                .ToList();
        }

        private List<AuthorizationStrategy> GetAuthorizationStrategies()
        {
            using var context = _securityContextFactory.CreateContext();

            return context.AuthorizationStrategies.ToList();
        }

        private List<ClaimSetResourceClaimAction> GetClaimSetResourceClaimActions()
        {
            using var context = _securityContextFactory.CreateContext();

            var claimSetResourceClaimActions = context.ClaimSetResourceClaimActions
                .Include(csrc => csrc.Action)
                .Include(csrc => csrc.ClaimSet)
                .Include(csrc => csrc.ResourceClaim)
                .Include(csrc => csrc.AuthorizationStrategyOverrides.Select(aso => aso.AuthorizationStrategy))
                .ToList();

            // Replace empty lists with null since some consumers expect it that way
            claimSetResourceClaimActions
                .Where(csrc => csrc.AuthorizationStrategyOverrides.Count == 0)
                .ForEach(csrc => csrc.AuthorizationStrategyOverrides = null);

            return claimSetResourceClaimActions;
        }

        private List<ResourceClaimAction> GetResourceClaimActionAuthorizations()
        {
            using var context = _securityContextFactory.CreateContext();

            var resourceClaimActionAuthorizationStrategies = context.ResourceClaimActionAuthorizationStrategies
                .Include(rcaas => rcaas.AuthorizationStrategy)
                .Include(rcaas => rcaas.ResourceClaimAction)
                .ToList();

            var resourceClaimActionAuthorizations = context.ResourceClaimActions
                .Include(rcas => rcas.Action)
                .Include(rcas => rcas.ResourceClaim)
                .Include(rcas => rcas.AuthorizationStrategies)
                .ToList();

            foreach (var a in resourceClaimActionAuthorizations)
            {
                a.AuthorizationStrategies = resourceClaimActionAuthorizationStrategies.Where(r => r.ResourceClaimAction.ResourceClaimActionId == a.ResourceClaimActionId).ToList();
            }

            return resourceClaimActionAuthorizations;
        }

    }
}
