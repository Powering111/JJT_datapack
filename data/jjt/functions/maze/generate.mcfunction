# generating columns

execute if score 02 maze_stack matches 1 as @e[tag=maze_row,limit=1] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:[maze_col],Marker:true}
execute if score 02 maze_stack matches 1 as @e[tag=maze_row,limit=1] at @s run tp @s ~2 ~ ~

execute if score 02 maze_stack matches 1 run scoreboard players add 03 maze_stack 1
execute if score 02 maze_stack matches 1 if score 03 maze_stack >= 05 maze_stack run kill @e[tag=maze_row]
execute if score 02 maze_stack matches 1 if score 03 maze_stack >= 05 maze_stack run scoreboard players set 02 maze_stack 2

# generating rows
execute if score 02 maze_stack matches 2 as @e[tag=maze_col] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:[maze_cell],Marker:true,Invisible:true}
execute if score 02 maze_stack matches 2 as @e[tag=maze_col] at @s run tp @s ~ ~ ~2

execute if score 02 maze_stack matches 2 run scoreboard players add 04 maze_stack 1
execute if score 02 maze_stack matches 2 if score 04 maze_stack >= 06 maze_stack run kill @e[tag=maze_col]
execute if score 02 maze_stack matches 2 if score 04 maze_stack >= 06 maze_stack run scoreboard players set 02 maze_stack 3

# setting initial stack (push initial cell)
execute if score 02 maze_stack matches 3 run scoreboard players operation @e[tag=maze_cell,limit=1,sort=nearest] maze_stack = 01 maze_stack
execute if score 02 maze_stack matches 3 run tag @e[tag=maze_cell,limit=1,sort=nearest] add maze_visited
execute if score 02 maze_stack matches 3 run scoreboard players add 01 maze_stack 1

execute if score 02 maze_stack matches 3 at @e[tag=maze_cell] run fill ~ ~ ~ ~ ~2 ~ minecraft:air

execute if score 02 maze_stack matches 3 run scoreboard players set 02 maze_stack 4

# while stack is not empty

#  pop -> current
execute if score 02 maze_stack matches 4 if score 01 maze_stack matches 0 run scoreboard players set 02 maze_stack 6
execute if score 02 maze_stack matches 4 run scoreboard players remove 01 maze_stack 1
execute if score 02 maze_stack matches 4 as @e[tag=maze_cell] if score @s maze_stack = 01 maze_stack run teleport @e[tag=maze_current,limit=1] @s
execute if score 02 maze_stack matches 4 as @e[tag=maze_cell] if score @s maze_stack = 01 maze_stack run scoreboard players reset @s maze_stack


#  get neighbor unvisited cells
execute if score 02 maze_stack matches 4 run tag @e[tag=maze_neighbor] remove maze_neighbor
execute if score 02 maze_stack matches 4 at @e[tag=maze_current,limit=1] positioned ~2 ~ ~ run tag @e[distance=..0.1,tag=maze_cell,tag=!maze_visited] add maze_neighbor
execute if score 02 maze_stack matches 4 at @e[tag=maze_current,limit=1] positioned ~-2 ~ ~ run tag @e[distance=..0.1,tag=maze_cell,tag=!maze_visited] add maze_neighbor
execute if score 02 maze_stack matches 4 at @e[tag=maze_current,limit=1] positioned ~ ~ ~2 run tag @e[distance=..0.1,tag=maze_cell,tag=!maze_visited] add maze_neighbor
execute if score 02 maze_stack matches 4 at @e[tag=maze_current,limit=1] positioned ~ ~ ~-2 run tag @e[distance=..0.1,tag=maze_cell,tag=!maze_visited] add maze_neighbor

# if there is no neighbor, continue
execute if score 02 maze_stack matches 4 if entity @e[tag=maze_neighbor] run scoreboard players set 02 maze_stack 5

# push current cell
execute if score 02 maze_stack matches 5 at @e[tag=maze_current] run scoreboard players operation @e[tag=maze_cell,distance=..0.1,limit=1] maze_stack = 01 maze_stack
execute if score 02 maze_stack matches 5 run scoreboard players add 01 maze_stack 1


#  choose random neighbor
execute if score 02 maze_stack matches 5 run tag @e[tag=maze_chosen] remove maze_chosen
execute if score 02 maze_stack matches 5 run tag @e[tag=maze_neighbor,sort=random,limit=1] add maze_chosen
execute if score 02 maze_stack matches 5 run tag @e[tag=maze_chosen] add maze_visited


#  remove wall between them
execute if score 02 maze_stack matches 5 at @e[tag=maze_current,limit=1] positioned ~2 ~ ~ if entity @e[distance=..0.1,tag=maze_chosen] run fill ~-1 ~ ~ ~-1 ~2 ~ minecraft:air
execute if score 02 maze_stack matches 5 at @e[tag=maze_current,limit=1] positioned ~-2 ~ ~ if entity @e[distance=..0.1,tag=maze_chosen] run fill ~1 ~ ~ ~1 ~2 ~ minecraft:air
execute if score 02 maze_stack matches 5 at @e[tag=maze_current,limit=1] positioned ~ ~ ~2 if entity @e[distance=..0.1,tag=maze_chosen] run fill ~ ~ ~-1 ~ ~2 ~-1 minecraft:air
execute if score 02 maze_stack matches 5 at @e[tag=maze_current,limit=1] positioned ~ ~ ~-2 if entity @e[distance=..0.1,tag=maze_chosen] run fill ~ ~ ~1 ~ ~2 ~1 minecraft:air


#  push chosen cell to stack
execute if score 02 maze_stack matches 5 as @e[tag=maze_chosen] run scoreboard players operation @s maze_stack = 01 maze_stack
execute if score 02 maze_stack matches 5 run scoreboard players add 01 maze_stack 1

execute if score 02 maze_stack matches 5 run scoreboard players set 02 maze_stack 4

# end while

# cleanup
execute if score 02 maze_stack matches 6 run kill @e[tag=maze_cell]
execute if score 02 maze_stack matches 6 run kill @e[tag=maze_current]
execute if score 02 maze_stack matches 6 run tellraw @a {"text":"Maze generation finished!","color":"yellow"}
execute if score 02 maze_stack matches 6 run scoreboard players set 02 maze_stack 7
