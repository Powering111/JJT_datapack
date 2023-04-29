scoreboard objectives remove check_link
scoreboard objectives add check_link dummy

scoreboard players set 01 check_link 1

kill @e[tag=check_anchor]
tag @a[tag=check_enable] remove check_enable
clear @a nether_star{commandItem:true,n:1}