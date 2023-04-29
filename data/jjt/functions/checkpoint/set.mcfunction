execute as @a[tag=check_enable] at @s if block ~ ~-1 ~ minecraft:ochre_froglight run tag @s add check_set

# already checkpointed
execute at @a[tag=check_set] as @e[tag=check_anchor,distance=..1] if score @s check_link = @p check_link run tag @p remove check_set


# if anchor not exists, summon anchor
execute as @a[tag=check_set] run tag @s add check_summon
execute at @a[tag=check_set] as @e[tag=check_anchor] if score @s check_link = @p check_link run tag @p remove check_summon

# summon one by one ; need to increment link
execute at @a[tag=check_summon,limit=1] run summon minecraft:armor_stand ~0.5 ~ ~0.5 {Tags:[check_anchor],Invisible:true,Invulnerable:true,NoGravity:true,Marker:true}
scoreboard players add @e[tag=check_anchor] check_link 0
execute at @a[tag=check_summon,limit=1] as @e[tag=check_anchor,limit=1,scores={check_link=0}] run scoreboard players operation @s check_link = 01 check_link
execute as @a[tag=check_summon,limit=1] run scoreboard players operation @s check_link = 01 check_link

execute as @a[tag=check_summon,limit=1] run scoreboard players add 01 check_link 1
execute as @a[tag=check_summon,limit=1] run tag @s remove check_summon

# teleport anchor to player
execute at @a[tag=check_set] as @e[tag=check_anchor] if score @s check_link = @p check_link align xyz run teleport @s ~0.5 ~ ~0.5

# awesome effect
execute at @a[tag=check_set] align xyz run particle minecraft:dust 1.0 1.0 0.0 1.0 ~0.5 ~0.5 ~0.5 0.3 0.1 0.3 0.1 20
execute at @a[tag=check_set] align xyz run particle minecraft:firework ~0.5 ~1.5 ~0.5 0.2 0.1 0.2 0.1 20
execute at @a[tag=check_set] run playsound minecraft:entity.experience_orb.pickup player @a ~ ~ ~

tag @a[tag=check_set] remove check_set