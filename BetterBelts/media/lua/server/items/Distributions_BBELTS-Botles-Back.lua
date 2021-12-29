Distributions = Distributions or {};

function insertTable(container, items)
	local data = ProceduralDistributions.list
	if not data then
		return ERROR('Better Belts ERROR: procedure distributions not found!')
	  end
	  if not data[container] then
		return ERROR('Better Belts ERROR: cant add '..items..' to procedure '..container)
	end

	for index, value in ipairs(items) do
		 table.insert(ProceduralDistributions.list[container].items, value);
	end
end


local bb_Botles_01 = {
	"Base.HookedWaterBottleEmptyYellow",0.1, -- 0.1
	"Base.HookedWaterBottleEmptyRed",0.1,
	"Base.HookedWaterBottleEmptyPurple",0.1,
	"Base.HookedWaterBottleEmptyOrange",0.1,
	"Base.HookedWaterBottleEmptyGreen",0.1,
 }

local bb_Botles_02 = {
	"Base.HookedWaterBottleEmptyYellow",0.2,  -- 0.2
	"Base.HookedWaterBottleEmptyRed",0.2,
	"Base.HookedWaterBottleEmptyPurple",0.2,
	"Base.HookedWaterBottleEmptyOrange",0.2,
	"Base.HookedWaterBottleEmptyGreen",0.2,
}
local bb_Botles_1 = {
	"Base.HookedWaterBottleEmptyYellow",1, -- 1
	"Base.HookedWaterBottleEmptyRed",1,
	"Base.HookedWaterBottleEmptyPurple",1,
	"Base.HookedWaterBottleEmptyOrange",1,
	"Base.HookedWaterBottleEmptyGreen",1,
 }
local bb_Botles_2 = {
	"Base.HookedWaterBottleEmptyYellow",2,  -- 2
	"Base.HookedWaterBottleEmptyRed",2,
	"Base.HookedWaterBottleEmptyPurple",2,
	"Base.HookedWaterBottleEmptyOrange",2,
	"Base.HookedWaterBottleEmptyGreen",2,
}

local bb_Botles_3 = {
	"Base.HookedWaterBottleEmptyYellow",3, -- 3
	"Base.HookedWaterBottleEmptyRed",3,
	"Base.HookedWaterBottleEmptyPurple",3,
	"Base.HookedWaterBottleEmptyOrange",3,
	"Base.HookedWaterBottleEmptyGreen",3,
}

 -- new distribution (b41.61+)
insertTable("GigamartBottles", bb_Botles_01)  			 -- grocery shelves / gigamart shelves  / generalstore
insertTable("BedroomSideTable", bb_Botles_01);   		 -- bedroom sidetable
insertTable("KitchenRandom", bb_Botles_01); 				 -- kitchen
insertTable("CrateRandomJunk", bb_Botles_01);  			 -- random junk

insertTable("StoreCounterBagsFancy", bb_Botles_02);    -- store counter

insertTable("GigamartHousewares", bb_Botles_1);			 -- housewarestore
insertTable("StoreCounterBagsFancy", bb_Botles_1);  	 -- store shelves 

insertTable("CampingStoreGear", bb_Botles_2); 			 -- camping shelves

insertTable("CrateSports", bb_Botles_3);  				 -- sportstore crate
insertTable("CrateCamping", bb_Botles_3);  				 -- camping crate

