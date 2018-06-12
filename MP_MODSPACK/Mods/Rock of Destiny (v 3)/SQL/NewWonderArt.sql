INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_ROCKDESTINY', 'Improvement', 'ROCK_DESTINY';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT 'Any', 'UnderConstruction', 1.0,  'ART_DEF_IMPROVEMENT_ROCKDESTINY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'feature_rockdestiny.fxsxml', 1 UNION ALL
SELECT 'Any', 'Constructed',       1.0,  'ART_DEF_IMPROVEMENT_ROCKDESTINY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'feature_rockdestiny.fxsxml',    1 UNION ALL
SELECT 'Any', 'Pillaged',          1.0,  'ART_DEF_IMPROVEMENT_ROCKDESTINY', 'SNAPSHOT', 'ART_DEF_RESOURCE_ALL', 'feature_rockdestiny.fxsxml', 1;