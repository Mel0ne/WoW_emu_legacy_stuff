<?php
// dbc format v4.0.0
if(!defined('INDEX_PRIMORY_KEY')){
	define('INDEX_PRIMORY_KEY',1);
}
$DBCstruct = array(
'Achievement' => array( // rows: 2533, cols: 14
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'factionFlag',							// 1	int32	m_faction -1=all, 0=horde, 1=alliance
	2 => 'mapId',								// 2	int32	m_instance_Id -1=none
	3 => 'parentAchievement',					// 3	uint32	m_supercedes its Achievement parent (can`t start while parent uncomplete, use its Criteria if don`t have own, use its progress on begin)
	4 => 'name',						 		// 4	string	m_title_lang
	5 => 'description',							// 5	char*	m_description_lang
	6 => 'categoryId',							// 6	uint32	m_category
	7 => 'points',								// 7	uint32	m_points
	8 => 'OrderInCategory',						// 8	uint32	m_ui_order
	9 => 'flags',								// 9	uint32	m_flags
	10=> 'icon',								// 10	uint32	m_iconId
	11=> 'titleReward',							// 11	char*	m_reward_lang
	12=> 'count',								// 12	uint32	m_minimum_criteria - need this count of completed criterias (own or referenced achievement criterias)
	13=> 'refAchievement'						// 13	uint32	m_shares_criteria - referenced achievement (counting of all completed criterias)
),
'Achievement_Category' => array( // rows: 106, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'parentCategory',						// 1	uint32	m_parent -1 for main category
	2 => 'name',								// 2	char*	m_name_lang
	3 => 'sortOrder'							// 3	uint32	m_ui_order
),
'Achievement_Criteria' => array( // rows: 10292, cols: 23
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'referredAchievement',					// 1	uint32	m_achievement_Id
	2 => 'requiredType',						// 2	uint32	m_type
	3 => array('paramAchiev',6),				// 3-8	uint32	m_param (параметры критериев ачив)
	9 => 'name',								// 9	uint32	m_description_lang
	10=> 'completionFlag',						// 10	uint32	m_flags
	11=> 'timedCriteriaStartType',				// 11	uint32	m_timer_start_event Only appears with timed achievements, seems to be the type of starting a timed Achievement, only type 1 and some of type 6 need manual starting
												//				1: ByEventId(?) (serversIde Ids),	2: ByQuestId,	5: ByCastSpellId(?)
												//				6: BySpellIdTarget(some of these are unknown spells, some not, some maybe spells)
												//				7: ByKillNpcId,	9: ByUseItemId
	12=> 'timedCriteriaMiscId',					// 12	uint32	m_timer_asset_Id Alway appears with timed events, used internally to start the achievement, store
	13=> 'timeLimit',							// 13	uint32	m_timer_time time limit in seconds
	14=> 'showOrder',							// 14	uint32	m_ui_order	also used in achievement shift-links as index in state bitmask
												// 15	uint32	only one value, still unknown
												// 16	uint32	all zeros
	17=> array('moreRequirement',3),			// 17-19uint32	
	20=> array('moreRequirementValue',3)		// 20-22uint32	
),
'AnimationData' => array(), // rows: 654, cols: 6
'AnimKit' => array( // rows: 1034, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1
												// 2
),
'AnimKitBoneSet' => array( // rows: 10, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1
												// 2
												// 3
												// 4
												// 5
),
'AnimKitBoneSetAlias' => array( // rows: 10, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	
												// 2	uint32	
),
'AnimKitConfig' => array( // rows: 98, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	
),
'AnimKitConfigBoneSet' => array( // rows: 129, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	
												// 2	uint32	
												// 3	uint32	
),
'AnimKitPriority' => array( // rows: 54, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	
),
'AnimKitSegment' => array(), // rows: 1730, cols: 16
'AnimReplacement' => array(), // rows: 103, cols: 4
'AnimReplacementSet' => array(), // rows: 29, cols: 2
'AreaAssignment' => array(), // rows: 15291, cols: 5
'AreaGroup' => array( // rows: 810, cols: 8
	0 => array('AreaGroupId',INDEX_PRIMORY_KEY),// 0	uint32	m_Id
	1 => array('AreaId',6),						// 1-6	uint32	m_areaId
	7 => 'nextGroup'							// 7	uint32	m_nextAreaId
),
'AreaPOI' => array( // rows: 886, cols: 22
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1-21
),
'AreaPOISortedWorldState' => array(), 	// rows: 5, cols: 3
'AreaTable' => array( // rows: 3163, cols: 26
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'mapId',								// 1	uint32	m_ContinentId
	2 => 'zone',								// 2	uint32	m_ParentAreaId
	3 => 'exploreFlag',							// 3	uint32	m_AreaBit
	4 => 'flags',								// 4	uint32	m_flags
	5 => 'SoundProvIderPref',					// 5	uint32	m_SoundProvIderPref
	6 => 'SoundProvIderPrefUnderwater',			// 6	uint32	m_SoundProvIderPrefUnderwater
	7 => 'AmbienceId',							// 7	uint32	m_AmbienceId
	8 => 'ZoneMusic',							// 8	uint32	m_ZoneMusic
	9 => 'IntroSound',							// 9	uint32	m_IntroSound
	10=> 'area_level',							// 10	uint32	m_ExplorationLevel
	11=> 'area_name',							// 11	string	m_AreaName_lang
	12=> 'team',								// 12	uint32	m_factionGroupMask
	13=> array('iquIdTypeId',4),				// 13-16uint32	m_liquIdTypeId[4]
	17=> 'minElevation',						// 17	uint32	m_minElevation
	18=> 'ambientMultiplier',					// 18	uint32	m_ambient_multiplier
	19=> 'lightId',								// 19	uint32	m_lightId
												// 20	uint32	4.0.0
												// 21	uint32	4.0.0
												// 22	uint32	4.0.0
												// 23	uint32	4.0.0
												// 24	uint32	4.0.1, may be worldStateId
												// 25
),
'AreaTrigger' => array( // rows: 2078, cols: 13
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'mapId',								// 1	uint32	m_ContinentId
	2 => 'x',									// 2	float	m_x
	3 => 'y',							 		// 3	float	m_y
	4 => 'z',							 		// 4	float	m_z
												// 5	uint32
												// 6	uint32
												// 7	uint32
	8 => 'radius',								// 8	uint32	m_radius
	9 => 'box_length',							// 9	uint32	m_box_length
	10=> 'box_wIdth',							// 10	uint32	m_box_wIdth
	11=> 'box_heigh',							// 11	uint32	m_box_heigh
	12=> 'box_yaw'			 					// 12	uint32	m_box_yaw
),
'ArmorLocation' => array( // rows: 23, cols: 6
	0 => array('InventoryType',INDEX_PRIMORY_KEY),// 0	uint32
	1 => array('Value',5)						// 1-5	float	multiplier for armor types (cloth...plate, no armor?)
),
'AttackAnimKits' => array(), // rows: 26, cols: 5
'AttackAnimTypes' => array(), // rows: 7, cols: 2
'AuctionHouse' => array( // rows: 7, cols: 5
	0 => array('houseId',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
	1 => 'faction',								// 1	uint32	m_factionId
	2 => 'depositPercent',						// 2	uint32	m_depositRate
	3 => 'cutPercent',							// 3	uint32	m_consignmentRate
	4 => 'name'									// 4	char*	m_name_lang
),
'BankBagSlotPrices' => array( // rows: 12, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'price'								// 1	uint32	m_Cost
),
'BannedAddOns' => array(), // rows: 114, cols: 11
'BarberShopStyle' => array( // rows: 645, cols: 8
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'type',								// 1	uint32	m_type
	2 => 'DisplayName',							// 2	char*	m_DisplayName_lang
	3 => 'Description',							// 3	uint32	m_Description_lang
	4 => 'CostMultiplier',						// 4	float	m_Cost_Modifier
	5 => 'race',								// 5	uint32	m_race
	6 => 'gender',								// 6	uint32	m_sex
	7 => 'hairId'								// 7	uint32	m_data (real Id to hair/facial hair)
),
'BattlemasterList' => array( // rows: 21, cols: 20
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('mapId',8),						// 1-8	int32	m_mapId[8]
	9 => 'type',								// 9	uint32	m_instanceType
	10=> 'canJoinAsGroup',						// 10	uint32	m_groupsAllowed
	11=> 'name',								// 11	string	m_name_lang
	12=> 'maxGroupSize',						// 12	uint32	m_maxGroupSize
	13=> 'HolIdayWorldStateId',					// 13	uint32	m_holIdayWorldState
	14=> 'minLevel',							// 14	uint32	m_minlevel (sync with PvPDifficulty.dbc content)
	15=> 'maxLevel',							// 15	uint32	m_maxlevel (sync with PvPDifficulty.dbc content)
	16=> 'maxGroupSizeRated',					// 16	uint32	4.0.1
	17=> 'maxPlayers',							// 17	uint32	4.0.1
												// 18	uint32	4.0.3+
												// 19	uint32	4.0.3, value 2 for Rated Battlegrounds
),
'CameraMode' => array(), // rows: 210, cols: 17
'CameraShakes' => array(), // rows: 102, cols: 9(8)
'CastableRaidBuffs' => array(), // rows: 1, cols: 3
'Cfg_Categories' => array( // rows: 49, cols: 5
	0 =>array('catId',INDEX_PRIMORY_KEY),		// 0	uint32	m_Id categoryId (sent in RealmList packet)
	1 => 'localeMask',							// 1	uint32	m_localeMask
	2 => 'charsetMask',							// 2	uint32	m_charsetMask
	3 => 'isTournamentRealm',					// 3	uint32	m_flags
	4 => 'categoryName'							// 4	char*	m_name_lang
),
'Cfg_Configs' => array( // rows: 14, cols: 5
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Type',								// 1	uint32	m_realmType (sent in RealmList packet)
	2 => 'isPvp',								// 2	uint32	m_playerKillingAllowed
	3 => 'isRp',								// 3	uint32	m_roleplaying
												// 4	uint32	
),
'CharacterFacialHairStyles' => array(), // rows: 345, cols: 9(8)
'CharBaseInfo' => array(), // rows: 91, cols: 3(2)
'CharHairGeosets' => array(), // rows: 460, cols: 6
'CharSections' => array(), // rows: 11957, cols: 10
'CharStartOutfit' => array( // rows: 182, cols: 79
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'RaceClassGender',						// 1	uint32	m_raceId m_classId m_sexId m_outfitId (UNIT_FIELD_BYTES_0 & 0x00FFFFFF) comparable (0 byte = race, 1 byte = class, 2 byte = gender)
	2 => array('ItemId',24),					// 2-25	int32	m_ItemId
	26=> array('ItemDisplayId',24),				// 26-49int32	m_DisplayItemId not required at server sIde
	50=> array('ItemInventorySlot',24),			// 50-73int32	m_InventoryType not required at server sIde
												// 74 	uint32	unique values (index-like with gaps ordered in other way as Ids)
												// 75	uint32	
												// 76	uint32	
												// 77	uint32	
												// 78	uint32	
),
'CharTitles' => array( // rows: 191, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'ConditionId',							// 1	uint32	m_Condition_Id
	2 => 'name',								// 2	string	m_name_lang
	3 => 'name2',						 		// 3	char*	m_name1_lang
	4 => 'bitIndex',							// 4	uint32	m_mask_Id used in PLAYER_CHOSEN_TITLE and 1<<index in PLAYER__FIELD_KNOWN_TITLES
	//uint32									// 5	uint32	
),
'ChatChannels' => array( // rows: 5, cols: 5
	0 => array('ChannelId',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
	1 => 'flags',								// 1	uint32	m_flags
	2 => 'factionGroup',						// 2	uint32	m_factionGroup
	3 => 'pattern',								// 3	string	m_name_lang
	4 => 'name',								// 4	char*	m_shortcut_lang
),
'ChatProfanity' => array(), // rows: 5213, cols: 3
'ChrClasses' => array( // rows: 10, cols: 14
	0 => array('ClassId',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
	1 => 'powerType',							// 1	uint32	m_DisplayPower
												// 2			m_petNameToken
	3 => 'name',								// 3	string	m_name_lang
	4 => 'nameFemale',							// 4	char*	m_name_female_lang
	5 => 'nameNeutralGender',			 		// 5	char*	m_name_male_lang
	6 => 'capitalizedName',						// 6	char*	m_filename
	7 => 'spellfamily',							// 7	uint32	m_spellClassSet
	8 => 'flags',								// 8	uint32	m_flags (0x08 HasRelicSlot)
	9 => 'CinematicSequence',					// 9	uint32	m_cinematicSequenceId
	10=> 'expansion',							// 10	uint32	m_required_expansion
												// 11	uint32
												// 12	uint32
												// 13	uint32
),
'ChrRaces' => array( // rows: 23, cols: 24
	0 => array('RaceId',INDEX_PRIMORY_KEY),		// 0	uint32	m_Id
												// 1			m_flags
	2 => 'FactionId',							// 2	uint32	m_factionId
												// 3			m_ExplorationSoundId
	4 => 'model_m',								// 4	uint32	m_MaleDisplayId
	5 => 'model_f',								// 5	uint32	m_FemaleDisplayId
												// 6			m_ClientPrefix
	7 => 'TeamId',								// 7	uint32	m_BaseLanguage (7-Alliance 1-Horde)
												// 8			m_creatureType
												// 9			m_ResSicknessSpellId
												// 10			m_SplashSoundId
												// 11			m_clientFileString
	12=> 'CinematicSequence',					// 12	uint32	m_cinematicSequenceId
												// 13	uint32	m_alliance (0 alliance, 1 horde, 2 not available?)
	14=> 'name',								// 14	string	m_name_lang used for DBC language detection/selection
	15=> 'nameFemale',							 // 15	char*	m_name_female_lang
	16=> 'nameNeutralGender',					// 16	char*	m_name_male_lang
												// 17-18		m_facialHairCustomization[2]
												// 19			m_hairCustomization
	20=> 'expansion',							// 20	uint32	m_required_expansion
												// 21	uint32	(23 for worgens)
												// 22	uint32	4.0.0
												// 23	uint32	4.0.0
),
'CinematicCamera' => array( // rows: 28, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'filename',							// 1	char*	m_model
	2 => 'soundId',								// 2	uint32	m_soundId
	3 => 'x',									// 3	float	m_originX
	4 => 'y',									// 4	float	m_originY
	5 => 'z',									// 5	float	m_originZ
	6 => 'face',								// 6	float	m_originFacing
),
'CinematicSequences' => array( // rows: 21, cols: 10
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	m_soundId
	2 => 'cinematicCamera',						// 2	uint32	m_camera[8]
),
'CreatureDisplayInfo' => array( // rows: 32391, cols: 17
	0 => array('DisplayId',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
												// 1	uint32	m_modelId
												// 2	uint32	m_soundId
	3 => 'ExtendedDisplayInfoId',				// 3	uint32	m_extendedDisplayInfoId -> CreatureDisplayInfoExtraEntry::DisplayExtraId
	4 => 'creatureModelScale',					// 4	float	m_creatureModelScale
												// 5	uint32	m_creatureModelAlpha
												// 6-8	uint32	m_textureVariation[3]
												// 9	uint32	m_portraitTextureName
												// 10	uint32	m_sizeClass
												// 11	uint32	m_bloodId
												// 12	uint32	m_NPCSoundId
												// 13	uint32	m_particleColorId
												// 14	uint32	m_creatureGeosetData
												// 15	uint32	m_objectEffectPackageId
												// 16			all 0
),
'CreatureDisplayInfoExtra' => array( // rows: 20490, cols: 21
	0 => array('DisplayExtraId',INDEX_PRIMORY_KEY),// 0	uint32	m_Id CreatureDisplayInfoEntry::m_extendedDisplayInfoId
	1 => 'Race',								// 1	uint32	m_DisplayRaceId
	2 => 'Gender',								// 2	uint32	m_DisplaySexId
	3 => 'SkinColor',							// 3	uint32	m_SkinId
	4 => 'FaceType',							// 4	uint32	m_FaceId
	5 => 'HairType',							// 5	uint32	m_HairStyleId
	6 => 'HairStyle',							// 6	uint32	m_HairColorId
	7 => 'BeardStyle',							// 7	uint32	m_FacialHairId
	8 => array('Equipment',11),					// 8-18	uint32	m_NPCItemDisplay equipped static items EQUIPMENT_SLOT_HEAD..EQUIPMENT_SLOT_HANDS, client show its by self
	19=> 'CanEquip',							// 19	uint32	m_flags 0..1 Can equip additional things when used for players
	20=> 'bakeName'								// 20	char*	m_BakeName CreatureDisplayExtra-*.blp
),
'CreatureFamily' => array( // rows: 51, cols: 12
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'minScale',							// 1	float	m_minScale
	2 => 'minScaleLevel',						// 2	uint32	m_minScaleLevel
	3 => 'maxScale',							// 3	float	m_maxScale
	4 => 'maxScaleLevel',						// 4	uint32	m_maxScaleLevel
	5 => array('skillLine',2),					// 5-6	uint32	m_skillLine
	7 => 'petFoodMask',							// 7	uint32	m_petFoodMask
	8 => 'petTalentType',						// 8	int32	m_petTalentType
												// 9			m_categoryEnumId
	10=> 'name',								// 10	string	m_name_lang
												// 11			m_iconFile
),
'CreatureImmunities' => array(), // rows: 2, cols: 26(12)
'CreatureModelData' => array(), // rows: 2054, cols: 31(28)
'CreatureMovementInfo' => array(), // rows: 280, cols: 2
'CreatureSoundData' => array(), // rows: 1705, cols: 40(38)
'CreatureSpellData' => array( // rows: 799, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('spellId',4),		 			// 1-4	uint32	m_spells[4]
	5 => array('availability',4)				// 5-8	uint32	m_availability[4]
),
'CreatureType' => array( // rows: 13, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name',								// 1	char*	m_name_lang
	2 => 'no_expirience'						// 2	uint32	m_flags no exp? critters, non-combat pets, gas cloud.
),
'CurrencyCategory' => array( // rows: 11, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'flags',								// 1	uint32	m_flags 0 for known categories and 3 for unknown one (3.0.9)
	2 => 'name'									// 2	char*	m_name_lang
),
'CurrencyTypes' => array( // rows: 45, cols: 11
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Category',							// 1	uint32	m_categoryId
	2 => 'name',								// 2	char*
	3 => 'iconName',							// 3	char*
												// 4	uint32
												// 5	uint32
												// 6	uint32
												// 7	uint32
												// 8	uint32
												// 9	uint32
	10=> 'description'							// 10	char*
),
'DanceMoves' => array(), // rows: 24, cols: 8(24)
'DeathThudLookups' => array(), // rows: 45, cols: 5
'DeclinedWord' => array(), // rows: 40346, cols: 2
'DeclinedWordCases' => array(), // rows: 191447, cols: 4
'DestructibleModelData' => array(), // rows: 82, cols: 24(19)
'DungeonEncounter' => array(), // rows: 598, cols: 8(23)
'DungeonMap' => array(), // rows: 186, cols: 8
'DungeonMapChunk' => array(), // rows: 2244, cols: 5
'DurabilityCosts' => array( // rows: 1000, cols: 30
	0 => 'Itemlvl',								// 0	uint32	m_Id
	1 => array('multiplier',29)					// 1-29	uint32	m_weaponSubClassCost m_armorSubClassCost
),
'DurabilityQuality' => array( // rows: 16, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'quality_mod'							// 1	float	m_data
),
'Emotes' => array( // rows: 183, cols: 8
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name',								// 1	uint32	m_EmoteSlashCommand
	2 => 'AnimationId',							// 2	uint32	m_AnimId
	3 => 'Flags',								// 3	uint32	m_EmoteFlags
	4 => 'EmoteType',							// 4	uint32	m_EmoteSpecProc (determine how emote are shown)
	5 => 'UnitStandState',						// 5	uint32	m_EmoteSpecProcParam
	6 => 'SoundId',								// 6	uint32	m_EventSoundId
												// 7
),
'EmotesText' => array( // rows: 253, cols: 19
	0 => array('id',INDEX_PRIMORY_KEY),			//		uint32	m_Id
												//		uint32	m_name
	// uint32	textId;							//		uint32	m_emoteId
												//		uint32	m_emoteText
),
'EmotesTextData' => array(), // rows: 1327, cols: 2(18)
'EmotesTextSound' => array(), // rows: 808, cols: 5
'EnvironmentalDamage' => array(), // rows: 6, cols: 3
'Exhaustion' => array(), // rows: 6, cols: 7(23)
'Faction' => array( // rows: 434, cols: 26
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'reputationListId',					// 1	int32	m_reputationIndex
	2 => array('BaseRepRaceMask',4),			// 2-5	uint32	m_reputationRaceMask
	6 => array('BaseRepClassMask',4),			// 6-9	uint32	m_reputationClassMask
	10=> array('BaseRepValue',4),				// 10-13uint32	m_reputationBase
	14=> array('ReputationFlags',4),			// 14-17uint32	m_reputationFlags
	18=> 'team',								// 18	uint32	m_parentFactionId
	19=> 'n',									// 19	uint32	m_parentFactionMod[2] Faction gains incoming rep * spilloverRateIn
	20=> 't',									// 20		Faction outputs rep * spilloverRateOut as spillover reputation
	21=> 'spilloverMaxRankIn',					// 21	uint32	m_parentFactionCap[2] The highest rank the faction will profit from incoming spillover
	22=> 'spilloverRank',						// 22			It does not seem to be the max standing at which a faction outputs spillover ...so no Idea
	23=> 'name',								// 23	uint32	m_name_lang
	24=> 'description',						// 24	uint32	m_description_lang
	//uint32									// 25
),
'FactionGroup' => array(), // rows: 4, cols: 4(20)
'FactionTemplate' => array( // rows: 1044, cols: 14
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'faction',								// 1	uint32	m_faction
	2 => 'factionFlags',						// 2	uint32	m_flags
	3 => 'ourMask',								// 3	uint32	m_factionGroup
	4 => 'friendlyMask',						// 4	uint32	m_friendGroup
	5 => 'hostileMask',							// 5	uint32	m_enemyGroup
	6 => array('enemyFaction',4),				// 6	uint32	m_enemies[4]
	10=> array('friendFaction',4)				// 10	uint32	m_friend[4]
),
'FileData' => array(), // rows: 806, cols: 3
'FootprintTextures' => array(), // rows: 7, cols: 2
'FootstepTerrainLookup' => array(), // rows: 221, cols: 5
'GameObjectArtKit' => array(), // rows: 22, cols: 8
'GameObjectDisplayInfo' => array( // rows: 5068, cols: 21
	0 => array('DisplayId',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
	1 => 'filename',							// 1	uint32	m_modelName
												// 2-11	uint32	m_Sound
	12=> 'boxMinX',								// 12	uint32	m_geoBoxMinX (use first value as interact dist, mostly in hacks way)
												// 13	uint32	m_geoBoxMinY
												// 14	uint32	m_geoBoxMinZ
												// 15	uint32	m_geoBoxMaxX
												// 16	uint32	m_geoBoxMaxY
												// 17	uint32	m_geoBoxMaxZ
												// 18	uint32	m_objectEffectPackageId
												// 19
												// 20
),
'GameTables' => array(), // rows: 62, cols: 4(3)
'GameTips' => array(), // rows: 146, cols: 4(18)
'GemProperties' => array( // rows: 822, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'spellitemenchantement',				// 1	uint32	m_enchant_Id
												// 2	uint32	m_maxcount_inv
												// 3	uint32	m_maxcount_item
	4 => 'color',								// 4	uint32	m_type
	//uint32									// 5
),
'GlueScreenEmote' => array(), // rows: 22, cols: 8
'GlyphProperties' => array( // rows: 346, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			//		uint32	m_Id
	// uint32	SpellId;						//		uint32	m_spellId
	// uint32	TypeFlags;						//		uint32	m_glyphSlotFlags
	// uint32	Unk1;							//		uint32	m_spellIconId
),
'GlyphSlot' => array( // rows: 9, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			//		uint32	m_Id
	// uint32	TypeFlags;						//		uint32	m_type
	// uint32	Order;							//		uint32	m_tooltip
),
'GMSurveyAnswers' => array(), // rows: 113, cols: 4(20)
'GMSurveyCurrentSurvey' => array(), // rows: 9, cols: 2
'GMSurveyQuestions' => array(), // rows: 25, cols: 2(18)
'GMSurveySurveys' => array(), // rows: 4, cols: 16(11)
'GMTicketCategory' => array(), // rows: 38, cols: 2(18)
'GroundEffectDoodad' => array(), // rows: 723, cols: 3
'GroundEffectTexture' => array(), // rows: 3170, cols: 11
'gtBarberShopCostBase' => array(), // rows: 100, cols: 2
'gtChanceToMeleeCrit' => array(), // rows: 1100, cols: 2
'gtChanceToMeleeCritBase' => array(), // rows: 11, cols: 2
'gtChanceToSpellCrit' => array(), // rows: 1100, cols: 2
'gtChanceToSpellCritBase' => array(), // rows: 11, cols: 2
'gtCombatRatings' => array(), // rows: 3200, cols: 2
'gtNPCManaCostScaler' => array(), // rows: 100, cols: 2
'gtOCTClassCombatRatingScalar' => array(), // rows: 352, cols: 2
'gtOCTRegenMP' => array(), // rows: 1100, cols: 2
'gtRegenMPPerSpt' => array(), // rows: 1100, cols: 2
'gtSpellScaling' => array(), // rows: 1200, cols: 2
'GuildColorBackground' => array(), // rows: 51, cols: 4
'GuildColorBorder' => array(), // rows: 17, cols: 4
'GuildColorEmblem' => array(), // rows: 17, cols: 4
'GuildPerkSpells' => array(), // rows: 24, cols: 3
'HelmetGeosetVisData' => array(), // rows: 24, cols: 8
'HolidayDescriptions' => array( // rows: 34, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id this is NOT holIday Id
	1 => 'name'									// 1	uint32	m_name_lang
),
'HolidayNames' => array( // rows: 32, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id this is NOT holIday Id
	1 => 'name'									// 1	uint32	m_name_lang
),
'Holidays' => array( // rows: 31, cols: 55
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('duration',10),					// 1-10	uint32	m_duration
	11 =>array('date',26),						// 11-36uint32	m_date (dates in unix time starting at January, 1, 2000)
	37=> 'region',								// 37	uint32	m_region (wow region)
	38=> 'looping',								// 38	uint32	m_looping
	39 =>array('calendarFlags',10),				// 39-48uint32	m_calendarFlags
	49=> 'holIdayNameId',						// 49	uint32	m_holIdayNameId (HolIdayNames.dbc)
	50=> 'holIdayDescriptionId',				// 50	uint32	m_holIdayDescriptionId (HolIdayDescriptions.dbc)
	51=> 'textureFilename',						// 51	string	m_textureFilename
	52=> 'priority',							// 52	uint32	m_priority
	53=> 'calendarFilterType',					// 53	uint32	m_calendarFilterType (-1,0,1 or 2)
	54=> 'flags'								// 54	uint32	m_flags
),
'Item' => array( // rows: 57264, cols: 8
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Class',								// 1	uint32	m_classId
	2 => 'SubClass',							// 2	uint32	m_subclassId (some items have strange subclasses)
												// 3	uint32	m_sound_overrIde_subclassId
	4 => 'Material',							// 4	uint32	m_material
	5 => 'DisplayId',							// 5	uint32	m_displayInfoId
	6 => 'InventoryType',						// 6	uint32	m_inventoryType
	7 => 'Sheath'								// 7	uint32	m_sheatheType
),
'ItemArmorQuality' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemArmorShield' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => 'id2',									// 1	uint32	item level
	2 => array('Value',7)						// 2-8	float	multiplier for item quality
),
'ItemArmorTotal' => array( // rows: 1000, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => 'id2',									// 1	uint32	item level
	2 => array('Value',4)						// 2-5	float	multiplier for armor types (cloth...plate)
),
'ItemBagFamily' => array( // rows: 17, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name'									// 1	uint32	m_name_lang
),
'ItemClass' => array(), // rows: 17, cols: 5
'ItemCondExtCosts' => array(), // rows: 1163, cols: 4
'ItemDamageAmmo' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageOneHand' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageOneHandCaster' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageRanged' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageThrown' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageTwoHand' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageTwoHandCaster' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDamageWand' => array( // rows: 1000, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	item level
	1 => array('Value',7),						// 1-7	float	multiplier for item quality
	8 => 'id2'									// 8	uint32	item level
),
'ItemDisenchantLoot' => array(), // rows: 100, cols: 7(9)
'ItemDisplayInfo' => array( // rows: 51736, cols: 25
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
												// 1	uint32	m_modelName[2]
												// 2	uint32	m_modelTexture[2]
												// 3	uint32	m_inventoryIcon
												// 4	uint32	m_geosetGroup[3]
												// 5	uint32	m_flags
												// 6	uint32	m_spellVisualId
												// 7	uint32	m_groupSoundIndex
												// 8	uint32	m_helmetGeosetVis[2]
												// 9	uint32	m_texture[2]
												// 10	uint32	m_itemVisual[8]
												// 11	uint32	m_particleColorId
),
'ItemExtendedCost' => array( // rows: 981, cols: 31
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'reqhonorpoints',						// 1	uint32	m_honorPoints
	2 => 'reqarenapoints',						// 2	uint32	m_arenaPoints
	3 => 'reqarenaslot',						// 3	uint32	m_arenaBracket
	5 => array('reqitem',4),					// 5-8	uint32	m_itemId
	9 => array('reqitemcount',4),				// 9-13	uint32	m_itemCount
	14=> 'reqpersonalarenarating',				// 14	uint32	m_requiredArenaRating
												// 15	uint32	m_itemPurchaseGroup
	16=> array('someId',5),						// 16-20uint32	may be currency Id's
	21=> array('someCount',5),					// 21-25uint32	
	26=> array('something',5)					// 26-30uint32	
),
'ItemGroupSounds' => array(), // rows: 24, cols: 5
'ItemLimitCategory' => array( // rows: 142, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name',								// 1	char*	m_name_lang
	2 => 'maxCount',							// 2	uint32	m_quantity max allowed equipped as item or in gem slot
	3 => 'mode'									// 3	uint32	m_flags 0 = have, 1 = equip (enum ItemLimitCategoryMode)
),
'ItemPetFood' => array(), // rows: 8, cols: 2(18)
'ItemPurchaseGroup' => array(), // rows: 1, cols: 10(26)
'ItemRandomProperties' => array( // rows: 2012, cols: 8
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'internalName',						// 1	char*	m_Name
	2 => array('enchant_Id',5),					// 2-6	uint32	m_Enchantment
	7 => 'nameSuffix'							// 7	string	m_name_lang
),
'ItemRandomSuffix' => array( // rows: 268, cols: 13
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'nameSuffix',							// 1	string	m_name_lang
												// 2	string?	m_internalName
	3 => array('enchant_Id',5),					// 3-7	uint32	m_enchantment
	8 => array('prefix',5)						// 8-12	uint32	m_allocationPct
),
'ItemReforge' => array(), // rows: 56, cols: 5
'ItemSet' => array( // rows: 578, cols: 37
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name',								// 1	string	m_name_lang
	2 => array('itemId',17),					// 2-18	uint32	m_itemId
	19=> array('spells',8),						// 19-26uint32	m_setSpellId
	27=> array('items_to_triggerspell',8),		// 27-34uint32	m_setThreshold
	35=> 'required_skill_Id',					// 35	uint32	m_requiredSkill
	36=> 'required_skill_value'					// 36	uint32	m_requiredSkillRank
),
'ItemSubClass' => array(), // rows: 123, cols: 13(44)
'ItemSubClassMask' => array(), // rows: 4, cols: 4(19)
'ItemVisualEffects' => array(), // rows: 108, cols: 2
'ItemVisuals' => array(), // rows: 100, cols: 6
'KeyChain' => array(), // rows: 0, cols: 33(0)
'Languages' => array(), // rows: 19, cols: 2
'LanguageWords' => array(), // rows: 1745, cols: 3
'LFGDungeonExpansion' => array( // rows: 41, cols: 8
	// m_Id
	// m_lfg_Id
	// m_expansion_level
	// m_random_Id
	// m_hard_level_min
	// m_hard_level_max
	// m_target_level_min
	// m_target_level_max
),
'LFGDungeonGroup' => array( // rows: 16, cols: 5
	// m_Id
	// m_name_lang
	// m_order_index
	// m_parent_group_Id
	// m_typeId
),
'LFGDungeons' => array( // rows: 233, cols: 18
	// m_Id
	// m_name_lang
	// m_minLevel
	// m_maxLevel
	// m_target_level
	// m_target_level_min
	// m_target_level_max
	// m_mapId
	// m_difficulty
	// m_flags
	// m_typeId
	// m_faction
	// m_textureFilename
	// m_expansionLevel
	// m_order_index
	// m_group_Id
	// m_description_lang
	//
),
'Light' => array(), // rows: 1092, cols: 15
'LightFloatBand' => array(), // rows: 6168, cols: 34
'LightIntBand' => array(), // rows: 18504, cols: 34
'LightParams' => array(), // rows: 1028, cols: 10(9)
'LightSkybox' => array(), // rows: 153, cols: 3
'LiquidMaterial' => array(), // rows: 6, cols: 3
'LiquidObject' => array(), // rows: 1116, cols: 6
'LiquidType' => array(), // rows: 43, cols: 45
'LoadingScreens' => array(), // rows: 114, cols: 4
'LoadingScreenTaxiSplines' => array(), // rows: 29, cols: 19
'Lock' => array( // rows: 468, cols: 33
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('Type',8),						// 1-8	uint32	m_Type
	9 => array('Index',8),						// 9-16	uint32	m_Index
	17=> array('Skill',8),						// 17-24uint32	m_Skill
	25=> array('Action',8)						// 25-32uint32	m_Action
),
'LockType' => array(), // rows: 23, cols: 5(53)
'MailTemplate' => array( // rows: 213, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'subject',								// 1	char*	m_subject_lang
	2 => 'content'								// 2	uint32	m_body_lang
),
'Map' => array( // rows: 199, cols: 20
	0 => array('MapId',INDEX_PRIMORY_KEY),		// 0	uint32	m_Id
	1 => 'internalname',						// 1	char*	m_Directory
	2 => 'map_type',							// 2	uint32	m_InstanceType
	3 => 'mapFlags',							// 3	uint32	m_Flags (0x100 - CAN_CHANGE_PLAYER_DIFFICULTY)
												// 4	uint32	4.0.1
	5 => 'isPvP',								// 5	uint32	m_PVP 0 or 1 for battlegrounds (not arenas)
	6 => 'name',								// 6	string	m_MapName_lang
	7 => 'linked_zone',							// 7	uint32	m_areaTableId
	8 => 'hordeIntro',							// 8	char*	m_MapDescription0_lang
	9 => 'allianceIntro',						// 9	char*	m_MapDescription1_lang
	10=> 'multimap_Id',							// 10	uint32	m_LoadingScreenId (LoadingScreens.dbc)
	11=> 'BattlefieldMapIconScale',				// 11	float	m_minimapIconScale
	12=> 'ghost_entrance_map',					// 12	int32	m_corpseMapId map_Id of entrance map in ghost mode (continent always and in most cases = normal entrance)
	13=> 'ghost_entrance_x',					// 13	float	m_corpseX entrance x coordinate in ghost mode	(in most cases = normal entrance)
	14=> 'ghost_entrance_y',					// 14	float	m_corpseY entrance y coordinate in ghost mode	(in most cases = normal entrance)
	15=> 'timeOfDayOverrIde',					// 15	uint32	m_timeOfDayOverrIde
	16=> 'addon',								// 16	uint32	m_expansionId
	17=> 'raidOffset',							// 17	uint32	m_raidOffset
	18=> 'maxPlayers',							// 18	uint32	m_maxPlayers
												// 19	uint32	new 4.0.0, mapId, related to phasing
),
'MapDifficulty' => array( // rows: 275, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'MapId',								// 1	uint32	m_mapId
	2 => 'Difficulty',							// 2	uint32	m_difficulty (for arenas: arena slot)
	3 => 'areaTriggerText',						// 3	char*	m_message_lang (text showed when transfer to map failed)
	4 => 'resetTime',							// 4	uint32	m_raIdDuration in secs, 0 if no fixed reset time
	5 => 'maxPlayers',							// 5	uint32	m_maxPlayers some heroic versions have 0 when expected same amount as in normal version
	6 => 'difficultyString'						// 6	char*	m_difficultystring
),
'Material' => array(), // rows: 8, cols: 5
'MountCapability' => array(), // rows: 36, cols: 8(7)
'MountType' => array(), // rows: 22, cols: 25
'Movie' => array( // rows: 11, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'filename',							// 1	char*	m_filename
	2 => 'volume',								// 2	uint32	m_volume
												// 3		4.0.0
),
'MovieFileData' => array(), // rows: 20, cols: 2
'MovieVariation' => array(), // rows: 24, cols: 3
'NameGen' => array(), // rows: 10972, cols: 4
'NamesProfanity' => array(), // rows: 8334, cols: 3
'NamesReserved' => array(), // rows: 16338, cols: 3
'NPCSounds' => array(), // rows: 452, cols: 5
'NumTalentsAtLevel' => array(), // rows: 100, cols: 2
'ObjectEffect' => array(), // rows: 228, cols: 12
'ObjectEffectGroup' => array(), // rows: 152, cols: 2
'ObjectEffectModifier' => array(), // rows: 11, cols: 8
'ObjectEffectPackage' => array(), // rows: 49, cols: 2
'ObjectEffectPackageElem' => array(), // rows: 262, cols: 4
'OverrideSpellData' => array( // rows: 34, cols: 13
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('Spells',10),					// 1-10	uint32	m_spells
	11=> 'flags',								// 11	uint32	m_flags
												// 12	uint32	possibly flag
),
'Package' => array(), // rows: 1, cols: 4(20)
'PageTextMaterial' => array(), // rows: 7, cols: 2
'PaperDollItemFrame' => array(), // rows: 36, cols: 4(3)
'ParticleColor' => array(), // rows: 164, cols: 10
'PetitionType' => array(), // rows: 2, cols: 3
'PetPersonality' => array(), // rows: 2, cols: 8(24)
'Phase' => array(), // rows: 267, cols: 3
'PhaseShiftZoneSounds' => array(), // rows: 4, cols: 14
'PhaseXPhaseGroup' => array(), // rows: 1050, cols: 3
'PowerDisplay' => array(), // rows: 30, cols: 6
'PvpDifficulty' => array( // rows: 153, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'mapId',								// 1	uint32	m_mapId
	2 => 'bracketId',							// 2	uint32	m_rangeIndex
	3 => 'minLevel',							// 3	uint32	m_minLevel
	4 => 'maxLevel',							// 4	uint32	m_maxLevel
	5 => 'difficulty'							// 5	uint32	m_difficulty
),
'QuestFactionReward' => array( // rows: 2, cols: 11
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('rewardValue',10)				// 1-10	int32	m_Difficulty
),
'QuestInfo' => array(), // rows: 11, cols: 2(18)
'QuestPOIBlob' => array(), // rows: 190, cols: 4
'QuestPOIPoint' => array(), // rows: 3974, cols: 4
'QuestSort' => array( // rows: 46, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name'									// 1	char*	m_SortName_lang
),
'QuestXP' => array( // rows: 100, cols: 11
	0 => 'questLevel',							// 0	uint32	m_Id
	1 => array('xpIndex',10)					// 1-10	uint32	m_difficulty[10]
),
'RandPropPoints' => array( // rows: 1000, cols: 16
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	// inc: изменена структура
	// 1 => 'itemLevel',							// 1	uint32	m_ItemLevel
	// 2 => array('EpicPropertiesPoints',5),		// 2-6	uint32	m_Epic
	// 7 => array('RarePropertiesPoints',5),		// 7-11	uint32	m_Superior
	// 12=> array('UncommonPropertiesPoints',5)	// 12-16uint32	m_Good
),
'ResearchBranch' => array(), // rows: 10, cols: 6
'ResearchField' => array(), // rows: 1, cols: 3
'ResearchProject' => array(), // rows: 144, cols: 9
'ResearchSite' => array(), // rows: 186, cols: 5
'Resistances' => array(), // rows: 7, cols: 4(20)
'ScalingStatDistribution' => array( // rows: 84, cols: 23
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('StatMod',10),					// 1-10	int32	m_statId
	11=> array('Modifier',10),					// 11-20uint32	m_bonus
												// 21	uint32
	22=> 'MaxLevel'								// 22	uint32	m_maxlevel
),
'ScalingStatValues' => array( // rows: 85, cols: 47
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Level',								// 1	uint32	m_charlevel
	2 => array('dpsMod',6),						// 2-7	uint32	DPS mod for level
	8 => 'spellBonus',							// 8	uint32	spell power for level
	9 => array('ssdMultiplier',5),				// 9-13	uint32	Multiplier for ScalingStatDistribution
	14=> array('armorMod',4),					// 14-17uint32	Armor for level
	18=> array('armorMod2',4),					// 18-21uint32	Armor for level
												// 22-45uint32	
												// 46	uint32	unk, probably also Armor for level (flag 0x80000?)
),
'ScreenEffect' => array(), // rows: 119, cols: 10
'ScreenLocation' => array(), // rows: 10, cols: 2
'ServerMessages' => array(), // rows: 13, cols: 2
'SkillLine' => array( // rows: 173, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'categoryId',							// 1	uint32	m_categoryId
	2 => 'skillCostId',							// 2	uint32	m_skillCostsId
	3 => 'name',								// 3	string	m_displayName_lang
	4 => 'description',							// 4	char*	m_description_lang
	5 => 'spellIcon',							// 5	uint32	m_spellIconId
												// 6	char*	m_alternateVerb_lang
),
'SkillLineAbility' => array( // rows: 8255, cols: 14
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'skillId',								// 1	uint32	m_skillLine
	2 => 'spellId',								// 2	uint32	m_spell
	3 => 'racemask',							// 3	uint32	m_raceMask
	4 => 'classmask',							// 4	uint32	m_classMask
	5 => 'racemaskNot',							// 5	uint32	m_excludeRace
	6 => 'classmaskNot',						// 6	uint32	m_excludeClass
	7 => 'req_skill_value',						// 7	uint32	m_minSkillLineRank
	8 => 'forward_spellId',						// 8	uint32	m_supercededBySpell
	9 => 'learnOnGetSkill',						// 9	uint32	m_acquireMethod
	10=> 'max_value',							// 10	uint32	m_trivialSkillLineRankHigh
	11=> 'min_value',							// 11	uint32	m_trivialSkillLineRankLow
	//uint32									// 12
	//uint32									// 13		4.0.0
),
'SkillLineAbilitySortedSpell' => array(), // rows: 8255, cols: 2
'SkillLineCategory' => array( // rows: 8, cols: 3
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'name',								// 1	uint32	m_name_lang
	2 => 'displayOrder'							// 2	uint32	m_sortIndex
),
'SkillRaceClassInfo' => array( // rows: 253, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'skillId',								// 1	uint32	m_skillId
	2 => 'raceMask',							// 2	uint32	m_raceMask
	3 => 'classMask',							// 3	uint32	m_classMask
	4 => 'flags',								// 4	uint32	m_flags
	5 => 'reqLevel',							// 5	uint32	m_minLevel
	6 => 'skillTierId',							// 6	uint32	m_skillTierId
	7 => 'skillCostId',							// 7	uint32	m_skillCostIndex
	// unk0										// 8
),
'SkillTiers' => array( // rows: 27, cols: 33
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('skillValue',16),				// 1-17	uint32	m_cost
	18 =>array('maxSkillValue',16)				// 18-3	uint32	m_valueMax
),
'SoundAmbience' => array(), // rows: 306, cols: 3
'SoundEmitters' => array(), // rows: 1167, cols: 10
'SoundEntries' => array( // rows: 19930, cols: 34
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Type',								// 1	uint32	m_soundType
	2 => 'InternalName',						// 2	uint32	m_name
	3 => array('FileName',10),					// 3-12	uint32	m_File[10]
	13=> array('Freq',10),						// 13-22uint32	m_Freq[10]
	23=> 'DirectoryBase',						// 23	uint32	m_DirectoryBase
	24=> 'volumeFloat',							// 24	uint32	m_volumeFloat
												// 25	uint32	m_flags
												// 26	uint32	m_minDistance
												// 27	uint32	m_distanceCutoff
												// 28	uint32	m_EAXDef
												// 29	uint32	m_soundEntriesAdvancedId, new in 3.1
												// 30			4.0.0
												// 31			4.0.0
												// 32			4.0.0
												// 33			4.0.0
),
'SoundEntriesAdvanced' => array(), // rows: 2916, cols: 25(24)
'SoundFilter' => array(), // rows: 26, cols: 2
'SoundFilterElem' => array(), // rows: 67, cols: 13
'SoundProviderPreferences' => array(), // rows: 32, cols: 24
'SpamMessages' => array(), // rows: 133, cols: 2
'Spell' => array( // rows: 70447, cols: 48
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'Attributes',							// 1	uint32	m_attribute
	2 => 'AttributesEx',						// 2	uint32	m_attributesEx
	3 => 'AttributesEx2',						// 3	uint32	m_attributesExB
	4 => 'AttributesEx3',						// 4	uint32	m_attributesExC
	5 => 'AttributesEx4',						// 5	uint32	m_attributesExD
	6 => 'AttributesEx5',						// 6	uint32	m_attributesExE
	7 => 'AttributesEx6',						// 7	uint32	m_attributesExF
	8 => 'AttributesEx7',						// 8	uint32	m_attributesExG (0x20 - totems, 0x4 - paladin auras, etc...)
	9 => 'someFlags',							// 9	uint32	4.0.0
												// 10	uint32	4.0.0
	11=> 'CastingTimeIndex',					// 11	uint32	m_castingTimeIndex
	12=> 'DurationIndex',						// 12	uint32	m_durationIndex
	13=> 'powerType',							// 13	uint32	m_powerType
	14=> 'rangeIndex',							// 14	uint32	m_rangeIndex
	15=> 'speed',								// 15	float	m_speed
	16=> array('SpellVisual',2),				// 16-17uint32	m_spellVisualID
	18=> 'SpellIconID',							// 18	uint32	m_spellIconID
	19=> 'activeIconID',						// 19	uint32	m_activeIconID
	20=> 'SpellName',							// 20	string	string	m_name_lang
	21=> 'Rank',								// 21	string	string	m_nameSubtext_lang
	22=> 'Description',							// 22	string	m_description_lang not used
	23=> 'ToolTip',								// 23	string	m_auraDescription_lang not used
	24=> 'SchoolMask',							// 24	uint32	m_schoolMask
	25=> 'runeCostID',							// 25	uint32	m_runeCostID
	26=> 'spellMissileID',						// 26	uint32	m_spellMissileID not used
	27=> 'spellDescriptionVariableID',			// 27	uint32	m_spellDescriptionVariableID, 3.2.0
	28=> 'SpellDifficultyId',					// 28	uint32	m_spellDifficultyID - id from SpellDifficulty.dbc
												// 29	float	
	30=> 'SpellScalingId',						// 30	uint32	SpellScaling.dbc
	31=> 'SpellAuraOptionsId',					// 31	uint32	SpellAuraOptions.dbc
	32=> 'SpellAuraRestrictionsId',				// 32	uint32	SpellAuraRestrictions.dbc
	33=> 'SpellCastingRequirementsId',			// 33	uint32	SpellCastingRequirements.dbc
	34=> 'SpellCategoriesId',					// 34	uint32	SpellCategories.dbc
	35=> 'SpellClassOptionsId',					// 35	uint32	SpellClassOptions.dbc
	36=> 'SpellCooldownsId',					// 36	uint32	SpellCooldowns.dbc
												// 37	uint32	all zeros...
	38=> 'SpellEquippedItemsId',				// 38	uint32	SpellEquippedItems.dbc
	39=> 'SpellInterruptsId',					// 39	uint32	SpellInterrupts.dbc
	40=> 'SpellLevelsId',						// 40	uint32	SpellLevels.dbc
	41=> 'SpellPowerId',						// 41	uint32	SpellPower.dbc
	42=> 'SpellReagentsId',						// 42	uint32	SpellReagents.dbc
	43=> 'SpellShapeshiftId',					// 43	uint32	SpellShapeshift.dbc
	44=> 'SpellTargetRestrictionsId',			// 44	uint32	SpellTargetRestrictions.dbc
	45=> 'SpellTotemsId',						// 45	uint32	SpellTotems.dbc
	46=> 'ResearchProject',						// 46	uint32	ResearchProject.dbc
												// 47
),
'SpellActivationOverlay' => array(), // rows: 81, cols: 11
'SpellAuraOptions' => array( // rows: 5818, cols: 5
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'StackAmount',							// 1	uint32	m_cumulativeAura
	2 => 'procChance',							// 2	uint32	m_procChance
	3 => 'procCharges',							// 3	uint32	m_procCharges
	4 => 'procFlags'							// 4	uint32	m_procTypeMask
),
'SpellAuraRestrictions' => array( // rows: 1111, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'CasterAuraState',						// 1	uint32	m_casterAuraState
	2 => 'TargetAuraState',						// 2	uint32	m_targetAuraState
	3 => 'CasterAuraStateNot',					// 3	uint32	m_excludeCasterAuraState
	4 => 'TargetAuraStateNot',					// 4	uint32	m_excludeTargetAuraState
	5 => 'casterAuraSpell',						// 5	uint32	m_casterAuraSpell
	6 => 'targetAuraSpell',						// 6	uint32	m_targetAuraSpell
	7 => 'excludeCasterAuraSpell',				// 7	uint32	m_excludeCasterAuraSpell
	8 => 'excludeTargetAuraSpell'				// 8	uint32	m_excludeTargetAuraSpell
),
'SpellCastingRequirements' => array( // rows: 6330, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'FacingCasterFlags',					// 1	uint32	m_facingCasterFlags
	2 => 'MinFactionId',						// 2	uint32	m_minFactionId not used
	3 => 'MinReputation',						// 3	uint32	m_minReputation not used
	4 => 'AreaGroupId',							// 4	uint32	m_requiredAreaGroupId
	5 => 'RequiredAuraVision',					// 5	uint32	m_requiredAuraVision not used
	6 => 'RequiresSpellFocus'					// 6	uint32	m_requiresSpellFocus
),
'SpellCastTimes' => array( // rows: 82, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'CastTime',							// 1	int32	m_base
	2 => 'CastTimePerLevel',					// 2	float	m_perLevel
	3 => 'MinCastTime'							// 3	int32	m_minimum
),
'SpellCategories' => array( // rows: 20561, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Category',							// 1	uint32	m_category
	2 => 'DmgClass',							// 2	uint32	m_defenseType
	3 => 'Dispel',								// 3	uint32	m_dispelType
	4 => 'Mechanic',							// 4	uint32	m_mechanic
	5 => 'PreventionType',						// 5	uint32	m_preventionType
	6 => 'StartRecoveryCategory'				// 6	uint32	m_startRecoveryCategory
),
'SpellCategory' => array(), // rows: 302, cols: 4(2)
'SpellChainEffects' => array(), // rows: 1542, cols: 48
'SpellClassOptions' => array( // rows: 8916, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'modalNextSpell',						// 1	uint32	m_modalNextSpell not used
	2 => array('SpellFamilyFlags',3),			// 2-4	uint32	m_spellClassMask NOTE: size is 12 bytes!!!
	5 => 'SpellFamilyName',						// 5	uint32	m_spellClassSet
	6 => 'Description'							// 6	char*	4.0.0
),
'SpellCooldowns' => array( // rows: 7489, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'CategoryRecoveryTime',				// 1	uint32	m_categoryRecoveryTime
	2 => 'RecoveryTime',						// 2	uint32	m_recoveryTime
	3 => 'StartRecoveryTime'					// 3	uint32	m_startRecoveryTime
),
'SpellDescriptionVariables' => array(), // rows: 64, cols: 2
'SpellDifficulty' => array( // rows: 1637, cols: 5
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('spellId',4)						// 1-4	uint32	m_difficultySpellID[4]
),
'SpellDispelType' => array(), // rows: 12, cols: 5(21)
'SpellDuration' => array( // rows: 154, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'duration',							// 1	uint32	m_duration
	3 => 'durationPerLevel',					// 2	uint32	m_durationPerLevel
	3 => 'maxDuration'							// 3	uint32	m_maxDuration
),
'SpellEffect' => array( // rows: 93625, cols: 27
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'effect',								// 1	uint32	m_effect
	2 => 'effectAmplitude',						// 2	uint32	m_effectAmplitude
	3 => 'effectApplyAuraName',					// 3	uint32	m_effectAura
	4 => 'effectAuraPeriod',					// 4	uint32	m_effectAuraPeriod
	5 => 'effectBasePoints',					// 5	uint32	m_effectBasePoints (don't must be used in spell/auras explicitly, must be used cached Spell::m_currentBasePoints)
												// 6	float	3.2.0
	7 => 'effectChainAmplitude',				// 7	uint32	m_effectChainAmplitude
	8 => 'effectChainTarget',					// 8	uint32	m_effectChainTargets
	9 => 'effectDieSIdes',						// 9	uint32	m_effectDieSIdes
	10=> 'effectItemType',						// 10	uint32	m_effectItemType
	11=> 'effectMechanic',						// 11	uint32	m_effectMechanic
	12=> 'effectMiscValue',						// 12	uint32	m_effectMiscValue
	13=> 'effectMiscValueB',					// 13	uint32	m_effectMiscValueB
	14=> 'effectPointsPerCombo',				// 14	uint32	m_effectPointsPerCombo
	15=> 'effectRadiusIndex',					// 15	uint32	m_effectRadiusIndex - spellradius.dbc
	16=> 'effectRadiusMaxIndex',				// 16	uint32	4.0.0
	17=> 'effectRealPointsPerLevel',			// 17	float	m_effectRealPointsPerLevel
	18=> 'effectSpellClassMask',				// 18	uint32	m_effectSpellClassMask
	19=> 'effectTriggerSpell',					// 19	uint32	m_effectTriggerSpell
	20=> 'effectImplicitTargetA',				// 20	uint32	m_implicitTargetA
	21=> 'effectImplicitTargetB',				// 21	uint32	m_implicitTargetB
	22=> 'effectSpellId',						// 22	uint32	new 4.0.0
	23=> 'effectIndex'							// 23	uint32	new 4.0.0
												// 24-26
),
'SpellEffectCameraShakes' => array(), // rows: 41, cols: 4
'SpellEquippedItems' => array( // rows: 2240, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => ' EquippedItemClass',					// 1	int32	m_equippedItemClass (value)
	2 => ' EquippedItemInventoryTypeMask',		// 2	int32	m_equippedItemInvTypes (mask)
	3 => ' EquippedItemSubClassMask'			// 3	int32	m_equippedItemSubclass (mask)
),
'SpellFlyout' => array(), // rows: 6, cols: 7
'SpellFlyoutItem' => array(), // rows: 42, cols: 4
'SpellFocusObject' => array( // rows: 492, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Name'									// 1	char*	m_name_lang
),
'SpellIcon' => array(), // rows: 4514, cols: 2
'SpellInterrupts' => array( // rows: 20961, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'AuraInterruptFlags',					// 1	uint32	m_auraInterruptFlags
												// 2	uint32	4.0.0
	3 => 'ChannelInterruptFlags',				// 3	uint32	m_channelInterruptFlags
												// 4	uint32	4.0.0
	5 => 'InterruptFlags'						// 5	uint32	m_interruptFlags
),
'SpellItemEnchantment' => array( // rows: 3014, cols: 23
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'charges',								// 1	uint32	m_charges
	2 => array('effect',3),						// 2-4	uint32	m_effect[3]
	2 => array('effectPointsMin',3),			// 5-7	uint32	m_effectPointsMin[3]
	2 => array('effectPointsMax',3),			// 8-10	uint32	m_effectPointsMax[3]
	2 => array('effectArg',3),					// 11-13uint32	m_effectArg[3]
	16=> 'description',						// 14	char*	m_name_lang
	15=> 'itemVisual',							// 15	uint32	m_itemVisual
	16=> 'flags',						 		// 16	uint32	m_flags
	17=> 'GemID',								// 17	uint32	m_src_itemID
	18=> 'EnchantmentCondition',				// 18	uint32	m_condition_id
	19=> 'requiredSkill',						// 19	uint32	m_requiredSkillID
	20=> 'requiredSkillValue',					// 20	uint32	m_requiredSkillRank
												// 21			new in 3.1
												// 22			new in 3.1
),
'SpellItemEnchantmentCondition' => array( // rows: 65, cols: 31
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('LTOperandType',5),				// 1-5	uint8	m_lt_operandType[5]
	6 => array('LTOperand',5),					// 6-10	uint32	m_lt_operand[5]
	11=> array('Comparator',5),					// 11-15uint8	m_operator[5]
	15=> array('CompareColor',5),				// 15-20uint8	m_rt_operandType[5]
	21=> array('Value',5),						// 21-25uint32	m_rt_operand[5]
	25=> array('Logic',5)						// 25-30uint8	m_logic[5]
),
'SpellLevels' => array( // rows: 17151, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'baseLevel',							// 1	uint32	m_baseLevel
	2 => 'maxLevel',							// 2	uint32	m_maxLevel
	3 => 'spellLevel'							// 3	uint32	m_spellLevel
),
'SpellMechanic' => array( // rows: 32, cols: 2
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_id
	1 => 'type'									// 1	string	m_name_lang

),
'SpellMissile' => array(), // rows: 174, cols: 15
'SpellMissileMotion' => array(), // rows: 276, cols: 5
'SpellPower' => array( // rows: 3919, cols: 7
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'manaCost',							// 1	uint32	m_manaCost
	2 => 'manaCostPerlevel',					// 2	uint32	m_manaCostPerLevel
	3 => 'ManaCostPercentage',					// 3	uint32	m_manaCostPct
	4 => 'manaPerSecond',						// 4	uint32	m_manaPerSecond
	5 => 'PowerDisplayId',						// 5	uint32	m_powerDisplayID - id from PowerDisplay.dbc, new in 3.1
												// 6	uint32	4.0.0
),
'SpellRadius' => array( // rows: 88, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Radius',								// 1	float	m_radius
												// 2			m_radiusPerLevel
	3 => 'RadiusMax'							// 3	float	m_radiusMax
),
'SpellRange' => array( // rows: 84, cols: 8
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'minRange',							// 1	float	m_rangeMin
	2 => 'minRangeFriendly',					// 2	float	
	3 => 'maxRange',							// 3	float	m_rangeMax
	4 => 'maxRangeFriendly',					// 4	float	
	5 => 'Flags',								// 5	uint32	m_flags
	6 => 'Name',								// 6	char*	m_displayName_lang
	7 => 'ShortName'							// 7	char*	m_displayNameShort_lang
),
'SpellReagents' => array( // rows: 5055, cols: 17
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('Reagent',8),					// 1-8	int32	m_reagent
	9 => array('ReagentCount',8)				// 9-16	uint32	m_reagentCount
),
'SpellRuneCost' => array( // rows: 244, cols: 5
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => array('RuneCost',3),					// 1-3	uint32	m_blood m_unholy m_frost (0=blood, 1=frost, 2=unholy)
	4 => 'runePowerGain'						// 4	uint32	m_runicPower
),
'SpellScaling' => array( // rows: 478, cols: 16
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'castTimeMin',							// 1	uint32
	2 => 'castTimeMax',							// 2	uint32
	3 => 'castScalingMaxLevel',					// 3	uint32
	4 => 'playerClass',							// 4	uint32	(index * 100) + charLevel => gtSpellScaling.dbc
	5 => array('coeff1',3),						// 5-7	float
	8 => array('coeff2',3),						// 8-10	float
	11=> array('coeff3',3),						// 11-13float
	14=> 'unkMult',								// 14	float	some coefficient, mostly 1.0f
	15=> 'unkLevel'								// 15	uint32	some level
),
'SpellShapeshift' => array( // rows: 1030, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'Stances',								// 1	uint32	m_shapeshiftMask
												// 2	uint32	3.2.0
	3 => 'StancesNot',							// 3	uint32	m_shapeshiftExclude
												// 4	uint32	3.2.0
	5 => 'StanceBarOrder'						// 5	uint32	m_stanceBarOrder not used
),
'SpellShapeshiftForm' => array( // rows: 32, cols: 21(20)
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'buttonPosition',						// 1	uint32	m_bonusActionBar
	2 => 'Name',								// 2	char*	m_name_lang
	3 => 'flags1',								// 3	uint32	m_flags
	4 => 'creatureType',						// 4	int32 	m_creatureType <=0 humanoid, other normal creature types
												// 5	uint32	m_attackIconID
	6 => 'attackSpeed',						 	// 6	uint32	m_combatRoundTime
	7 => 'modelID_A',						 	// 7	uint32	
	7 => 'modelID_H',							// 8	uint32
												// 9	uint32	always 0
												// 10	uint32	always 0
	11=> array('spellId',8),					// 11-18uint32	m_presetSpellID[8]
												// 19	uint32	!=0 for fligh forms
												// 20	uint32
),
'SpellTargetRestrictions' => array( // rows: 5410, cols: 6
 0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
 1 => 'MaxAffectedTargets',		 			// 1	uint32	m_maxTargets
 1 => 'MaxTargetLevel',						// 2	uint32	m_maxTargetLevel
 1 => 'TargetCreatureType',					// 3	uint32	m_targetCreatureType
 1 => 'Targets'								// 4	uint32	m_targets
),
'SpellTotems' => array( // rows: 2606, cols: 5
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => array('TotemCategory',2),				// 1-2	uint32	m_requiredTotemCategoryID
	3 => array('Totem',2)						// 3-4	uint32	m_totem
),
'SpellVisual' => array(), // rows: 15835, cols: 33(32)
'SpellVisualEffectName' => array(), // rows: 7219, cols: 9(7)
'SpellVisualKit' => array(), // rows: 15675, cols: 39(38)
'SpellVisualKitAreaModel' => array(), // rows: 34, cols: 7(3)
'SpellVisualKitModelAttach' => array(), // rows: 4591, cols: 14(10)
'SpellVisualPrecastTransitions' => array(), // rows: 3, cols: 3
'Startup_Strings' => array(), // rows: 13, cols: 3(19)
'Stationery' => array(), // rows: 7, cols: 4
'StringLookups' => array(), // rows: 9, cols: 2
'SummonProperties' => array( // rows: 466, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_Id
	1 => 'Group',								// 1	uint32	m_control (enum SummonPropGroup)
	2 => 'FactionId',							// 2	uint32	m_faction
	3 => 'Title',								// 3	uint32	m_title (enum UnitNameSummonTitle)
	4 => 'Slot',							 	// 4	uint32	m_slot if title = UNITNAME_SUMMON_TITLE_TOTEM, its actual slot (0-6).
												//				if title = UNITNAME_SUMMON_TITLE_COMPANION, slot=6 -> defensive guardian, in other cases criter/minipet
												//				Slot may have other uses, selection of pet type in some cases?
	5 => 'Flags'								// 5	uint32	m_flags (enum SummonPropFlags)
),
'Talent' => array( // rows: 661, cols: 19
	0 => array('TalentID',INDEX_PRIMORY_KEY),	// 0	uint32	m_Id
	1 => 'TalentTab',							// 1	uint32	m_tabID (TalentTab.dbc)
	2 => 'Row',									// 2	uint32	m_tierID
	3 => 'Col',									// 3	uint32	m_columnIndex
	4 => array('RankID',5),						// 4-8	uint32	m_spellRank
	9 => 'DependsOn',							// 9	uint32	m_prereqTalent (Talent.dbc)
												// 10-11 		part of prev field
	12=> 'DependsOnRank',						// 12	uint32	m_prereqRank
												// 13-14		part of prev field
	15=> 'needAddInSpellBook',				 	// 15	uint32	m_flags also need disable higest ranks on reset talent tree
	16=> 'requiredSpellID',					 	// 16	uint32	m_requiredSpellID
	17=> 'allowForPet',							// 17	uint64	m_categoryMask its a 64 bit mask for pet 1<<m_categoryEnumID in CreatureFamily.dbc
												// 18
),
'TalentTab' => array( // rows: 33, cols: 11
	0 => array('TalentTabID',INDEX_PRIMORY_KEY),// 0	uint32	m_Id
	1 => 'name',								// 1	char*	m_name_lang
	2 => 'spellicon',							// 2	unit32	m_spellIconID
	3 => 'ClassMask',							// 3	uint32	m_classMask
	4 => 'petTalentMask',						// 4	uint32	m_petTalentMask
	5 => 'tabpage',								// 5	uint32	m_orderIndex
	6 => 'backgroundFile',						// 6	char*	m_backgroundFile
	7 => 'description',							// 7	char*
	8 => 'rolesMask',							// 8	uint32	4.0.0
	9 => array('spellIds',2)					// 9-10	uint32	passive mastery bonus spells?
),
'TalentTreePrimarySpells' => array(), // rows: 89, cols: 4
'TaxiNodes' => array( // rows: 527, cols: 11
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'map_id',						 		// 1	uint32	m_ContinentID
	2 => 'x',									// 2	float	m_x
	3 => 'y',									// 3	float	m_y
	4 => 'z',									// 4	float	m_z
	5 => 'name',							 	// 5	string	m_Name_lang
	6 => array('MountCreatureID',2),			// 6-7	uint32	m_MountCreatureID[2]
												// 8
												// 9
												// 10
),
'TaxiPath' => array( // rows: 1598, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'from',							 	// 1	uint32	m_FromTaxiNode
	2 => 'to',							 		// 2	uint32	m_ToTaxiNode
	3 => 'price'								// 3	uint32	m_Cost
),
'TaxiPathNode' => array( // rows: 38256, cols: 11
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'path',							 	// 1	uint32	m_PathID
	2 => 'index',								// 2	uint32	m_NodeIndex
	3 => 'mapid',								// 3	uint32	m_ContinentID
	4 => 'x',									// 4	float	m_LocX
	5 => 'y',									// 5	float	m_LocY
	6 => 'z',									// 6	float	m_LocZ
	7 => 'actionFlag',							// 7	uint32	m_flags
	8 => 'delay',								// 8	uint32	m_delay
	9 => 'arrivalEventID',						// 9	uint32	m_arrivalEventID
	10=> 'departureEventID'					// 10	uint32	m_departureEventID
),
'TeamContributionPoints' => array(), // rows: 1400, cols: 2
'TerrainMaterial' => array(), // rows: 3, cols: 4
'TerrainType' => array(), // rows: 13, cols: 7(6)
'TerrainTypeSounds' => array(), // rows: 10, cols: 1
'TotemCategory' => array( // rows: 34, cols: 4
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'name',								// 1	char*	m_name_lang
	2 => 'categoryType',						// 2	uint32	m_totemCategoryType (one for specialization)
	3 => 'categoryMask'							// 3	uint32	m_totemCategoryMask (compatibility mask for same type: different for totems, compatible from high to low for rods)
),
'TransportAnimation' => array(), // rows: 5802, cols: 7
'TransportPhysics' => array(), // rows: 6, cols: 11
'TransportRotation' => array(), // rows: 231, cols: 7
'UnitBlood' => array(), // rows: 4, cols: 10
'UnitBloodLevels' => array(), // rows: 4, cols: 4
'UnitPowerBar' => array(), // rows: 26, cols: 25
'Vehicle' => array( // rows: 1493, cols: 40
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'm_flags',								// 1	uint32
	2 => 'm_turnSpeed',							// 2	float 
	3 => 'm_pitchSpeed',						// 3	float 
	4 => 'm_pitchMin',							// 4	float 
	5 => 'm_pitchMax',							// 5	float 
	6 => array('m_seatID',8),					// 6-13 uint32
	14=> 'm_mouseLookOffsetPitch',				// 14	float 
	15=> 'm_cameraFadeDistScalarMin',			// 15	float 
	16=> 'm_cameraFadeDistScalarMax',			// 16	float 
	17=> 'm_cameraPitchOffset',				// 17	float 
	18=> 'm_facingLimitRight',					// 18	float 
	19=> 'm_facingLimitLeft',					// 19	float 
	20=> 'm_msslTrgtTurnLingering',			// 20	float 
	21=> 'm_msslTrgtPitchLingering',			// 21	float 
	22=> 'm_msslTrgtMouseLingering',			// 22	float 
	23=> 'm_msslTrgtEndOpacity',				// 23	float 
	24=> 'm_msslTrgtArcSpeed',					// 24	float 
	25=> 'm_msslTrgtArcRepeat',				// 25	float 
	26=> 'm_msslTrgtArcWidth',					// 26	float 
	27=> array('m_msslTrgtImpactRadius',2),	// 27-28float
	29=> 'm_msslTrgtArcTexture',				// 29	string
	30=> 'm_msslTrgtImpactTexture',			// 30	string
	31=> array('m_msslTrgtImpactModel',2),		// 31-32string
	33=> 'm_cameraYawOffset',					// 33	float 
	34=> 'm_uiLocomotionType',					// 34	uint32
	35=> 'm_msslTrgtImpactTexRadius',			// 35	float
	36=> 'm_uiSeatIndicatorType',				// 36	uint32	m_vehicleUIIndicatorID
												// 37			m_powerDisplayID
												// 38			new in 3.1
												// 39			new in 3.1
),
'VehicleSeat' => array( // rows: 2924, cols: 66
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'm_flags',								// 1	uint32
	2 => 'm_attachmentID',						// 2	int32
	3 => 'm_attachmentOffsetX',					// 3	float
	4 => 'm_attachmentOffsetY',					// 4	float
	5 => 'm_attachmentOffsetZ',					// 5	float
	6 => 'm_enterPreDelay',						// 6	float
	7 => 'm_enterSpeed',						// 7	float
	8 => 'm_enterGravity',						// 8	float
	9 => 'm_enterMinDuration',					// 9	float
	10=> 'm_enterMaxDuration',					// 10	float
	11=> 'm_enterMinArcHeight',				// 11	float
	12=> 'm_enterMaxArcHeight',				// 12	float
	13=> 'm_enterAnimStart',					// 13	int32
	14=> 'm_enterAnimLoop',					// 14	int32
	15=> 'm_rideAnimStart',					// 15	int32
	16=> 'm_rideAnimLoop',						// 16	int32
	17=> 'm_rideUpperAnimStart',				// 17	int32
	18=> 'm_rideUpperAnimLoop',				// 18	int32
	19=> 'm_exitPreDelay',						// 19	float
	20=> 'm_exitSpeed',						// 20	float
	21=> 'm_exitGravity',						// 21	float
	22=> 'm_exitMinDuration',					// 22	float
	23=> 'm_exitMaxDuration',					// 23	float
	24=> 'm_exitMinArcHeight',					// 24	float
	25=> 'm_exitMaxArcHeight',					// 25	float
	26=> 'm_exitAnimStart',					// 26	int32
	27=> 'm_exitAnimLoop',						// 27	int32
	28=> 'm_exitAnimEnd',						// 28	int32
	29=> 'm_passengerYaw',						// 29	float
	30=> 'm_passengerPitch',					// 30	float
	31=> 'm_passengerRoll',					// 31	float
	32=> 'm_passengerAttachmentID',			// 32	int32
	33=> 'm_vehicleEnterAnim',					// 33	int32
	34=> 'm_vehicleExitAnim',					// 34	int32
	35=> 'm_vehicleRideAnimLoop',				// 35	int32
	36=> 'm_vehicleEnterAnimBone',				// 36	int32
	37=> 'm_vehicleExitAnimBone',				// 37	int32
	38=> 'm_vehicleRideAnimLoopBone',			// 38	int32
	39=> 'm_vehicleEnterAnimDelay',			// 39	float
	40=> 'm_vehicleExitAnimDelay',				// 40	float
	41=> 'm_vehicleAbilityDisplay',			// 41	uint32
	42=> 'm_enterUISoundID',					// 42	uint32
	43=> 'm_exitUISoundID',					// 43	uint32
	44=> 'm_uiSkin',							// 44	int32
	45=> 'm_flagsB',							// 45	uint32
												// 46	m_cameraEnteringDelay
												// 47	m_cameraEnteringDuration
												// 48	m_cameraExitingDelay
												// 49	m_cameraExitingDuration
												// 50	m_cameraOffsetX
												// 51	m_cameraOffsetY
												// 52	m_cameraOffsetZ
												// 53	m_cameraPosChaseRate
												// 54	m_cameraFacingChaseRate
												// 55	m_cameraEnteringZoom"
												// 56	m_cameraSeatZoomMin
												// 57	m_cameraSeatZoomMax
												// 58-63uint32
												// 64	uint32	4.0.0
												// 65	uint32	4.0.1
),
'VehicleUIIndicator' => array(), // rows: 10, cols: 2
'VehicleUIIndSeat' => array(), // rows: 21, cols: 5
'VideoHardware' => array(), // rows: 194, cols: 23
'VocalUISounds' => array(), // rows: 824, cols: 7
'WeaponImpactSounds' => array(), // rows: 30, cols: 23
'WeaponSwingSounds2' => array(), // rows: 6, cols: 4
'Weather' => array(), // rows: 35, cols: 8
'WMOAreaTable' => array( // rows: 22202, cols: 15
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'rootId',								// 1	int32	m_WMOID used in root WMO
	2 => 'adtId',								// 2	int32	m_NameSetID used in adt file
	3 => 'groupId',								// 3	int32	m_WMOGroupID used in group WMO
												// 4	uint32	m_SoundProviderPref
												// 5	uint32	m_SoundProviderPrefUnderwater
												// 6	uint32	m_AmbienceID
												// 7	uint32	m_ZoneMusic
												// 8	uint32	m_IntroSound
	9 => 'Flags',								// 9	uint32	m_flags (used for indoor/outdoor determination)
	10=> 'areaId',								// 10	uint32	m_AreaTableID (AreaTable.dbc)
	11=> 'Name',								// 11	char*	m_AreaName_lang
												// 12	uint32
												// 13	uint32
												// 14	uint32
),
'WorldChunkSounds' => array(), // rows: 0, cols: 10(9)
'WorldMapArea' => array( // rows: 205, cols: 12
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'map_id',							 	// 1	uint32	m_mapID
	2 => 'area_id',								// 2	uint32	m_areaID index (continent 0 areas ignored)
	3 => 'internalName',						// 3	char*	m_areaName
	4 => 'locLeft',								// 4	float	m_locLeft
	5 => 'locRight',							// 5	float	m_locRight
	6 => 'locTop',								// 6	float	m_locTop
	7 => 'locBottom',							// 7	float	m_locBottom
	8 => 'virtualMapId',						// 8	int32	m_displayMapID -1 (map_id have correct map) other: virtual map where zone show (map_id - where zone in fact internally)
	9 => 'dungeonMapId',					 	// 9	int32	m_defaultDungeonFloor (DungeonMap.dbc)
	10=> 'someMapID',						 	// 10	uint32	m_parentWorldMapID
												// 11			4.0.0
),
'WorldMapContinent' => array(), // rows: 5, cols: 14
'WorldMapOverlay' => array( // rows: 1515, cols: 15
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'worldMapAreaId',					 	// 1	uint32	m_mapAreaID (WorldMapArea.dbc)
	2 => array('areatableID',4),				// 2-5	uint32	m_areaID
	6 => 'textureName',							// 6	char*	m_textureName
												// 7			m_textureWidth
												// 8			m_textureHeight
												// 9			m_offsetX
												// 10			m_offsetY
												// 11			m_hitRectTop
												// 12			m_hitRectLeft
												// 13			m_hitRectBottom
												// 14			m_hitRectRight
),
'WorldMapTransforms' => array(), // rows: 21, cols: 12(10)
'WorldSafeLocs' => array( // rows: 1009, cols: 6
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
	1 => 'map_id',								// 1	uint32	m_continent
	2 => 'x',									// 2	float	m_locX
	3 => 'y',									// 3	float	m_locY
	4 => 'z',									// 4	float	m_locZ
	5 => 'name',							 	// 5	char*	m_AreaName_lang
),
'WorldStateUI' => array(), // rows: 240, cols: 17(63)
'WorldStateZoneSounds' => array( // rows: 43, cols: 9
	0 => array('id',INDEX_PRIMORY_KEY),			// 0	uint32	m_ID
												// 1	uint32
	2 => 'areaTable',							// 2	uint32
	3 => 'WMOAreaTable',						// 3	uint32
	4 => 'zoneIntroMusicTable',					// 4	uint32
	5 => 'zoneIntroMusic',						// 5	uint32
	6 => 'zoneMusic',							// 6	uint32
	7 => 'soundAmbience',						// 7	uint32
	8 => 'soundProviderPreferences',			// 8	uint32
),
'world_PVP_Area' => array(), // rows: 2, cols: 7
'WowError_Strings' => array(), // rows: 13, cols: 3(19)
'ZoneIntroMusicTable' => array(), // rows: 434, cols: 5
'ZoneLight' => array(), // rows: 43, cols: 4
'ZoneLightPoint' => array(), // rows: 1183, cols: 5
'ZoneMusic' => array() // rows: 753, cols: 8
);