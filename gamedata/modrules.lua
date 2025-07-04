-- $Id: modrules.lua 4625 2009-05-16 13:11:14Z google frog $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    modrules.lua
--  brief:   modrules definitions
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local forceSingleThreaded = false
local modoptions = Spring.GetModOptions()
if (modoptions and (modoptions.mtpath == 0 or modoptions.mtpath == "0")) then
	forceSingleThreaded = true
end
Spring.Echo("forceSingleThreaded", forceSingleThreaded)

local pathExperiment = false
local pathfinder = Spring.GetModOptions().pathfinder
if Script.IsEngineMinVersion and Script.IsEngineMinVersion(2025, 3, 0) and
		pathfinder == "qtpfs" or (pathfinder == "random" and math.random() < 0.5) then
	pathExperiment = true
end

local modrules  = {
  
  movement = {
    allowAirPlanesToLeaveMap = true;  -- defaults to true
    allowPushingEnemyUnits   = true; -- defaults to false
    allowCrushingAlliedUnits = false; -- defaults to false
    allowUnitCollisionDamage = true; -- defaults to false
    allowUnitCollisionOverlap = false, -- defaults to true -- this lets units clump close together when moving, after which they are pushed apart
    allowGroundUnitGravity = false,
    allowDirectionalPathing = true,
    maxCollisionPushMultiplier = 0.8,
    
    forceCollisionsSingleThreaded  = forceSingleThreaded,
    forceCollisionAvoidanceSingleThreaded  = forceSingleThreaded,
  },
  
  construction = {
    constructionDecay      = false; -- defaults to true
    constructionDecayTime  = 6.66;  -- defaults to 6.66
    constructionDecaySpeed = 0.03;  -- defaults to 0.03
  },

  damage = {
    debris = 20,
  },

  reclaim = {
    multiReclaim  = 1;    -- defaults to 0
    reclaimMethod = 0;    -- defaults to 1
    unitMethod    = 0;    -- defaults to 1
    unitDrainHealth = false,

    unitEnergyCostFactor    = 0;  -- defaults to 0
    unitEfficiency          = 0.8;  -- defaults to 1
    featureEnergyCostFactor = 0;  -- defaults to 0

    allowEnemies  = false;  -- defaults to true
    allowAllies   = ((Spring.GetModOptions() and (Spring.GetModOptions().allyreclaim == "1")) or (Spring.GetModOptions().techk == "1")) or false;  -- defaults to true
  },


  repair = {
    energyCostFactor = 0.666,  -- defaults to 0
  },


  resurrect = {
    energyCostFactor = 2,  -- defaults to 0.5
  },


  capture = {
    energyCostFactor = 1,  -- defaults to 0
  },
  
  
  paralyze = {
    paralyzeOnMaxHealth = true, -- defaults to true
    unitParalysisDeclineScale = 40, -- Time in seconds to go from 100% to 0% emp
  },

  sensors = {
    requireSonarUnderWater = true,  -- defaults to true
    alwaysVisibleOverridesCloaked = true, -- default false
    decloakRequiresLineOfSight = true, -- default false
    
    los = {
      -- Don't bother changing these values.
      -- In a test, both mip levels from 2 -> 4 changed the usage from around 1% to 0.6%.
      losMipLevel = 2,  -- defaults to 1
      losMul      = 1,  -- defaults to 1
      airMipLevel = 2,  -- defaults to 2
    },
  },


  transportability = {
    transportGround = 1;   -- defaults to 1
    transportHover  = 1;   -- defaults to 0
    transportShip   = 1;  -- defaults to 0
    transportAir    = 0;  -- defaults to 0
    targetableTransportedUnits = true;
  },


  flankingBonus = {
    -- defaults to 1
    -- 0: no flanking bonus
    -- 1: global coords, mobile
    -- 2: unit coords, mobile
    -- 3: unit coords, locked
    defaultMode=0;
  },


  experience = {
    experienceMult = 0; -- defaults to 1.0

    -- these are all used in the following form:
    --   value = defValue * (1 + (scale * (exp / (exp + 1))))
    powerScale  = 0;  -- defaults to 1.0
    healthScale = 0;  -- defaults to 0.7
    reloadScale = 0;  -- defaults to 0.4
  },


  fireAtDead = {
    fireAtKilled   = false;  -- defaults to false
    fireAtCrashing = false;   -- defaults to false
  },

  nanospray = {
    allow_team_colors = true;  -- defaults to true
  },
  
  featureLOS = {
    -- 0 - no default LOS for features
    -- 1 - gaia features always visible
    -- 2 - allyteam/gaia features always visible
    -- 3 - all features always visible
    -- default 3
    featureVisibility = 1;
  },
  
  system = {
    allowTake = false,
    enableSmoothMesh = false,
    LuaAllocLimit = 2560,
    pathFinderSystem = (pathExperiment and 1) or 0,
    pathFinderUpdateRate = (pathExperiment and 1) or 0.0000001,
    pathFinderRawDistMult = 100000,
    pfForceSingleThreaded = forceSingleThreaded,
    pfForceUpdateSingleThreaded = forceSingleThreaded,
  },
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return modrules

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

