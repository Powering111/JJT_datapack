tag @s add magic_laser_enable
clear @s minecraft:stick{commandItem:true,n:2}
give @s minecraft:stick{Enchantments:[{id:"minecraft:sharpness",lvl:1s}],HideFlags:1,display:{Name:'{"text":"Magic wand","color":"purple","italic":"false"}',Lore:['{"text":"Laser","color":"red","bold":true}','{"text":"Drop to use magic","color":"gray"}']},commandItem:true,n:2}
tellraw @s {"text":"[magic] Laser enabled!","color":"green"}