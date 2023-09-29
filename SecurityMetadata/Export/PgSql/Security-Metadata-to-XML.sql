DROP FUNCTION IF EXISTS dbo.GetClaimSetResourceClaimActionAuthorizationStrategyOverrides;
CREATE OR REPLACE FUNCTION dbo.GetClaimSetResourceClaimActionAuthorizationStrategyOverrides (claim_set_resource_claim_action_id INT) 
RETURNS SETOF XML
AS
$$
BEGIN
    IF EXISTS  (SELECT  1 FROM   dbo.ClaimSetResourceClaimActionAuthorizationStrategyOverrides strats
			INNER JOIN dbo.AuthorizationStrategies strat ON strat.AuthorizationStrategyId = strats.AuthorizationStrategyId			
			WHERE strats.ClaimSetResourceClaimActionId = claim_set_resource_claim_action_id)  THEN
    RETURN QUERY (
		SELECT xmlElement(name "AuthorizationStrategy", xmlattributes(a.name))
		FROM
			(SELECT strat.AuthorizationStrategyName AS "name"				
			 FROM dbo.ClaimSetResourceClaimActionAuthorizationStrategyOverrides strats
			 INNER JOIN dbo.AuthorizationStrategies strat ON 
			strat.AuthorizationStrategyId = strats.AuthorizationStrategyId			
			WHERE strats.ClaimSetResourceClaimActionId = claim_set_resource_claim_action_id
			ORDER BY strat.AuthorizationStrategyName) a
	);
	ELSE
	RETURN QUERY (SELECT null::XML) ;
END IF;
END;
$$
LANGUAGE plpgsql;

--select dbo.GetClaimSetResourceClaimActionAuthorizationStrategyOverrides(76);
--select dbo.GetClaimSetResourceClaimActionAuthorizationStrategyOverrides(-76);


DROP FUNCTION IF EXISTS dbo.GetClaimSetActionWithOverrides;
CREATE OR REPLACE FUNCTION dbo.GetClaimSetActionWithOverrides (claim_set_id INT, resource_claim_id INT) 
RETURNS SETOF XML
AS
$$
BEGIN
    IF EXISTS  (SELECT  1 FROM dbo.ClaimSetResourceClaimActions csrca			
			INNER JOIN dbo.Actions a ON csrca.ActionId = a.ActionId
			WHERE csrca.ResourceClaimId = resource_claim_id	AND csrca.ClaimSetId = claim_set_id)  THEN
    RETURN QUERY (
				   SELECT xmlElement(name "Action", xmlattributes(a.name, validationRuleSetOverride),
				   CASE 
					  WHEN (a.authorizationStrategyOverrides ::TEXT <> '') IS NOT TRUE  THEN xmlagg(a.authorizationStrategyOverrides::xml)
					  ELSE  xmlelement(name "AuthorizationStrategyOverrides",xmlagg(a.authorizationStrategyOverrides::XML))
				   END)
		FROM
			(SELECT	a.ActionName AS "name",	csrca.ValidationRuleSetNameOverride AS validationRuleSetOverride,
		 	dbo.GetClaimSetResourceClaimActionAuthorizationStrategyOverrides(csrca.ClaimSetResourceClaimActionId)::TEXT AS authorizationStrategyOverrides		 
			FROM dbo.ClaimSetResourceClaimActions csrca			
			INNER JOIN dbo.Actions a ON csrca.ActionId = a.ActionId
			WHERE csrca.ResourceClaimId = resource_claim_id	AND csrca.ClaimSetId = claim_set_id
			ORDER BY a.ActionId ) a
			GROUP BY a.name ,a.validationRuleSetOverride,a.authorizationStrategyOverrides
	   );
	   	ELSE
	RETURN QUERY (SELECT null::XML) ;
END IF;
END;
$$
LANGUAGE plpgsql;

--select dbo.GetClaimSetActionWithOverrides(2,59);
--select dbo.GetClaimSetActionWithOverrides(4,59);

