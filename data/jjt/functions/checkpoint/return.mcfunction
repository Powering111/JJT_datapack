execute as @a[tag=check_enable,nbt=!{Inventory:[{id:"minecraft:nether_star",tag:{n:1,commandItem:true}}]}] run tag @s add check_return

# if no anchor set
execute as @a[tag=check_return] run tag @s add check_no_anchor
execute at @a[tag=check_return] as @e[tag=check_anchor] if score @s check_link = @p check_link run tag @p remove check_no_anchor
tellraw @a[tag=check_no_anchor] {"text":"No checkpoint set!","color":"yellow"}

# teleport to the anchor preserving rotation
execute at @a[tag=check_return,tag=!check_no_anchor] as @e[tag=check_anchor] if score @s check_link = @p check_link positioned as @s run teleport @s ~ ~ ~ ~ ~
execute at @a[tag=check_return,tag=!check_no_anchor] as @e[tag=check_anchor] if score @s check_link = @p check_link run teleport @p @s

# effect
execute at @a[tag=check_return,tag=!check_no_anchor] run particle minecraft:dust 0.5 1.0 0.5 1.0 ~ ~0.5 ~ 0.3 0.3 0.3 0.1 20
execute at @a[tag=check_return,tag=!check_no_anchor] run playsound entity.enderman.teleport player @a ~ ~ ~

tag @a[tag=check_no_anchor] remove check_no_anchor

give @a[tag=check_return] nether_star{display:{Name:'{"text":"Checkpoint","color":"yellow","italic":false}',Lore:['{"text":"Drop to go back to checkpoint","color":"gray"}']},commandItem:true,n:1}
tag @a[tag=check_return] remove check_return

# remove dropped item
kill @e[type=item,nbt={Item:{id:"minecraft:nether_star",tag:{commandItem:true,n:1}}}]