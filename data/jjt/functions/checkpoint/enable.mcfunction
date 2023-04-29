tag @s add check_enable
clear @s nether_star{commandItem:true,n:1}
give @s nether_star{display:{Name:'{"text":"Checkpoint","color":"yellow","italic":false}',Lore:['{"text":"Drop to go back to checkpoint","color":"gray"}']},commandItem:true,n:1}
tellraw @s {"text":"checkpoint enabled!","color":"green"}