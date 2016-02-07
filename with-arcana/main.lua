
local MOD = {}

mods["yk_stats_through_skills_with_arcana"] = MOD

if mods["yk_stats_through_skills"] ~= nil then
   table.insert(mods["yk_stats_through_skills"].int_skills, "magic")
end