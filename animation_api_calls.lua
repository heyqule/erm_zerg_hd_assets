---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 7/26/2023 11:37 PM
---
--- This file lists all callable animation functions.

local AnimationDB = require("animation_db")

--- Passing scale into layered animation, the following example double the scale
--- AnimationDB.get_layered_animations("death", "small_rubble", "run", 2)

--- Subtype for corpse animation are usually "main". when you use scale, you can do one of the following
--- AnimationDB.get_single_animation("units", "broodling", "corpse", "main", 2)
--- AnimationDB.get_single_animation("units", "broodling", "corpse", nil, 2)

--- Some units use run animation for its attack animations

--- Death animations
AnimationDB.get_layered_animations("death", "small_rubble", "run")
AnimationDB.get_layered_animations("death", "large_rubble", "run")
AnimationDB.get_layered_animations("death", "small_building", "explosion")
AnimationDB.get_layered_animations("death", "large_building", "explosion")
AnimationDB.get_layered_animations("death", "terran_cmd", "explosion")
AnimationDB.get_layered_animations("death","zerg_blood_splash","explosion")


---- Projectile and Explosions
AnimationDB.get_single_animation("projectiles","mutalisk","projectile")
AnimationDB.get_single_animation("projectiles","hydralisk","projectile")
AnimationDB.get_single_animation("projectiles","guardian","projectile")
AnimationDB.get_single_animation("projectiles","parasite","projectile")
AnimationDB.get_single_animation("projectiles","devourer","projectile")
AnimationDB.get_single_animation("projectiles","lurker","explosion")
AnimationDB.get_layered_animations("projectiles","colony","explosion")
AnimationDB.get_layered_animations("projectiles","mutalisk","explosion")
AnimationDB.get_layered_animations("projectiles","hydralisk","explosion")
AnimationDB.get_layered_animations("projectiles","blood_cloud","explosion")
AnimationDB.get_layered_animations("projectiles","dark_swam_80","explosion")
AnimationDB.get_layered_animations("projectiles","dark_swam","explosion")
AnimationDB.get_layered_animations("projectiles","acid_cloud","explosion")
AnimationDB.get_layered_animations("projectiles","devourer","explosion")
AnimationDB.get_layered_animations("projectiles","scourge_explosion","explosion")

--- Buildings
AnimationDB.get_layered_animations("buildings", "overmind", "run")
AnimationDB.get_layered_animations("buildings", "chamber", "run")
AnimationDB.get_layered_animations("buildings", "defiler_mound", "run")
AnimationDB.get_layered_animations("buildings", "greater_spire", "run")
AnimationDB.get_layered_animations("buildings", "hatchery", "run")
AnimationDB.get_layered_animations("buildings", "hive", "run")
AnimationDB.get_layered_animations("buildings", "hydraden", "run")
AnimationDB.get_layered_animations("buildings", "infested_cmd", "run")
AnimationDB.get_layered_animations("buildings", "lair", "run")
AnimationDB.get_layered_animations("buildings", "nyduspit", "run")
AnimationDB.get_layered_animations("buildings", "queen_nest", "run")
AnimationDB.get_layered_animations("buildings", "spawning_pool", "run")
AnimationDB.get_layered_animations("buildings", "spire", "run")
AnimationDB.get_layered_animations("buildings", "spore_colony", "folded")
AnimationDB.get_layered_animations("buildings", "sunken_colony", "folded")
AnimationDB.get_layered_animations("buildings", "sunken_colony", "attack")
AnimationDB.get_layered_animations("buildings", "ultralisk_cavern", "run")


--- Units
AnimationDB.get_layered_animations("units", "broodling", "run")
AnimationDB.get_layered_animations("units", "broodling", "attack")
AnimationDB.get_single_animation("units", "broodling", "corpse")

AnimationDB.get_layered_animations("units", "defiler", "run")
AnimationDB.get_single_animation("units", "defiler", "corpse")

AnimationDB.get_layered_animations("units", "devourer", "run")
AnimationDB.get_layered_animations("units", "devourer", "attack")
AnimationDB.get_single_animation("units", "devourer", "corpse")

AnimationDB.get_layered_animations("units", "drone", "run")
AnimationDB.get_layered_animations("units", "drone", "attack")
AnimationDB.get_single_animation("units", "drone", "corpse")

AnimationDB.get_layered_animations("units", "guardian", "run")
AnimationDB.get_single_animation("units", "guardian", "corpse")

AnimationDB.get_layered_animations("units", "hydralisk", "run")
AnimationDB.get_layered_animations("units", "hydralisk", "attack")
AnimationDB.get_single_animation("projectiles", "hydralisk","attack_attachment")
AnimationDB.get_single_animation("units", "hydralisk", "corpse")

AnimationDB.get_layered_animations("units", "infested", "run")
AnimationDB.get_single_animation("units", "infested", "corpse")

AnimationDB.get_layered_animations("units", "lurker", "run")
AnimationDB.get_layered_animations("units", "lurker", "attack")
AnimationDB.get_single_animation("units", "lurker", "corpse")

AnimationDB.get_layered_animations("units", "mutalisk", "run")
AnimationDB.get_single_animation("units", "mutalisk", "corpse")

AnimationDB.get_layered_animations("units", "overlord", "run")
AnimationDB.get_single_animation("units", "overlord", "corpse")

AnimationDB.get_layered_animations("units", "queen", "run")
AnimationDB.get_layered_animations("units", "queen", "attack")
AnimationDB.get_single_animation("units", "queen", "corpse")

AnimationDB.get_layered_animations("units", "scourge", "run")
AnimationDB.get_single_animation("units", "scourge", "corpse")

AnimationDB.get_layered_animations("units", "ultralisk", "run")
AnimationDB.get_layered_animations("units", "ultralisk", "attack")
AnimationDB.get_single_animation("units", "ultralisk", "corpse")

AnimationDB.get_layered_animations("units", "parasite", "run")
AnimationDB.get_layered_animations("units", "parasite", "corpse")

AnimationDB.get_layered_animations("units", "zergling", "run")
AnimationDB.get_layered_animations("units", "zergling", "attack")
AnimationDB.get_single_animation("units", "zergling", "corpse")
