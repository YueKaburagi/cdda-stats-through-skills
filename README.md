#これについて
StatsThroughSkillsIIの勝手改造版です  
キャラクターメイク時のステータスはそのままに、ボーナスが乗る形で成長します。  

始めのころはぐんぐん成長しますが、次第に遅くなっていきます。成長の上限は定めていませんが、技能のレベルアップが劣化に追い付かなくなったところが限界点と言えるでしょう。  
能力値は技能系統のレベルの合計値によって変化します。参照する技能数の関係で筋肉はやや不遇ですが、そんなことをものともしない強さが筋肉には備わっていると信じています。  
##対応バージョン
- 0.C-4253
main.lua内部の`MOD.supportedVersion`が正しい情報です。

##難易度調整
main.lua内部の
```lua
local MOD = {
    ...,
    base_weight = 4
}
```
の数字を重くすると成長が遅く、軽くすると成長が速くなります。(0以上の整数)

##modつくるひとへ
`mods["yk_stats_through_skills"]`の下に計算時に参照する技能のリストがあるので、
オリジナル技能を反映させたいとかあったらそれを弄くりまわすとしあわせになれます。  
(`mods["yk_stats_through_skills"] ~= nil` とかしてコード上でチェックすると依存性が低下してよさげ)

