Events.OnGameBoot.Add(function()
	--if getActivatedMods():contains("ItemTweakerAPI") then
	--require("ItemTweaker_Core");
	--else return end

	TweakItem("Base.Banjo","SwingSound", "Banjo2");
	TweakItem("Base.GuitarAcoustic","SwingSound", "GuitarBonk1");
	TweakItem("Base.GuitarElectricBassBlack","SwingSound", "Bass");
	TweakItem("Base.GuitarElectricBassBlue","SwingSound", "Bass");
	TweakItem("Base.GuitarElectricBassRed","SwingSound", "Bass");
	TweakItem("Base.Keytar","SwingSound", "Synth");
	TweakItem("Base.GuitarElectriclack","SwingSound", "Lectric");
	TweakItem("Base.GuitarElectricBlue","SwingSound", "Lectric");
	TweakItem("Base.GuitarElectricRed","SwingSound", "Lectric");
	TweakItem("Base.Saxophone","SwingSound", "SaxAppeal");
	TweakItem("Base.Trumpet","SwingSound", "Trumpet");
	TweakItem("Base.Violin","SwingSound", "Violin");
	TweakItem("Base.Drumstick","SwingSound", "Rimshot");
	TweakItem("Base.Flute","SwingSound", "Flute");

	
end)