CREATE OR REPLACE VIEW dbo.ClaimSetResource 
AS
    SELECT 	csrca.ResourceClaimId AS ResourceClaimId, 
		cs.ClaimSetId, 	cs.ClaimSetName
    FROM dbo.ClaimSetResourceClaimActions csrca
    INNER JOIN dbo.ClaimSets cs ON 	csrca.ClaimSetId = cs.ClaimSetId
	GROUP BY csrca.ResourceClaimId,	cs.ClaimSetId,	cs.ClaimSetName;

DROP FUNCTION IF EXISTS dbo.GetClaimSetWithActions;
CREATE OR REPLACE FUNCTION dbo.GetClaimSetWithActions (resource_claim_id INT) 
RETURNS SETOF XML
AS
$$
BEGIN
 IF EXISTS  (SELECT  1 FROM dbo.ClaimSetResource x 	WHERE x.ResourceClaimId = resource_claim_id)  THEN
		 
	RETURN QUERY (
		SELECT xmlelement(name "ClaimSet", xmlattributes(a.name), xmlelement(name "Actions", null, xmlagg(a.Actions))) 
		FROM
			(SELECT	x.ClaimSetName as "name",
			  dbo.GetClaimSetActionWithOverrides(x.ClaimSetId, resource_claim_id) as Actions
			FROM dbo.ClaimSetResource x
			WHERE 	x.ResourceClaimId = resource_claim_id) a
		    GROUP BY a.name
		);
	
	ELSE
	RETURN QUERY (SELECT null::XML) ;
  END IF;
END;
$$
LANGUAGE plpgsql;


--select * FROM dbo.GetClaimSetWithActions(1);
--select * from dbo.GetClaimSetWithActions(223);

DROP FUNCTION IF EXISTS dbo.GetResourceClaimActionAuthorizationStrategies;
CREATE OR REPLACE FUNCTION dbo.GetResourceClaimActionAuthorizationStrategies (resource_claim_action_id INT) 
RETURNS SETOF XML
AS
$$
BEGIN
    IF EXISTS  (SELECT  1 FROM dbo.ResourceClaimActionAuthorizationStrategies strats
				INNER JOIN dbo.AuthorizationStrategies strat ON strats.AuthorizationStrategyId = strat.AuthorizationStrategyId
				WHERE strats.ResourceClaimActionId = @resource_claim_action_id)  THEN
			RETURN QUERY (
				SELECT xmlelement(name "AuthorizationStrategy", xmlattributes(a.name)) 
				FROM
					(SELECT strat.AuthorizationStrategyName AS "name"
					FROM dbo.ResourceClaimActionAuthorizationStrategies strats
					INNER JOIN dbo.AuthorizationStrategies strat
					ON strats.AuthorizationStrategyId = strat.AuthorizationStrategyId
					WHERE strats.ResourceClaimActionId = @resource_claim_action_id
					ORDER BY strat.AuthorizationStrategyName) a
					GROUP BY a.name
				);
	ELSE
	RETURN QUERY (SELECT null::XML);
END IF;
END;
$$
LANGUAGE plpgsql;

--select dbo.GetResourceClaimActionAuthorizationStrategies(1);
--select dbo.GetResourceClaimActionAuthorizationStrategies(45);
--select dbo.GetResourceClaimActionAuthorizationStrategies(148);


DROP FUNCTION IF EXISTS dbo.GetResourceClaimAction;
CREATE OR REPLACE FUNCTION dbo.GetResourceClaimAction (resource_claim_id INT) 
RETURNS SETOF XML 
AS
$$
BEGIN
  IF EXISTS  (SELECT  1 FROM dbo.ResourceClaimActions meta
		 INNER JOIN dbo.Actions a ON meta.ActionId = a.ActionId WHERE meta.ResourceClaimId = resource_claim_id)  THEN
		 RETURN QUERY(SELECT xmlElement(name "Action", xmlattributes(a.name , a.validationRuleSet),xmlagg(CAST(x AS XML))) 
			FROM
			( SELECT DISTINCT a.ActionName AS "name",			
			format('<AuthorizationStrategies> %1$s </AuthorizationStrategies>',dbo.GetResourceClaimActionAuthorizationStrategies(meta.ResourceClaimActionid))::TEXT x,				
			meta.ValidationRuleSetName AS validationRuleSet
			FROM dbo.ResourceClaimActions meta
			INNER JOIN dbo.Actions a ON 
				meta.ActionId = a.ActionId
			WHERE 
				meta.ResourceClaimId = resource_claim_id				
			ORDER BY a.ActionName ) a
			GROUP BY a.name, a.validationRuleSet) ;
	ELSE
	RETURN QUERY (SELECT null::XML) ;
  END IF;
