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
	print("switch")
	-- array looks like this: {false, true, false}
	-- we need to switch from one false to the other
	for i, bool in ipairs(revealed_doors) do
		if i ~= chosen and bool == false then
			chosen = i	
		end
	end
	return doors[chosen]
end

function play()
	local chosen = 1
	local doors = generate_doors()
	local revealed_doors = {false, false, false}
	reveal_goat(doors, chosen, revealed_doors)
	for i, bool in ipairs(doors) do
		if revealed_doors[i] then
			print(bool)
		else
			print("x")
		end
	end
	if math.random(2) == 1 then
		return finish_noswitch(chosen, doors)
	else
		return finish_switch(chosen, revealed_doors, doors)
	end
end

print("Did a play win: " .. tostring(play()))