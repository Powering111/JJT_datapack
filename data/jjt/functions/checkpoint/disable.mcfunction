tag @s remove check_enable
clear @s nether_star{commandItem:true,n:1}
execute at @s as @e[tag=check_anchor] if score @s check_link = @p check_link run kill @s
scoreboard players reset @s check_link
tellraw @s {"text":"checkpoint disabled!","color":"red"}