END
$$
LANGUAGE plpgsql;

--select * from dbo.GetResourceClaimAction(178);
--select * from dbo.GetResourceClaimAction(223);

DROP FUNCTION IF EXISTS dbo.GetResourceClaim;
CREATE OR REPLACE FUNCTION dbo.GetResourceClaim (parent_resource_claim_id INT) 
RETURNS SETOF XML 
AS
$$
BEGIN
 IF EXISTS  (SELECT  1 FROM  dbo.ResourceClaims Claim WHERE Claim.ParentResourceClaimId = parent_resource_claim_id)  THEN
    RETURN QUERY (	SELECT xmlelement(name "Claim", 
						  xmlattributes(a.claimId,a.name), 
						  CASE 
						  WHEN (a.DefaultAuthorization ::TEXT <> '') IS NOT TRUE  THEN xmlagg(a.DefaultAuthorization::xml)
						  ELSE  xmlelement(name "DefaultAuthorization",  xmlagg(a.DefaultAuthorization::XML))
						  END,
					  	  CASE 
						  WHEN (a.ClaimSets ::TEXT <> '') IS NOT TRUE  THEN xmlagg(a.ClaimSets::xml)
						  ELSE  xmlelement(name "ClaimSets",xmlagg(a.ClaimSets::XML))
						  END,
					  	  CASE 
						  WHEN (a.Claims ::TEXT <> '') IS NOT TRUE  THEN xmlagg(a.Claims::xml)
						  ELSE  xmlelement(name "Claims",xmlagg(a.Claims::XML))
						  END)
				FROM (
					SELECT Claim.ClaimName as "name",  Claim.ResourceClaimId as claimId,
					dbo.GetResourceClaimAction(Claim.ResourceClaimId)::TEXT as DefaultAuthorization,
					dbo.GetClaimSetWithActions(Claim.ResourceClaimId)::TEXT as ClaimSets,
					dbo.GetResourceClaim(Claim.ResourceClaimId)::TEXT AS Claims
					FROM dbo.ResourceClaims Claim
					WHERE Claim.ParentResourceClaimId = parent_resource_claim_id) a
     				GROUP BY a.name, a.claimId,a.DefaultAuthorization,a.ClaimSets,a.Claims
		    		ORDER BY  a.claimId
		  );
ELSE
	RETURN QUERY (SELECT null::XML) ;
END IF;
END;
$$
LANGUAGE plpgsql;

--select * from dbo.GetResourceClaim(1);
--select * from dbo.GetResourceClaim(223);

CREATE OR REPLACE FUNCTION dbo.GetAuthorizationMetadataDocument() 
RETURNS XML 
AS
$$
BEGIN
	RETURN (
		SELECT 
			xmlelement(name "SecurityMetadata", null, xmlelement(name "Claims", null, xmlagg(claims)))
		FROM
		(SELECT xmlelement(name "Claim", 
						  xmlattributes(a.name),
						 xmlelement(name "DefaultAuthorization", null, xmlagg(a.DefaultAuthorization)),
						 xmlelement(name "ClaimSets", null, xmlagg(a.ClaimSets)),
						 xmlelement(name "Claims", null, xmlagg(a.Claims))) as Claims
		FROM
		(SELECT
            Claim.ClaimName as "name",
            dbo.GetResourceClaimAction(Claim.ResourceClaimId) as DefaultAuthorization,
            dbo.GetClaimSetWithActions(Claim.ResourceClaimId) as ClaimSets,
            dbo.GetResourceClaim(Claim.ResourceClaimId) AS Claims
        FROM dbo.ResourceClaims Claim
        WHERE Claim.ParentResourceClaimId IS NULL
		ORDER BY Claim.ClaimName) a
		GROUP BY a.name) b
	);
END
$$
LANGUAGE plpgsql;

select dbo.GetAuthorizationMetadataDocument();