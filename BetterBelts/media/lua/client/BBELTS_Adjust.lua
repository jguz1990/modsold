function Adjust(Name, Property, Value)
Item = ScriptManager.instance:getItem(Name)
Item:DoParam(Property.." = "..Value)
end

Adjust("Radio.WalkieTalkie1","Weight","0.01")

Adjust("Radio.WalkieTalkie2","Weight","0.01")

Adjust("Radio.WalkieTalkie3","Weight","0.01")

Adjust("Radio.WalkieTalkie4","Weight","0.01")

Adjust("Radio.WalkieTalkie5","Weight","0.01")

Adjust("Radio.WalkieTalkieMakeShift","Weight","0.01")





