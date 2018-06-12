
-- EraVariation must be set to 0 because it otherwise overrides cultural variation
UPDATE Units
SET UnitArtInfoCulturalVariation = '1', UnitArtInfoEraVariation = '0' WHERE Type IN (SELECT UnitType FROM ModData_ChangelingUnits);

INSERT INTO ArtDefine_UnitInfos	
			(Type,				DamageStates, Formation, IconAtlas,	PortraitIndex)
SELECT		Type || '_LING',	DamageStates, Formation, IconAtlas, PortraitIndex
FROM		ArtDefine_UnitInfos WHERE Type IN (SELECT UnitArtDef FROM ModData_ChangelingUnits);

INSERT INTO ArtDefine_UnitInfoMemberInfos	
			(UnitInfoType,			UnitMemberInfoType,			 NumMembers)
SELECT		UnitArtDef || '_LING', UnitMemberArtDef || '_LING', NumMembers
FROM		ModData_ChangelingUnits;

INSERT INTO ArtDefine_UnitMemberInfos	
			(Type,						Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		UnitMemberArtDef || '_LING', Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM		ModData_ChangelingUnits;

---animation height correction---
----base ZOffset correction 7.3264; modify for scale----
UPDATE ArtDefine_UnitMemberInfos SET ZOffset='3.6632' WHERE Type='ART_DEF_UNIT_MEMBER_GREAT_GENERAL_LING';
UPDATE ArtDefine_UnitMemberInfos SET ZOffset='3.6632' WHERE Type='ART_DEF_UNIT_MEMBER_GREAT_PROPHET_LING';

----------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitMemberCombats	
			(UnitMemberType,			EnableActions,	ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax,  TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasOpponentTracking)
SELECT		UnitMemberType || '_LING',	EnableActions,	ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax,  TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasOpponentTracking
FROM		ArtDefine_UnitMemberCombats WHERE UnitMemberType IN(SELECT UnitMemberArtDef FROM ModData_ChangelingUnits);

INSERT INTO ArtDefine_UnitMemberCombats	
			(UnitMemberType,					EnableActions,		HasRefaceAfterCombat)
VALUES		('ART_DEF_UNIT_MEMBER_WORKER_LING',	'Idle Death BombardDefend Run',		1);

----------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
SELECT		UnitMemberType || '_LING',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, '0.14',		 HitRadius, '0.14', AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius
FROM		ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType IN(SELECT UnitMemberArtDef FROM ModData_ChangelingUnits);