return { tacnuke = {
  name                          = [[Eos]],
  description                   = [[Tactical Nuke]],
  builder                       = false,
  buildingGroundDecalDecaySpeed = 30,
  buildingGroundDecalSizeX      = 3,
  buildingGroundDecalSizeY      = 3,
  buildingGroundDecalType       = [[tacnuke_aoplane.dds]],
  buildPic                      = [[tacnuke.png]],
  category                      = [[SINK UNARMED]],
  collisionVolumeOffsets        = [[0 25 0]],
  collisionVolumeScales         = [[20 60 20]],
  collisionVolumeType           = [[CylY]],

  customParams                  = {
    mobilebuilding = [[1]],
    ignore_for_loss_stats = [[1]],

    outline_x = 55,
    outline_y = 80,
    outline_yoff = 55,
  },

  explodeAs                     = [[WEAPON]],
  footprintX                    = 1,
  footprintZ                    = 1,
  health                        = 1000,
  iconType                      = [[cruisemissilesmall]],
  maxSlope                      = 18,
  metalCost                     = 600,
  objectName                    = [[wep_tacnuke.s3o]],
  script                        = [[cruisemissile.lua]],
  selfDestructAs                = [[WEAPON]],

  sfxtypes                      = {

    explosiongenerators = {
      [[custom:RAIDMUZZLE]],
    },

  },

  sightDistance                 = 0,
  useBuildingGroundDecal        = false,
  yardMap                       = [[o]],

  weapons                       = {

    {
      def                = [[WEAPON]],
      badTargetCategory  = [[MOBILE]],
      onlyTargetCategory = [[SWIM LAND SINK TURRET FLOAT SHIP HOVER GUNSHIP]],
    },

  },

  weaponDefs                    = {

    WEAPON = {
      name                    = [[Tactical Nuke]],
      areaOfEffect            = 192,
      avoidFriendly           = false,
      cegTag                  = [[tactrail]],
      collideFriendly         = false,
      craterBoost             = 4,
      craterMult              = 3.5,

      customParams            = {
        burst = Shared.BURST_RELIABLE,

        lups_explodelife = 1.5,
        stats_hide_dps = 1, -- meaningless
        stats_hide_reload = 1,
        
        light_color = [[1.35 0.8 0.36]],
        light_radius = 400,
      },
      
      damage                  = {
        default = 3502.4,
      },

      edgeEffectiveness       = 0.4,
      explosionGenerator      = [[custom:NUKE_150]],
      fireStarter             = 0,
      flightTime              = 20,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      interceptedByShieldType = 1,
      leadLimit               = 0,
      model                   = [[wep_tacnuke.s3o]],
      range                   = 3500,
      reloadtime              = 10,
      smokeTrail              = false,
      soundHit                = [[explosion/mini_nuke]],
      soundStart              = [[SiloLaunch]],
      soundStartVolume        = 7,
      tolerance               = 4000,
      turnrate                = 18000,
      weaponAcceleration      = 180,
      weaponTimer             = 3,
      weaponType              = [[StarburstLauncher]],
      weaponVelocity          = 1200,
    },

  },

  featureDefs                   = {
  },

} }
