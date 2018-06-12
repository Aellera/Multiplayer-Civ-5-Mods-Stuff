
-- EraVariation must be set to 0 because it otherwise overrides cultural variation
UPDATE Units
SET UnitArtInfoCulturalVariation = '1', UnitArtInfoEraVariation = '0' WHERE Type IN (SELECT UnitType FROM ModData_PonyUnits);

INSERT INTO ArtDefine_UnitInfos	
			(Type,				DamageStates, Formation, IconAtlas,	PortraitIndex)
SELECT		Type || '_PONY',	DamageStates, Formation, IconAtlas, PortraitIndex
FROM		ArtDefine_UnitInfos WHERE Type IN (SELECT UnitArtDef FROM ModData_PonyUnits);

INSERT INTO ArtDefine_UnitInfoMemberInfos	
			(UnitInfoType,			UnitMemberInfoType,			 NumMembers)
SELECT		UnitArtDef || '_PONY', UnitMemberArtDef || '_PONY', NumMembers
FROM		ModData_PonyUnits;

INSERT INTO ArtDefine_UnitMemberInfos	
			(Type,						Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		UnitMemberArtDef || '_PONY', Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM		ModData_PonyUnits;

---base model use for caravan---
INSERT INTO ArtDefine_UnitInfoMemberInfos	
			(UnitInfoType,					UnitMemberInfoType,				NumMembers)
VALUES		('ART_DEF_UNIT_CARAVAN_PONY',	'ART_DEF_UNIT_MEMBER_CARAVAN_F1',	1),
			('ART_DEF_UNIT_CARAVAN_PONY',	'ART_DEF_UNIT_MEMBER_CARAVAN_F2',	1); 

---animation height correction---
----base ZOffset correction 7.3264; modify for scale----
UPDATE ArtDefine_UnitMemberInfos SET ZOffset='4.39584' WHERE Type='ART_DEF_UNIT_MEMBER_GREAT_GENERAL_PONY';
UPDATE ArtDefine_UnitMemberInfos SET ZOffset='3.6632' WHERE Type='ART_DEF_UNIT_MEMBER_GREAT_PROPHET_PONY';
UPDATE ArtDefine_UnitMemberInfos SET ZOffset='3.6632' WHERE Type='ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_PONY';

----------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitMemberCombats	
			(UnitMemberType,			EnableActions,	ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax,  TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasOpponentTracking, RushAttackFormation)
SELECT		UnitMemberType || '_PONY',	EnableActions,	ShortMoveRadius, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax,  TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasOpponentTracking, RushAttackFormation
FROM		ArtDefine_UnitMemberCombats WHERE UnitMemberType IN(SELECT UnitMemberArtDef FROM ModData_PonyUnits);

INSERT INTO ArtDefine_UnitMemberCombats	
			(UnitMemberType,					EnableActions,		HasRefaceAfterCombat)
VALUES		('ART_DEF_UNIT_MEMBER_WORKER_PONY',	'Idle Death BombardDefend Run',		1);

----------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius)
SELECT		UnitMemberType || '_PONY',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, '0.14',		 HitRadius, '0.14',						AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag, MissTargetSlopRadius
FROM		ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType IN(SELECT UnitMemberArtDef FROM ModData_PonyUnits);