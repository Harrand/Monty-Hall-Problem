math.randomseed(os.time())
revealed_doors = {false, false, false}
function generate_doors()
	local doors = {false, false, false}
	doors[math.random(#doors)] = true
	return doors
end
for i, bool in ipairs(generate_doors()) do
	print(bool)	
end

function reveal_goat(doors)
	--todo: reveal any of the two goats.	
end