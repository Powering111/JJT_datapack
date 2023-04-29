tag @s remove magic_laser_enable
clear @s minecraft:stick{commandItem:true,n:2}
scoreboard players reset @s magic_laser_time
tellraw @s {"text":"[magic] Laser disabled!","color":"red"}