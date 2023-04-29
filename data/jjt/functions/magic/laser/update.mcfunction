execute as @a[tag=magic_laser_enable,tag=!magic_laser_waiting,nbt=!{Inventory:[{id:"minecraft:stick",tag:{n:2,commandItem:true}}]}] run tag @s add magic_laser_shoot

execute as @a[tag=magic_laser_shoot] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:[magic_laser_laser],Marker:true,Invulnerable:true,Invisible:true}
execute as @a[tag=magic_laser_shoot] at @s run teleport @e[tag=magic_laser_laser,limit=1,sort=nearest] ~ ~1.5 ~ ~ ~

tag @a[tag=magic_laser_shoot] add magic_laser_waiting
scoreboard players set @a[tag=magic_laser_shoot] magic_laser_cooltime 40
tag @a[tag=magic_laser_shoot] remove magic_laser_shoot

# cooltime
execute as @a[tag=magic_laser_waiting,scores={magic_laser_cooltime=1..}] run scoreboard players remove @s magic_laser_cooltime 1
give @a[tag=magic_laser_waiting,scores={magic_laser_cooltime=0}] minecraft:stick{Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1,display:{Name:'{"text":"Magic wand","color":"purple","italic":"false"}',Lore:['{"text":"Laser","color":"red","bold":true}','{"text":"Drop to use magic","color":"gray"}']},commandItem:true,n:2}
execute as @a[tag=magic_laser_waiting] run scoreboard players operation @s magic_laser_cooltime_s1 = @s magic_laser_cooltime
execute as @a[tag=magic_laser_waiting] run scoreboard players operation @s magic_laser_cooltime_s1 /= 01 magic_laser_cooltime_s1
execute as @a[tag=magic_laser_waiting] run scoreboard players operation @s magic_laser_cooltime_s2 = @s magic_laser_cooltime
execute as @a[tag=magic_laser_waiting] run scoreboard players operation @s magic_laser_cooltime_s2 %= 01 magic_laser_cooltime_s1
execute as @a[tag=magic_laser_waiting] run scoreboard players operation @s magic_laser_cooltime_s2 /= 02 magic_laser_cooltime_s1

title @a[tag=magic_laser_waiting] actionbar [{"text":"[magic] Laser : cool ","color":"yellow"},{"score":{"name":"*","objective":"magic_laser_cooltime_s1"},"color":"yellow"},{"text":".","color":"yellow"},{"score":{"name":"*","objective":"magic_laser_cooltime_s2"},"color":"yellow"},{"text":"s","color":"yellow"}]
title @a[tag=magic_laser_waiting,scores={magic_laser_cooltime=0}] actionbar {"text":"[magic] Laser : charged","color":"green"}
tag @a[tag=magic_laser_waiting,scores={magic_laser_cooltime=0}] remove magic_laser_waiting

# remove magic wand item
kill @e[type=item,nbt={Item:{id:"minecraft:stick",tag:{commandItem:true,n:2}}}]


# laser entity
execute as @e[tag=magic_laser_laser] at @s run tp @s ^ ^ ^1.9
execute at @e[tag=magic_laser_laser] run particle minecraft:dust 1.0 0.0 0.0 1.0 ~ ~ ~ 0.1 0.1 0.1 1 20

# lifetime expiration
scoreboard players add @e[tag=magic_laser_laser] magic_laser_lifetime 1
execute at @e[tag=magic_laser_laser,scores={magic_laser_lifetime=40..}] run particle minecraft:dust 0.2 0.0 1.0 1.0 ~ ~ ~ 0.2 0.2 0.2 1 30
kill @e[tag=magic_laser_laser,scores={magic_laser_lifetime=40..}]

# block hit
execute as @e[tag=magic_laser_laser] at @s unless block ~ ~ ~ minecraft:air run tag @s add magic_laser_laser_hit
# entity hit
execute as @e[tag=magic_laser_laser,scores={magic_laser_lifetime=2..}] at @s if entity @e[dx=1,dy=1,dz=1] run tag @s add magic_laser_laser_hit

execute as @e[tag=magic_laser_laser_hit,scores={magic_laser_lifetime=2..}] at @s run summon minecraft:tnt ~ ~ ~

kill @e[tag=magic_laser_laser_hit]