--Default options.
local OPTIONS = {
  box1 = false,
}

-- Connecting the options to the menu, so user can change them.
if ModOptions and ModOptions.getInstance then
  local settings = ModOptions:getInstance(OPTIONS, "VDK", "Vac's Drinks")

  settings.names = {
    box1 = "Use only pre-1993 drinks",
  }
end

--Make a link
VACS_DRINKS_MO = {} -- global variable (pick another name!)
VACS_DRINKS_MO.OPTIONS = OPTIONS
