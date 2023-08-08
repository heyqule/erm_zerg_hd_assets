---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by heyqule.
--- DateTime: 7/18/2023 2:09 AM
---
require('util')
local AnimationDB = {}

--- Naming convention EntityType_Name. EntityType follows the graphics folder structure.
--- e.g [unit][zergling], [building][hive], [projectiles][spore], etc
---
--- death and projectile are handled differently because they are mostly single layer animation.
AnimationDB.data = {
    buildings = {
        overmind = require('db/buildings/boss_overmind'),
        chamber = require('db/buildings/chamber'),
        defiler_mound = require('db/buildings/defiler_mound'),
        greater_spire = require('db/buildings/greater_spire'),
        hatchery = require('db/buildings/hatchery'),
        hive = require('db/buildings/hive'),
        hydraden = require('db/buildings/hydraden'),
        infested_cmd = require('db/buildings/infested_cmd'),
        infested_cmd_infestor = require('db/buildings/infested_cmd_infestor'),
        lair = require('db/buildings/lair'),
        nyduspit = require('db/buildings/nyduspit'),
        queen_nest = require('db/buildings/queen_nest'),
        spawning_pool = require('db/buildings/spawning_pool'),
        spire = require('db/buildings/spire'),
        spore_colony = require('db/buildings/spore_colony'),
        sunken_colony = require('db/buildings/sunken_colony'),
        ultralisk_cavern = require('db/buildings/ultralisk_cavern'),
    },
    death = require('db/death'),
    projectiles = require('db/projectiles'),
    units = {
        broodling = require('db/units/broodling'),
        defiler = require('db/units/defiler'),
        devourer = require('db/units/devourer'),
        drone = require('db/units/drone'),
        guardian = require('db/units/guardian'),
        hydralisk = require('db/units/hydralisk'),
        infested = require('db/units/infested'),
        lurker = require('db/units/lurker'),
        mutalisk = require('db/units/mutalisk'),
        overlord = require('db/units/overlord'),
        queen = require('db/units/queen'),
        scourge = require('db/units/scourge'),
        ultralisk = require('db/units/ultralisk'),
        zergling = require('db/units/zergling'),
    },
    default_team_color = {r=96, g=48, b=0, a=166}
    --default_team_color = {r=128, g=64, b=0, a=0}
}

---
--- Construct basic layered animations
---
function AnimationDB.get_layered_animations(entity_type, name, animation_type, unit_scale)
    return {
        layers = {
            AnimationDB.get_main_animation(entity_type, name, animation_type, unit_scale),
            AnimationDB.get_shadow_animation(entity_type, name, animation_type, unit_scale),
            AnimationDB.get_team_mask_animation(entity_type, name, animation_type, unit_scale),
            AnimationDB.get_glow_mask_animation(entity_type, name, animation_type, unit_scale),
            AnimationDB.get_effect_mask_animation(entity_type, name, animation_type, unit_scale),
            AnimationDB.get_light_mask_animation(entity_type, name, animation_type, unit_scale),
        }
    }
end

---
--- get single sprite animation
---
function AnimationDB.get_single_animation(entity_type, name, animation_type, unit_scale)
    local animation = AnimationDB.get_main_animation(entity_type, name, animation_type, unit_scale)
    return animation
end

function AnimationDB.get_main_animation(entity_type, name, animation_type, unit_scale)
    local animation = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['main'])
    if unit_scale then
        animation.unit_scale = unit_scale
    end
    return animation
end

function AnimationDB.get_shadow_animation(entity_type, name, animation_type, unit_scale)
    if AnimationDB.data[entity_type][name][animation_type]['shadow'] then
        local animation = AnimationDB.get_main_animation(entity_type, name, animation_type, unit_scale)
        animation['draw_as_shadow'] = true
        animation['shift'] = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['shadow']['shift'])
        return animation
    end
end

---
--- Return glow mask
---
function AnimationDB.get_glow_mask_animation(entity_type, name, animation_type, unit_scale)
    if AnimationDB.data[entity_type][name][animation_type]['glow'] then
        local animation = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['glow'])
        animation['draw_as_glow'] = true
        if unit_scale then
            animation.unit_scale = unit_scale
        end
        return animation
    end
end

---
--- Return effect mask
---
function AnimationDB.get_effect_mask_animation(entity_type, name, animation_type, unit_scale)
    if AnimationDB.data[entity_type][name][animation_type]['effect'] then
        local animation = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['effect'])
        if unit_scale then
            animation.unit_scale = unit_scale
        end
        return animation
    end
end

---
--- Return draw_as_light mask
---
function AnimationDB.get_light_mask_animation(entity_type, name, animation_type, unit_scale)
    if AnimationDB.data[entity_type][name][animation_type]['light'] then
        local animation = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['light'])
        if unit_scale then
            animation.unit_scale = unit_scale
        end
        animation['draw_as_light'] = true
        return animation
    end
end


---
--- Return color mask for team colors
---
function AnimationDB.get_team_mask_animation(entity_type, name, animation_type, unit_scale)
    if AnimationDB.data[entity_type][name][animation_type]['team'] then
        local animation = util.table.deepcopy(AnimationDB.data[entity_type][name][animation_type]['team'])
        animation['tint'] = AnimationDB.data.default_team_color
        if unit_scale then
            animation.unit_scale = unit_scale
        end
        return animation
    end
end


function AnimationDB.alter_team_color(animation_data, color, disable_mask, preserve_gloss)
    if animation_data['layers'] then
        for index, animation_node in pairs(animation_data['layers']) do
            if (animation_node.filename and string.find( animation_node.filename, '_teamcolour') ~= nil) or
               (animation_node.filenames and string.find( animation_node.filenames[1], '_teamcolour') ~= nil) then
                if disable_mask then
                    animation_data['layers'][index] = nil
                else
                    animation_data['layers'][index]['tint'] = color
                    if preserve_gloss then
                        animation_data['layers'][index]['blend_mode'] = 'additive-soft'
                    end
                end
            end
        end
    end

    return animation_data
end

function AnimationDB.change_animation_speed(animation_data, speed)
    if animation_data['layers'] then
        for index, animation_node in pairs(animation_data['layers']) do
            if (animation_node.filename and string.find( animation_node.filename, '_teamcolour') ~= nil) or
                    (animation_node.filenames and string.find( animation_node.filenames[1], '_teamcolour') ~= nil) then
                animation_data['layers'][index]['animation_speed'] = speed
            end
        end
    elseif animation_data['animation_speed'] then
        animation_data['animation_speed'] = speed
    end

    return animation_data
end

return AnimationDB