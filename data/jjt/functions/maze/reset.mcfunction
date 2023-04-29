# maze_stack is used to store cell's stack value
# and some variables
scoreboard objectives remove maze_stack
scoreboard objectives add maze_stack dummy

# index number to push next (starting with 1)
scoreboard players set 01 maze_stack 1

# generating phase
scoreboard players set 02 maze_stack 1

# generated columns count
scoreboard players set 03 maze_stack 0
# generated rows count
scoreboard players set 04 maze_stack 0

# total columns count
scoreboard players set 05 maze_stack 40
# total rows count
scoreboard players set 06 maze_stack 40



# cleaning entities
kill @e[tag=maze_row]
kill @e[tag=maze_col]
kill @e[tag=maze_cell]
kill @e[tag=maze_current]


summon minecraft:armor_stand ~ ~ ~ {Tags:[maze_row],Marker:true}
summon minecraft:armor_stand ~ ~ ~ {Tags:[maze_current],Marker:true,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b},{id:"minecraft:diamond_leggings",Count:1b},{id:"minecraft:diamond_chestplate",Count:1b},{id:"minecraft:diamond_helmet",Count:1b}]}
# filling with solid block
fill ~-1 ~-1 ~-1 ~79 ~2 ~79 minecraft:polished_andesite
