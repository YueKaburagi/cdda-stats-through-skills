--Increasing stats by skill
local MOD = {
    supportedVersion = "cdda0.C-4253",
    str_skills = {"carpentry", "mechanics", "swimming", "bashing", "melee", "throw"},
    dex_skills = {"driving", "survival", "tailor", "traps", "dodge", "stabbing", "unarmed"},
    int_skills = {"barter", "computer", "cooking", "electronics", "fabrication", "firstaid", "speech"},
    per_skills = {"archery", "gun", "launcher", "pistol", "rifle", "shotgun", "smg"},
    base_weight = 4
}

mods["yk_stats_through_skills"] = MOD

function MOD.on_day_passed()
    game.add_msg("Calculating new stats based off skills")

    setStatBonus(efftype_id("exp_str"), calculateStatBonus(MOD.str_skills, MOD.base_weight), "Str")
    setStatBonus(efftype_id("exp_dex"), calculateStatBonus(MOD.dex_skills, MOD.base_weight), "Dex")
    setStatBonus(efftype_id("exp_int"), calculateStatBonus(MOD.int_skills, MOD.base_weight), "Int")
    setStatBonus(efftype_id("exp_per"), calculateStatBonus(MOD.per_skills, MOD.base_weight), "Per")
end

function calculateStatBonus(aSkills, iBase)
    local skillFactor = 0
    for key, value in ipairs(aSkills) do
        skillFactor = skillFactor + player:get_skill_level(skill_id(value))
    end
    local skillBonus = -1
    repeat
	skillBonus = skillBonus + 1
	skillFactor = skillFactor - (iBase+skillBonus)
    until skillFactor < 0
    return skillBonus
end

function setStatBonus(idEffect, iBonus, sStatIdent)
    local iBonusOld = player:get_effect_int(idEffect, "num_bp")
    if not player:has_effect(idEffect, "num_bp") then
        iBonusOld = 0
    end
    if (iBonus > 0) then
        player:add_effect(idEffect, 1, "num_bp", true, iBonus)
    else
        player:remove_effect(idEffect, "num_bp")
    end
    print_results(iBonus, sStatIdent, iBonusOld)
end

function print_results(stat_bonus,stat,player_stat)
    if (player_stat < stat_bonus) then
        game.add_msg("Raising "..stat.." bonus to "..tostring(stat_bonus))
    elseif (player_stat > stat_bonus) then
        game.add_msg("Lowering "..stat.." bonus to "..tostring(stat_bonus))
    end
end
