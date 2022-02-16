local MapSymbolSizeSlider = {
	params = {
		defaultScale = ISMap.SCALE,
		currentScale = ISMap.SCALE,
		anchorElement = nil  -- last child by default
	},
	consts = {
		scaleMin = 0.066,
		scaleMax = 1.266,
		scaleStep = 0.1,
		
		-- Do not change. Used to determine scale from texture
		defaultSymbolHeight = 20, -- 20 px
		defaultTextHeight = getTextManager():getFontHeight(UIFont.Handwritten) -- 36 px
	},
	-- original functions that are being intercepted
	originalPZFuncs = {
		ISWorldMapSymbols = {
			prerender = ISWorldMapSymbols.prerender,
			createChildren = ISWorldMapSymbols.createChildren,
			new = ISWorldMapSymbols.new
		},
		ISWorldMapSymbolTool_EditNote = {
			onMouseDown = ISWorldMapSymbolTool_EditNote.onMouseDown,
			onEditNote = ISWorldMapSymbolTool_EditNote.onEditNote
		}
	}
}

require "RadioCom/ISUIRadio/ISSliderPanel"


local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local SCALE_MIN = MapSymbolSizeSlider.consts.scaleMin
local SCALE_MAX = MapSymbolSizeSlider.consts.scaleMax
local SCALE_STEP = MapSymbolSizeSlider.consts.scaleStep


MapSymbolSizeSlider.ISScaleSliderPanel = ISSliderPanel:derive("ISScaleSliderPanel");

function MapSymbolSizeSlider.ISScaleSliderPanel:render()
	ISSliderPanel.render(self)

	-- Draw helper hatch on default value
	local relativePos = (MapSymbolSizeSlider.params.defaultScale - SCALE_MIN) / (SCALE_MAX - SCALE_MIN)
	local hatchX = self.sliderBarDim.x + self.sliderBarDim.w * relativePos
	local hatchY = self.sliderBarDim.y + self.sliderDim.h / 2 + 2 
	self:drawRect(hatchX, hatchY, 1, 3, self.sliderBarBorderColor.a, self.sliderBarBorderColor.r, self.sliderBarBorderColor.g, self.sliderBarBorderColor.b)
end


function MapSymbolSizeSlider.onSliderChange(target, _newvalue)
	MapSymbolSizeSlider.params.currentScale = SCALE_MIN + SCALE_STEP * _newvalue
	ISMap.SCALE = MapSymbolSizeSlider.params.currentScale
end


function MapSymbolSizeSlider.createSlider(target, x, y, w, h, func)
	local slider = MapSymbolSizeSlider.ISScaleSliderPanel:new(x, y, w, h, target, func)
	slider.currentValue = (MapSymbolSizeSlider.params.currentScale - SCALE_MIN) / SCALE_STEP
	slider:setValues(0, (SCALE_MAX - SCALE_MIN) / SCALE_STEP, 1, 0)
	slider:initialise()
	slider:instantiate()
	slider.doToolTip = false

	return slider
end


function ISWorldMapSymbols:prerender()
	MapSymbolSizeSlider.originalPZFuncs.ISWorldMapSymbols.prerender(self)

	if MapSymbolSizeSlider.anchorElement == nil then return end
	
	local y = MapSymbolSizeSlider.anchorElement:getBottom() + FONT_HGT_SMALL + 2 * 2

	self:drawText(getText("IGUI_Map_MapSymbolSize"), self.width/2 - (getTextManager():MeasureStringX(UIFont.Small, getText("IGUI_Map_MapSymbolSize")) / 2), y, 1,1,1,1, UIFont.Small)
end


function ISWorldMapSymbols:createChildren()
	MapSymbolSizeSlider.originalPZFuncs.ISWorldMapSymbols.createChildren(self)
	
	if MapSymbolSizeSlider.anchorElement == nil then
		MapSymbolSizeSlider.anchorElement = self.children[ISUIElement.IDMax - 1]
	end

	local sldrWid = self.width - 20 * 2
	local sldrHgt = FONT_HGT_SMALL + 2 * 2
	local y = MapSymbolSizeSlider.anchorElement:getBottom() + sldrHgt + 20

	self.scaleSlider = MapSymbolSizeSlider.createSlider(self, 20, y, sldrWid, sldrHgt, MapSymbolSizeSlider.onSliderChange)
	self:addChild(self.scaleSlider)

	self:setHeight(self.scaleSlider:getBottom() + 20)
end


function ISWorldMapSymbolTool_EditNote:onMouseDown(...)
	if not self.symbolsUI.mouseOverNote then return false end
	if self.modal then return end
	
	-- if note is being edited, update scale for correct size render
	local symbol = self.symbolsAPI:getSymbolByIndex(self.symbolsUI.mouseOverNote)
	ISMap.SCALE = symbol:getDisplayHeight() / (self.mapAPI:getWorldScale() * MapSymbolSizeSlider.consts.defaultTextHeight)
	
	return MapSymbolSizeSlider.originalPZFuncs.ISWorldMapSymbolTool_EditNote.onMouseDown(self, ...)
end


function ISWorldMapSymbolTool_EditNote:onEditNote(...)
	MapSymbolSizeSlider.originalPZFuncs.ISWorldMapSymbolTool_EditNote.onEditNote(self, ...)

	-- return scale back to currentScale after note has been saved
	ISMap.SCALE = MapSymbolSizeSlider.params.currentScale
end


-- ExtraMapSymbolsUI mod compatability, they constantly refresh ui for some reason

local ISWorldMapSymbols_extraUI_Refresh = nil


function MapSymbolSizeSlider:extraUI_Refresh()
	ISWorldMapSymbols_extraUI_Refresh(self)
	
	local sldrHgt = FONT_HGT_SMALL + 2 * 2
	local x = ExtraMapSymbolsUI.CONST.ToolX
	local y = MapSymbolSizeSlider.anchorElement:getBottom() + sldrHgt + 20

	self.scaleSlider:setX(x)
	self.scaleSlider:setY(y)
	
	-- changing slider width (renders based on sliderBarDim, which is set in paginate func, no other way currently)
	ISUIElement.setWidth(self.scaleSlider, self:getWidth() - ExtraMapSymbolsUI.CONST.ToolX * 2)
	self.scaleSlider:paginate()

	self:setHeight(self.scaleSlider:getBottom() + 20)	
end


function ISWorldMapSymbols:new(...)
	-- if ExtraMapSymbolsUI mod is installed and decorator is not applied, apply my decorator
	if ExtraMapSymbolsUI ~= nil and self.extraUI_Refresh ~= nil and ISWorldMapSymbols_extraUI_Refresh == nil then
		ISWorldMapSymbols_extraUI_Refresh = self.extraUI_Refresh
		self.extraUI_Refresh = MapSymbolSizeSlider.extraUI_Refresh
	end

	return MapSymbolSizeSlider.originalPZFuncs.ISWorldMapSymbols.new(self, ...)
end


-- Never do:
-- TODO add mod settings
-- TODO block change note size while editing
-- TODO block slider if no pencil (onMouseMove + check inv)
