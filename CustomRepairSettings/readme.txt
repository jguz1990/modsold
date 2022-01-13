Dedicated server installation (works for existing saves)

1. Open server folder: \<user>\Zomboid\Server\.

2. Open servertest.ini.
   Find "Mods=" or "Mods=<mod1>;<mod2>;..." if you already have some mods.
   Add Mod ID (CustomRepairSettings): "Mods=CustomRepairSettings" or "Mods=<mod1>;<mod2>;...;CustomRepairSettings".
   Find "WorkshopItems=" or "WorkshopItems=<num1>;<num2>;..." if you already have some mods.
   Add Workshop IP (2716726628): "WorkshopItems=2716726628" or "WorkshopItems=<num1>;<num2>;...;2716726628".
   Save file.

3. Open servertest_SandboxVars.lua.
   Add these lines (settings) after "SandboxVars = {" line

CustomRepairSettings = {
    NoPenaltiesMechanics = true,
    NoPenaltiesOther = true,
    MaxCondPotentialRepairMechanics = 2,
    MaxCondPotentialRepairOther = 2,
},

   Settings:
   a. NoPenaltiesMechanics (false/true) - is repair counter disabled for vehicle parts (false is vanilla).
   b. NoPenaltiesOther (false/true) - is repair counter disabled for other items (false is vanilla).
   c. MaxCondPotentialRepairMechanics (1/2) - 1 is vanilla, 2 is modded (check steam workshop description).
   d. MaxCondPotentialRepairOther (1/2) - 1 is vanilla, 2 is modded (check steam workshop description).

   Save file.

4. You can start server.
