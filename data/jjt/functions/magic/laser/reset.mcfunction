scoreboard objectives remove magic_laser_time
scoreboard objectives add magic_laser_time dummy

scoreboard objectives remove magic_laser_cooltime
scoreboard objectives add magic_laser_cooltime dummy

scoreboard objectives remove magic_laser_cooltime_s1
scoreboard objectives add magic_laser_cooltime_s1 dummy

scoreboard objectives remove magic_laser_cooltime_s2
scoreboard objectives add magic_laser_cooltime_s2 dummy

scoreboard objectives remove magic_laser_lifetime
scoreboard objectives add magic_laser_lifetime dummy

scoreboard players set 01 magic_laser_cooltime_s1 20
scoreboard players set 02 magic_laser_cooltime_s1 2

tag @a[tag=magic_laser_enable] remove magic_laser_enable
kill @e[tag=magic_laser_laser]
clear @a minecraft:stick{commandItem:true,n:2}