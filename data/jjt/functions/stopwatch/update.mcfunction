execute if score 00 stopwatch matches 1 run scoreboard players add 01 stopwatch 1

# 02 <- ticks
execute if score 00 stopwatch matches 1 run scoreboard players operation 02 stopwatch = 01 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 03 stopwatch = 01 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 03 stopwatch %= 07 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 03 stopwatch /= 10 stopwatch

# 02 <- seconds
execute if score 00 stopwatch matches 1 run scoreboard players operation 02 stopwatch /= 07 stopwatch

execute if score 00 stopwatch matches 1 run scoreboard players operation 04 stopwatch = 02 stopwatch
# 04 <- minutes
execute if score 00 stopwatch matches 1 run scoreboard players operation 04 stopwatch /= 08 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 05 stopwatch = 04 stopwatch
# 05 <- hours
execute if score 00 stopwatch matches 1 run scoreboard players operation 05 stopwatch /= 08 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 06 stopwatch = 05 stopwatch
# 06 <- days
execute if score 00 stopwatch matches 1 run scoreboard players operation 06 stopwatch /= 09 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 05 stopwatch %= 09 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 04 stopwatch %= 08 stopwatch
execute if score 00 stopwatch matches 1 run scoreboard players operation 02 stopwatch %= 08 stopwatch


# show
execute unless score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d 0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d "},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d 0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d "},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d 0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d "},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d 0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute unless score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"score":{"name":"06","objective":"stopwatch"}},{"text":"d "},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]

execute if score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"text":"0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"text":""},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"text":"0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 if score 02 stopwatch matches 0..9 run title @a actionbar [{"text":""},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"text":"0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 if score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"text":""},{"score":{"name":"05","objective":"stopwatch"}},{"text":":0"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 if score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"text":"0"},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
execute if score 06 stopwatch matches 0 unless score 05 stopwatch matches 0..9 unless score 04 stopwatch matches 0..9 unless score 02 stopwatch matches 0..9 run title @a actionbar [{"text":""},{"score":{"name":"05","objective":"stopwatch"}},{"text":":"},{"score":{"name":"04","objective":"stopwatch"}},{"text":":"},{"score":{"name":"02","objective":"stopwatch"}},{"text":"."},{"score":{"name":"03","objective":"stopwatch"}}]
