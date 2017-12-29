math.randomseed(os.time())
function generate_doors()
	local doors = {false, false, false}
	doors[math.random(#doors)] = true
	return doors
end

function reveal_goat(doors, chosen, revealed_doors)
	for i, bool in ipairs(doors) do
		-- reveal if its a goat and not the one weve currently chosen
		if bool == false and i ~= chosen then
			revealed_doors[i] = true
			return
		end
	end
end

function finish_noswitch(chosen, doors)
	return doors[chosen]
end

function finish_switch(chosen, revealed_doors, doors)
	-- array looks like this: {false, true, false}
	-- we need to switch from one false to the other
	for i, bool in ipairs(revealed_doors) do
		if i ~= chosen and bool == false then
			chosen = i	
		end
	end
	return doors[chosen]
end

function play(will_switch)
	local chosen = 1
	local doors = generate_doors()
	local revealed_doors = {false, false, false}
	reveal_goat(doors, chosen, revealed_doors)
	if will_switch then
		return finish_switch(chosen, revealed_doors, doors)
	else
		return finish_noswitch(chosen, doors)
	end
end

tests = 1000000
wins_switching = 0
wins_not_switching = 0
for i = 0,tests,1 do
	wins_switching = wins_switching + (play(true) and 1 or 0)
end
for i = 0,tests,1 do
	wins_not_switching = wins_not_switching + (play(false) and 1 or 0)	
end
probability_win_switching = wins_switching / tests
probability_win_not_switching = wins_not_switching / tests
print("Number of tests performed = " .. tostring(tests))
print("Probability of winning with switching = " .. tostring(probability_win_switching * 100) .. "%")
print("Probability of winning without switching = " .. tostring(probability_win_not_switching * 100) .. "%")