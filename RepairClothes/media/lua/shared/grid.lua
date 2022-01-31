require 'vector2'

-- Grid ------------------------------------------------
-- combine grid with trees? -> cell becomes Qtree

local LEAF_WIDTH = 3
local floor = math.floor

grid = {}
grid.__index = grid

function grid:new(zombies, threshold) 
	o = {}
	o.cells = {} -- List of cells.
	o.threshold = threshold or 3
	o.thresholdSqr = o.threshold * o.threshold
	setmetatable (o, self)

	for j=0, zombies:size()-1 do
		local zombie = zombies:get(j)
		o:insert(zombie)
	end

	return o
end

-- Really coarse way of determining density
function grid:getDensity(zombie)
	local count = 0
	local neighbourhoodCount = 0
	local neighbourhood = self:getCells(zombie)
	for _,cell in pairs(neighbourhood) do
		
		neighbourhoodCount = neighbourhoodCount + 1		
		count = count + cell.size
	end
	return count / (--[[neighbourhoodCount *]] LEAF_WIDTH)
end

function grid:getCells(zombie) -- local use only please.
	local x, y = zombie:getX(), zombie:getY()
	local i, j = floor(x / LEAF_WIDTH), floor(y / LEAF_WIDTH)

	local neighbourhood = {} -- will hold all cells to check for neighbours
	local left  = floor((x - self.threshold) / LEAF_WIDTH) < i
	local right = floor((x + self.threshold) / LEAF_WIDTH) > i
	local down  = floor((y - self.threshold) / LEAF_WIDTH) < j
	local up    = floor((y + self.threshold) / LEAF_WIDTH) > j
	local l, r, d, u = i - 1, i + 1, j - 1, j + 1

	-- position might not be the same as when the grid calculated. Because of that the cell you inhabit might not be instantiated.
	if self.cells[i] ~= nil and self.cells[i][j] ~= nil then 
		table.insert(neighbourhood, self.cells[i][j])
	end
	
	-- Check if you need to add neighbouring cells and whether they exist.
	if left and self.cells[l] ~= nil then
		if self.cells[l][j] ~= nil then table.insert(neighbourhood, self.cells[l][j]) end
		if up 	and self.cells[l][u] ~= nil then table.insert(neighbourhood, self.cells[l][u]) end
		if down and self.cells[l][d] ~= nil then table.insert(neighbourhood, self.cells[l][d]) end
	end

	if right and self.cells[r] ~= nil then 
		if self.cells[r][j] ~= nil then table.insert(neighbourhood, self.cells[r][j]) end
		if up 	and self.cells[r][u] ~= nil then table.insert(neighbourhood, self.cells[r][u]) end
		if down and self.cells[r][d] ~= nil then table.insert(neighbourhood, self.cells[r][d]) end
	end

	if self.cells[i] ~= nil then
		if down and self.cells[i][d] then table.insert(neighbourhood, self.cells[i][d]) end
		if up 	and self.cells[i][u] then table.insert(neighbourhood, self.cells[i][u]) end
	end
	
	return neighbourhood
end

function grid:getNeighbours(zombie)  -- 
	local neighbourhood = self:getCells(zombie)
	local neighbours = {}

	for _, cell in ipairs(neighbourhood) do 
		for _, other in ipairs(cell) do
			distanceSqr = getDistance(zombie, other):getMagnitudeSqr()
			if distanceSqr < self.thresholdSqr and zombie ~= other then -- Within threshold and not yourself 
				table.insert(neighbours, other)
			end
		end
	end 

	return neighbours
end

function grid:insert(zombie) 
	local x, y = zombie:getX(), zombie:getY()
	local i, j = floor(x / LEAF_WIDTH), floor(y / LEAF_WIDTH)

	if not self.cells[i] then
		self.cells[i] = {}
	end
	local cell_i = self.cells[i]
	if not cell_i[j] then 
		cell_i[j] = {}
	end

	local cell = cell_i[j]
	table.insert(cell, zombie)

	if cell.size == nil then
		cell.size = 0
	end
	cell.size = cell.size + 1

	return cell
end
