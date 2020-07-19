
DO $$
DECLARE
    _applicationId INTEGER;
    _claimId INTEGER;
    _claimName VARCHAR(2048);
    _parentResourceClaimId INTEGER;
    _existingParentResourceClaimId INTEGER;
    _claimSetId INTEGER;
    _claimSetName VARCHAR(255);
    _authorizationStrategyId INTEGER;
    -- Well-known values
    _createActionId INTEGER := 1;
    _readActionId INTEGER := 2;
    _updateActionId INTEGER := 3;
    _deleteActionId INTEGER := 4;
    _claimIdStack INTEGER ARRAY;
BEGIN
    SELECT applicationid INTO _applicationId
    FROM dbo.applications WHERE ApplicationName = 'Ed-Fi ODS API';


    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of root
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('tpdm', 'tpdm', 'http://ed-fi.org/ods/identity/claims/domains/tpdm', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/domains/tpdm
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Ed-Fi Sandbox'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimSetName := 'Ed-Fi Sandbox';
    _claimSetId := NULL;

    SELECT ClaimSetId INTO _claimSetId
    FROM dbo.ClaimSets
    WHERE ClaimSetName = _claimSetName;

    IF _claimSetId IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', _claimSetName;

        INSERT INTO dbo.ClaimSets(ClaimSetName, Application_ApplicationId)
        VALUES (_claimSetName, _applicationId)
        RETURNING ClaimSetId
        INTO _claimSetId;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ') on resource claim ''' || _claimName || '''.';
    DELETE FROM dbo.ClaimSetResourceClaims
    WHERE ClaimSet_ClaimSetId = _claimSetId AND ResourceClaim_ResourceClaimId = _claimId;
    

    -- Claim set-specific Create authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _CreateActionId, _authorizationStrategyId); -- Create

    -- Claim set-specific Read authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _ReadActionId, _authorizationStrategyId); -- Read

    -- Claim set-specific Update authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _UpdateActionId, _authorizationStrategyId); -- Update

    -- Claim set-specific Delete authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _DeleteActionId, _authorizationStrategyId); -- Delete
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('performanceEvaluation', 'performanceEvaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluation', 'evaluation', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationObjective', 'evaluationObjective', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationElement', 'evaluationElement', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('rubricDimension', 'rubricDimension', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('quantitativeMeasure', 'quantitativeMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasure', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationRating', 'evaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationObjectiveRating', 'evaluationObjectiveRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationElementRating', 'evaluationElementRating', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('quantitativeMeasureScore', 'quantitativeMeasureScore', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureScore', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('performanceEvaluationRating', 'performanceEvaluationRating', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/goal'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/goal';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('goal', 'goal', 'http://ed-fi.org/ods/identity/claims/tpdm/goal', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/credentials'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/credentials';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('credentials', 'credentials', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/credentials', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Namespace Based';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Namespace Based''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Namespace Based';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Namespace Based''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Namespace Based';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Namespace Based''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Namespace Based';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Namespace Based''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/credentials
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certification'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certification';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certification', 'certification', 'http://ed-fi.org/ods/identity/claims/tpdm/certification', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationExam', 'certificationExam', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExam', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationExamResult', 'certificationExamResult', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamResult', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('credentialEvent', 'credentialEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/professionalDevelopment'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/professionalDevelopment';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('professionalDevelopment', 'professionalDevelopment', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/professionalDevelopment', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/professionalDevelopment
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('professionalDevelopmentEvent', 'professionalDevelopmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEventAttendance'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEventAttendance';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('professionalDevelopmentEventAttendance', 'professionalDevelopmentEventAttendance', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentEventAttendance', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/recruiting'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/recruiting';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('recruiting', 'recruiting', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/recruiting', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'Relationships with Education Organizations only';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''Relationships with Education Organizations only''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/recruiting
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/application'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/application';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('application', 'application', 'http://ed-fi.org/ods/identity/claims/tpdm/application', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicationEvent', 'applicationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('openStaffPositionEvent', 'openStaffPositionEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('recruitmentEvent', 'recruitmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/noFurtherAuthorizationRequiredData'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/noFurtherAuthorizationRequiredData';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('noFurtherAuthorizationRequiredData', 'noFurtherAuthorizationRequiredData', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/noFurtherAuthorizationRequiredData', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/noFurtherAuthorizationRequiredData
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/personRoleAssociations'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/personRoleAssociations';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('personRoleAssociations', 'personRoleAssociations', 'http://ed-fi.org/ods/identity/claims/domains/personRoleAssociations', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/personRoleAssociations
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicantProspectAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicantProspectAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicantProspectAssociation', 'applicantProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/applicantProspectAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/completerAsStaffAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/completerAsStaffAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('completerAsStaffAssociation', 'completerAsStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/completerAsStaffAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffApplicantAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffApplicantAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffApplicantAssociation', 'staffApplicantAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffApplicantAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffProspectAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffProspectAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffProspectAssociation', 'staffProspectAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffProspectAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStaffAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStaffAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateStaffAssociation', 'teacherCandidateStaffAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStaffAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherPreparationProviderProgram', 'teacherPreparationProviderProgram', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Bootstrap Descriptors and EdOrgs'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimSetName := 'Bootstrap Descriptors and EdOrgs';
    _claimSetId := NULL;

    SELECT ClaimSetId INTO _claimSetId
    FROM dbo.ClaimSets
    WHERE ClaimSetName = _claimSetName;

    IF _claimSetId IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', _claimSetName;

        INSERT INTO dbo.ClaimSets(ClaimSetName, Application_ApplicationId)
        VALUES (_claimSetName, _applicationId)
        RETURNING ClaimSetId
        INTO _claimSetId;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ') on resource claim ''' || _claimName || '''.';
    DELETE FROM dbo.ClaimSetResourceClaims
    WHERE ClaimSet_ClaimSetId = _claimSetId AND ResourceClaim_ResourceClaimId = _claimId;
    

    -- Claim set-specific Create authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _CreateActionId, _authorizationStrategyId); -- Create
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/staffPreparation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/staffPreparation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffPreparation', 'staffPreparation', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/staffPreparation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/staffPreparation
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasure'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasure';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffStudentGrowthMeasure', 'staffStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasure', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureCourseAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureCourseAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffStudentGrowthMeasureCourseAssociation', 'staffStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureCourseAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureEducationOrganizationAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureEducationOrganizationAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffStudentGrowthMeasureEducationOrganizationAssociation', 'staffStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureEducationOrganizationAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureSectionAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureSectionAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffStudentGrowthMeasureSectionAssociation', 'staffStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffStudentGrowthMeasureSectionAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffTeacherPreparationProviderAssociation', 'staffTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderProgramAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderProgramAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('staffTeacherPreparationProviderProgramAssociation', 'staffTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/staffTeacherPreparationProviderProgramAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/teacherCandidatePreparation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/teacherCandidatePreparation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidatePreparation', 'teacherCandidatePreparation', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/teacherCandidatePreparation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/teacherCandidatePreparation
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateAcademicRecord'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateAcademicRecord';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateAcademicRecord', 'teacherCandidateAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateAcademicRecord', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCourseTranscript'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCourseTranscript';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateCourseTranscript', 'teacherCandidateCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCourseTranscript', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasure'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasure';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateStudentGrowthMeasure', 'teacherCandidateStudentGrowthMeasure', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasure', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureCourseAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureCourseAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateStudentGrowthMeasureCourseAssociation', 'teacherCandidateStudentGrowthMeasureCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureCourseAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureEducationOrganizationAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureSectionAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureSectionAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateStudentGrowthMeasureSectionAssociation', 'teacherCandidateStudentGrowthMeasureSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateStudentGrowthMeasureSectionAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateTeacherPreparationProviderAssociation', 'teacherCandidateTeacherPreparationProviderAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderProgramAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderProgramAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateTeacherPreparationProviderProgramAssociation', 'teacherCandidateTeacherPreparationProviderProgramAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateTeacherPreparationProviderProgramAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/students'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/students';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('students', 'students', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/students', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/students
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperience'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperience';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('fieldworkExperience', 'fieldworkExperience', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperience', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperienceSectionAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperienceSectionAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('fieldworkExperienceSectionAssociation', 'fieldworkExperienceSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkExperienceSectionAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/employment'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/employment';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employment', 'employment', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/employment', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/employment
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employmentEvent', 'employmentEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationEvent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationEvent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employmentSeparationEvent', 'employmentSeparationEvent', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationEvent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/anonymizedStudentAcademics'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/anonymizedStudentAcademics';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentAcademics', 'anonymizedStudentAcademics', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/anonymizedStudentAcademics', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/anonymizedStudentAcademics
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudent'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudent';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudent', 'anonymizedStudent', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudent', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAcademicRecord'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAcademicRecord';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentAcademicRecord', 'anonymizedStudentAcademicRecord', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAcademicRecord', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessment'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessment';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentAssessment', 'anonymizedStudentAssessment', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessment', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentCourseAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentCourseAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentAssessmentCourseAssociation', 'anonymizedStudentAssessmentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentCourseAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentSectionAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentSectionAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentAssessmentSectionAssociation', 'anonymizedStudentAssessmentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentAssessmentSectionAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentCourseAssociation', 'anonymizedStudentCourseAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseTranscript'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseTranscript';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentCourseTranscript', 'anonymizedStudentCourseTranscript', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentCourseTranscript', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentEducationOrganizationAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentEducationOrganizationAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentEducationOrganizationAssociation', 'anonymizedStudentEducationOrganizationAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentEducationOrganizationAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentSectionAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentSectionAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('anonymizedStudentSectionAssociation', 'anonymizedStudentSectionAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/anonymizedStudentSectionAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('systemDescriptors', 'systemDescriptors', 'http://ed-fi.org/ods/identity/claims/domains/systemDescriptors', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/systemDescriptors
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('descriptors', 'descriptors', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Ed-Fi Sandbox'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimSetName := 'Ed-Fi Sandbox';
    _claimSetId := NULL;

    SELECT ClaimSetId INTO _claimSetId
    FROM dbo.ClaimSets
    WHERE ClaimSetName = _claimSetName;

    IF _claimSetId IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', _claimSetName;

        INSERT INTO dbo.ClaimSets(ClaimSetName, Application_ApplicationId)
        VALUES (_claimSetName, _applicationId)
        RETURNING ClaimSetId
        INTO _claimSetId;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ') on resource claim ''' || _claimName || '''.';
    DELETE FROM dbo.ClaimSetResourceClaims
    WHERE ClaimSet_ClaimSetId = _claimSetId AND ResourceClaim_ResourceClaimId = _claimId;
    

    -- Claim set-specific Create authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _CreateActionId, _authorizationStrategyId); -- Create

    -- Claim set-specific Read authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _ReadActionId, _authorizationStrategyId); -- Read

    -- Claim set-specific Update authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _UpdateActionId, _authorizationStrategyId); -- Update

    -- Claim set-specific Delete authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _DeleteActionId, _authorizationStrategyId); -- Delete
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/accreditationStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/accreditationStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('accreditationStatusDescriptor', 'accreditationStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/accreditationStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('aidTypeDescriptor', 'aidTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventResultDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventResultDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicationEventResultDescriptor', 'applicationEventResultDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventResultDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicationEventTypeDescriptor', 'applicationEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationEventTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicationSourceDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicationSourceDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicationSourceDescriptor', 'applicationSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationSourceDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicationStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicationStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicationStatusDescriptor', 'applicationStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/applicationStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('backgroundCheckStatusDescriptor', 'backgroundCheckStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('backgroundCheckTypeDescriptor', 'backgroundCheckTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/backgroundCheckTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationExamStatusDescriptor', 'certificationExamStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationExamTypeDescriptor', 'certificationExamTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationExamTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationFieldDescriptor', 'certificationFieldDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationFieldDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationLevelDescriptor', 'certificationLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationRouteDescriptor', 'certificationRouteDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('certificationStandardDescriptor', 'certificationStandardDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/certificationStandardDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('coteachingStyleObservedDescriptor', 'coteachingStyleObservedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('credentialEventTypeDescriptor', 'credentialEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialEventTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('credentialStatusDescriptor', 'credentialStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('degreeDescriptor', 'degreeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/degreeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('educatorRoleDescriptor', 'educatorRoleDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEventTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEventTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employmentEventTypeDescriptor', 'employmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentEventTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationReasonDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationReasonDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employmentSeparationReasonDescriptor', 'employmentSeparationReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationReasonDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('employmentSeparationTypeDescriptor', 'employmentSeparationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/employmentSeparationTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('englishLanguageExamDescriptor', 'englishLanguageExamDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationElementRatingLevelDescriptor', 'evaluationElementRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationPeriodDescriptor', 'evaluationPeriodDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationRatingLevelDescriptor', 'evaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('evaluationTypeDescriptor', 'evaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/federalLocaleCodeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/federalLocaleCodeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('federalLocaleCodeDescriptor', 'federalLocaleCodeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/federalLocaleCodeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('fieldworkTypeDescriptor', 'fieldworkTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fieldworkTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/fundingSourceDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/fundingSourceDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('fundingSourceDescriptor', 'fundingSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/fundingSourceDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('genderDescriptor', 'genderDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('goalTypeDescriptor', 'goalTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/goalTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/hireStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/hireStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('hireStatusDescriptor', 'hireStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hireStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/hiringSourceDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/hiringSourceDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('hiringSourceDescriptor', 'hiringSourceDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/hiringSourceDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('instructionalSettingDescriptor', 'instructionalSettingDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/instructionalSettingDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/internalExternalHireDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/internalExternalHireDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('internalExternalHireDescriptor', 'internalExternalHireDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/internalExternalHireDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/levelOfDegreeAwardedDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/levelOfDegreeAwardedDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('levelOfDegreeAwardedDescriptor', 'levelOfDegreeAwardedDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/levelOfDegreeAwardedDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('objectiveRatingLevelDescriptor', 'objectiveRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('openStaffPositionEventStatusDescriptor', 'openStaffPositionEventStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('openStaffPositionEventTypeDescriptor', 'openStaffPositionEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionEventTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionReasonDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionReasonDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('openStaffPositionReasonDescriptor', 'openStaffPositionReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/openStaffPositionReasonDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('performanceEvaluationRatingLevelDescriptor', 'performanceEvaluationRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('performanceEvaluationTypeDescriptor', 'performanceEvaluationTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/previousCareerDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/previousCareerDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('previousCareerDescriptor', 'previousCareerDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/previousCareerDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentOfferedByDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentOfferedByDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('professionalDevelopmentOfferedByDescriptor', 'professionalDevelopmentOfferedByDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/professionalDevelopmentOfferedByDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/programGatewayDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/programGatewayDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('programGatewayDescriptor', 'programGatewayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/programGatewayDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/prospectTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/prospectTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('prospectTypeDescriptor', 'prospectTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/prospectTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('quantitativeMeasureDatatypeDescriptor', 'quantitativeMeasureDatatypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureDatatypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('quantitativeMeasureTypeDescriptor', 'quantitativeMeasureTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/quantitativeMeasureTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEventTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEventTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('recruitmentEventTypeDescriptor', 'recruitmentEventTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/recruitmentEventTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('rubricRatingLevelDescriptor', 'rubricRatingLevelDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/salaryTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/salaryTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('salaryTypeDescriptor', 'salaryTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/salaryTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/schoolStatusDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/schoolStatusDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('schoolStatusDescriptor', 'schoolStatusDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/schoolStatusDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/studentGrowthTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/studentGrowthTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('studentGrowthTypeDescriptor', 'studentGrowthTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/studentGrowthTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCharacteristicDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCharacteristicDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidateCharacteristicDescriptor', 'teacherCandidateCharacteristicDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidateCharacteristicDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProgramTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProgramTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherPreparationProgramTypeDescriptor', 'teacherPreparationProgramTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProgramTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/tPPDegreeTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/tPPDegreeTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('tPPDegreeTypeDescriptor', 'tPPDegreeTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tPPDegreeTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/tPPProgramPathwayDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/tPPProgramPathwayDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('tPPProgramPathwayDescriptor', 'tPPProgramPathwayDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/tPPProgramPathwayDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/valueTypeDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/valueTypeDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('valueTypeDescriptor', 'valueTypeDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/valueTypeDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/withdrawReasonDescriptor'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/withdrawReasonDescriptor';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('withdrawReasonDescriptor', 'withdrawReasonDescriptor', 'http://ed-fi.org/ods/identity/claims/tpdm/withdrawReasonDescriptor', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('educationOrganizations', 'educationOrganizations', 'http://ed-fi.org/ods/identity/claims/domains/educationOrganizations', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/educationOrganizations
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProvider'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProvider';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherPreparationProvider', 'teacherPreparationProvider', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProvider', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/university'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/university';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('university', 'university', 'http://ed-fi.org/ods/identity/claims/tpdm/university', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/people'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/people';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('people', 'people', 'http://ed-fi.org/ods/identity/claims/domains/people', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/people
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/tpdm/people'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/tpdm/people';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('people', 'people', 'http://ed-fi.org/ods/identity/claims/domains/tpdm/people', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Setting default authorization metadata
    RAISE NOTICE USING MESSAGE = 'Deleting default action authorizations for resource claim ''' || _claimName || ''' (claimId=' || _claimId || ').';
    DELETE FROM dbo.ResourceClaimAuthorizationMetadatas
    WHERE ResourceClaim_ResourceClaimId = _claimId;
    
    -- Default Create authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _CreateActionId, _authorizationStrategyId);

    -- Default Read authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _ReadActionId, _authorizationStrategyId);

    -- Default Update authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _UpdateActionId, _authorizationStrategyId);

    -- Default Delete authorization
    _authorizationStrategyId := NULL;

    SELECT a.AuthorizationStrategyId INTO _authorizationStrategyId
    FROM    dbo.AuthorizationStrategies a
    WHERE   a.DisplayName = 'No Further Authorization Required';

    IF _authorizationStrategyId IS NULL THEN
        RAISE EXCEPTION USING MESSAGE = 'AuthorizationStrategy does not exist: ''No Further Authorization Required''';
    END IF;

    INSERT INTO dbo.ResourceClaimAuthorizationMetadatas(ResourceClaim_ResourceClaimId, Action_ActionId, AuthorizationStrategy_AuthorizationStrategyId)
    VALUES (_claimId, _DeleteActionId, _authorizationStrategyId);

    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/tpdm/people
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidate'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidate';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherCandidate', 'teacherCandidate', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherCandidate', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/applicant'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/applicant';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('applicant', 'applicant', 'http://ed-fi.org/ods/identity/claims/tpdm/applicant', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/prospect'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/prospect';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('prospect', 'prospect', 'http://ed-fi.org/ods/identity/claims/tpdm/prospect', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/domains/surveyDomain'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/domains/surveyDomain';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('surveyDomain', 'surveyDomain', 'http://ed-fi.org/ods/identity/claims/domains/surveyDomain', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/domains/surveyDomain
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Ed-Fi Sandbox'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimSetName := 'Ed-Fi Sandbox';
    _claimSetId := NULL;

    SELECT ClaimSetId INTO _claimSetId
    FROM dbo.ClaimSets
    WHERE ClaimSetName = _claimSetName;

    IF _claimSetId IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', _claimSetName;

        INSERT INTO dbo.ClaimSets(ClaimSetName, Application_ApplicationId)
        VALUES (_claimSetName, _applicationId)
        RETURNING ClaimSetId
        INTO _claimSetId;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ') on resource claim ''' || _claimName || '''.';
    DELETE FROM dbo.ClaimSetResourceClaims
    WHERE ClaimSet_ClaimSetId = _claimSetId AND ResourceClaim_ResourceClaimId = _claimId;
    

    -- Claim set-specific Create authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _CreateActionId, _authorizationStrategyId); -- Create

    -- Claim set-specific Read authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _ReadActionId, _authorizationStrategyId); -- Read

    -- Claim set-specific Update authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _UpdateActionId, _authorizationStrategyId); -- Update

    -- Claim set-specific Delete authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _DeleteActionId, _authorizationStrategyId); -- Delete
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of http://ed-fi.org/ods/identity/claims/domains/surveyDomain
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'https://ed-fi.org/ods/identity/claims/domains/tpdm/survey'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'https://ed-fi.org/ods/identity/claims/domains/tpdm/survey';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('survey', 'survey', 'https://ed-fi.org/ods/identity/claims/domains/tpdm/survey', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Push claimId to the stack
    _claimIdStack := array_append(_claimIdStack, _claimId);

    -- Processing children of https://ed-fi.org/ods/identity/claims/domains/tpdm/survey
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('surveySectionAggregateResponse', 'surveySectionAggregateResponse', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionAggregateResponse', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('surveyResponseTeacherCandidateTargetAssociation', 'surveyResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveyResponseTeacherCandidateTargetAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('surveySectionResponseTeacherCandidateTargetAssociation', 'surveySectionResponseTeacherCandidateTargetAssociation', 'http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponseTeacherCandidateTargetAssociation', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);


    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/graduationPlan'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/graduationPlan';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('graduationPlan', 'graduationPlan', 'http://ed-fi.org/ods/identity/claims/graduationPlan', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  
    -- Processing claimsets for http://ed-fi.org/ods/identity/claims/graduationPlan
    ----------------------------------------------------------------------------------------------------------------------------
    -- Claim set: 'Ed-Fi Sandbox'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimSetName := 'Ed-Fi Sandbox';
    _claimSetId := NULL;

    SELECT ClaimSetId INTO _claimSetId
    FROM dbo.ClaimSets
    WHERE ClaimSetName = _claimSetName;

    IF _claimSetId IS NULL THEN
        RAISE NOTICE 'Creating new claim set: %', _claimSetName;

        INSERT INTO dbo.ClaimSets(ClaimSetName, Application_ApplicationId)
        VALUES (_claimSetName, _applicationId)
        RETURNING ClaimSetId
        INTO _claimSetId;
    END IF;

  
    RAISE NOTICE USING MESSAGE = 'Deleting existing actions for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ') on resource claim ''' || _claimName || '''.';
    DELETE FROM dbo.ClaimSetResourceClaims
    WHERE ClaimSet_ClaimSetId = _claimSetId AND ResourceClaim_ResourceClaimId = _claimId;
    

    -- Claim set-specific Create authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Create'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _CreateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _CreateActionId, _authorizationStrategyId); -- Create

    -- Claim set-specific Read authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Read'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _ReadActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _ReadActionId, _authorizationStrategyId); -- Read

    -- Claim set-specific Update authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Update'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _UpdateActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _UpdateActionId, _authorizationStrategyId); -- Update

    -- Claim set-specific Delete authorization
    _authorizationStrategyId := NULL;
    

    IF _authorizationStrategyId IS NULL THEN
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ').';
    ELSE
        RAISE NOTICE USING MESSAGE = 'Creating ''Delete'' action for claim set ''' || _claimSetName || ''' (claimSetId=' || _claimSetId || ', actionId = ' || _DeleteActionId || ', authorizationStrategyId = ' || _authorizationStrategyId || ').';
    END IF;

    INSERT INTO dbo.ClaimSetResourceClaims(ResourceClaim_ResourceClaimId, ClaimSet_ClaimSetId, Action_ActionId, AuthorizationStrategyOverride_AuthorizationStrategyId)
    VALUES (_claimId, _claimSetId, _DeleteActionId, _authorizationStrategyId); -- Delete
    ----------------------------------------------------------------------------------------------------------------------------
    -- Resource Claim: 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram'
    ----------------------------------------------------------------------------------------------------------------------------
    _claimName := 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram';
    _claimId := NULL;

    SELECT ResourceClaimId, ParentResourceClaimId INTO _claimId, _existingParentResourceClaimId
    FROM dbo.ResourceClaims
    WHERE ClaimName = _claimName;

    _parentResourceClaimId := _claimIdStack[array_upper(_claimIdStack, 1)];

    IF _claimId IS NULL THEN
        RAISE NOTICE 'Creating new claim: %', _claimName;

        INSERT INTO dbo.ResourceClaims(DisplayName, ResourceName, ClaimName, ParentResourceClaimId, Application_ApplicationId)
        VALUES ('teacherPreparationProviderProgram', 'teacherPreparationProviderProgram', 'http://ed-fi.org/ods/identity/claims/tpdm/teacherPreparationProviderProgram', _parentResourceClaimId, _applicationId)
        RETURNING ResourceClaimId
        INTO _claimId;
    ELSE
        IF _parentResourceClaimId != _existingParentResourceClaimId THEN
            RAISE NOTICE USING MESSAGE = 'Repointing claim ''' || _claimName || ''' (ResourceClaimId=' || _claimId || ') to new parent (ResourceClaimId=' || _parentResourceClaimId || ')';

            UPDATE dbo.ResourceClaims
            SET ParentResourceClaimId = _parentResourceClaimId
            WHERE ResourceClaimId = _claimId;
        END IF;
    END IF;
  

    -- Pop the stack
    _claimIdStack := (select _claimIdStack[1:array_upper(_claimIdStack, 1) - 1]);

END $$;
