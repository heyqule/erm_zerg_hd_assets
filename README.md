# ERM Zerg HD
ERM Zerg HD graphic assets. 

#### PLEASE DO NOT COPY THESE ASSETS TO YOUR OWN MODS. Please use mod dependencies if you plan to use these assets. HD asset duplication is bad for game performance!  

##### Licenses
Lua code files are licensed under GNU LGPLv3

However, Starcraft graphic and sound assets are properties of Blizzard Entertainment Inc.  They are used for educational purposes. The original game is now free to play.

##### Credits
- Code by SHlNZ0U & heyqule
- Graphic extraction by SHlNZ0U


### How to use?
1. Add erm_zerg_hd_assets as your mod dependency in info.json
```json
{
  "factorio_version": "1.1",
  "dependencies": [
    "erm_zerg_hd_assets >= 1.0.0"
  ]
}
```
2. Using assets within your mod
```lua
--- Include graphics in your mods file
local ZergAnimation = require('__erm_zerg_hd_assets__/animation_db')

--- Entity_Type, Name, Animation_Type, Unit_Scale(optional)
unit['animations'] = ZergAnimation.get_layer_animation('unit','zergling','run')

-- Entity_Type: buildings, projectiles, units
-- Animation_Type: 
--
--    buildings = { run }
--    units = {run, attack, corpse}
--    projectiles = {attack_attachment, projectile, explosion}
--

-- Single layer animation
projectile['animation'] = ZergAnimation.get_single_animation('projectiles','spore1','projectile')


-- What if i want to change the properties of the animation?
local animation = ZergAnimation.get_single_animation('projectile','spore1')
animation['unit_scale'] = 5
projectile['animation'] = animation

-- What if i want to change the properties of the multi layer animation?
local animation = ZergAnimation.get_layer_animation('unit','zergling','run')
for index, _ in pairs(animation['layer']) do
    animation['layer'][index]['unit_scale'] = 5    
end
projectile['animation'] = animation

--- Include Sound, see the class for details 
local ZergSound = require('__erm_zerg_hd_assets__/sound')
unit['dying_sound'] = ZergSound.enemy_death('zergling', 1.0)


--- Use the creep on other buildings
building['spawn_decoration'] = {
    {
        decorative = "creep-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
    },
    {
        decorative = "creep-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
    }
}

--- Linking icons
{
    icon = "__erm_zerg_hd_assets__/graphics/entity/icons/units/zergling.png",
    icon_size = 64,
} 
```