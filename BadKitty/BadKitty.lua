--LEGAL: Blah blah blah use at your own risk blah blah blah.

function BadKitty_Output(text)
	DEFAULT_CHAT_FRAME:AddMessage(text);
end


function BadKitty_OnLoad()
	--seterrorhandler(ErrorWithStack)
	this:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("ADDON_LOADED");
	this:RegisterEvent("PLAYER_TARGET_CHANGED")
	this:RegisterEvent("PLAYER_REGEN_DISABLED")
	--					1			2			3			4			5		6		7		8			9		10
	--					height		width		version		barratio	BBars	font	chide	Bwarnings	Cbars	ooc
	BadKittySaves = 	{15			,110		,0			,0			,1		,12		,1		,1			,1		,1
	
	--					11			12			13		14			15			16		17		18			19			20			21
	--					Cwarnings	warntime	walph	cor			bor			wsize	BKWmod	Wcolors		Wfont		>.>			zerkd
						,1			,3			,0.5	,{3,'c'}	,{3,'c'}	,50		,0		,1			,30			,1			,1}
												
	BadKittyDefaults = BadKittySaves
	BadKittyFrame:SetClampedToScreen(true)
	BadKitty_LoadFrames()
	LacCount = 0
	BadKittyLock = 1
	BadKittyRipRefresh = 0
	BadKittyRed = {1,0,0}
	BadKittyWhite = {1,1,1}
	BadKittyGreen = {0,1,0}
end


function BadKitty_LoadFrames()
	--					1	2		3		4		5		6		7		8		9		10		11	12	13		14		15	
	--					SR	Man-C	Rake	Rip		FFF		Combo	TF		Zerk	Energy	Shred	PS	Wep	Trink1	Trink2	Idol
	BadKittyCFrames = 	{1	,2		,3		,4		,5		,6		,7		,8		,9		,10		,11	,12	,13		,14		,15}
	
	--					1		2		3		4		5		6		7
	--					Man		Demo	Lac		FFF		BS		Zerk	Rage
	BadKittyBFrames = 	{1		,2		,3		,4		,5		,6		,7}
	
	--					1	2		3		4		5		6		7		8		9		10		11		12		13
	--					SR	Rake	FFF		TF		OOC		Rip		Man		Zerk	Shred	Wep		Trink1	Trink2	Idol
	BadKittyWCFrames =	{1	,2		,3		,4		,5		,6		,7		,8		,9		,10		,11		,12		,13}
	
	--					1	2		3		4		5		6		7		8		9
	--					Lac	Demo	FFF		Man		BS		Zerk
	BadKittyWBFrames =	{1	,2		,3		,4		,5		,6}
	
	BadKittyCatSRColors =		{0,0,1}
	BadKittyCatMangleColors =	{.9,0,0}
	BadKittyCatRakeColors =		{.9,0,0}
	BadKittyCatRipColors =		{.9,0,0}
	BadKittyCatFFFColors =		{.9,0,0.9}
	BadKittyCatTFColors =		{.9,.9,0}
	BadKittyCatZerkColors =		{0,0,1}
	BadKittyCatEnergyColors =	{.9,.9,0}
	BadKittyCatPSColors =		{0,0.9,0}
	BadKittyCatTrink1Colors =	{1,0.9,0}
	BadKittyCatTrink2Colors =	{0,0.9,1}
	BadKittyCatIdolColors =		{1,0,1}
	BadKittyCatEnchantColors =	{0,0.9,0}
	BadKittyBearMangleColors =	{.9,0,0}
	BadKittyBearDemoColors =	{0,0,1}
	BadKittyBearLacColors =		{.9,0,0}
	BadKittyBearFFFColors =		{.9,0,0.9}
	BadKittyBearBSColors =		{.9,.9,0}
	BadKittyBearZerkColors =	{0,0,1}
	BadKittyBearRageColors =	{.9,0,0}
	BadKittyCatCount=11
	BadKittyBearCount=7
	BadKittyWCatCount=9
	BadKittyWBearCount=6
	BadKittyZerkUp = 0
	BadKittyFrame:SetClampedToScreen(true)
	BadKittyDefaultCFrames = BadKittyCFrames
	BadKittyDefaultBFrames = BadKittyBFrames
	BadKittyTextColor =			{1,1,0}
	BadKittyWarningTextColor =	{1,1,0}
	BadKittyBarTexture = [[Interface\Addons\BadKitty\bars\BantoBar]]
end

function BadKitty_SetFrames()	--really ugly
	if BadKittyWCFrames[10]==nil then return end
	local _G = getfenv()
	BadKittyCatSR = _G["BadKittyFrameBar"..BadKittyCFrames[1]]
	BadKittyCatMangle = _G["BadKittyFrameBar"..BadKittyCFrames[2]]
	BadKittyCatRake = _G["BadKittyFrameBar"..BadKittyCFrames[3]]
	BadKittyCatRip = _G["BadKittyFrameBar"..BadKittyCFrames[4]]
	BadKittyCatFFF = _G["BadKittyFrameBar"..BadKittyCFrames[5]]
	BadKittyCatCP = _G["BadKittyFrameBar"..BadKittyCFrames[6]]
	BadKittyCatTF = _G["BadKittyFrameBar"..BadKittyCFrames[7]]
	BadKittyCatZerk = _G["BadKittyFrameBar"..BadKittyCFrames[8]]
	BadKittyCatEnergy = _G["BadKittyFrameBar"..BadKittyCFrames[9]]
	BadKittyCatShred = _G["BadKittyFrameBar"..BadKittyCFrames[10]]
	BadKittyCatPS = _G["BadKittyFrameBar"..BadKittyCFrames[11]]
	BadKittyCatEnchant = _G["BadKittyFrameBar"..BadKittyCFrames[12]]
	BadKittyCatTrink1 = _G["BadKittyFrameBar"..BadKittyCFrames[13]]
	BadKittyCatTrink2 = _G["BadKittyFrameBar"..BadKittyCFrames[14]]
	BadKittyCatIdol = _G["BadKittyFrameBar"..BadKittyCFrames[15]]
	BadKittyBearMangle = _G["BadKittyBearBar"..BadKittyBFrames[1]]
	BadKittyBearDemo = _G["BadKittyBearBar"..BadKittyBFrames[2]]
	BadKittyBearLac = _G["BadKittyBearBar"..BadKittyBFrames[3]]
	BadKittyBearFFF = _G["BadKittyBearBar"..BadKittyBFrames[4]]
	--BadKittyBearBash = _G["BadKittyBearBar"..BadKittyBFrames[5]]
	BadKittyBearBS = _G["BadKittyBearBar"..BadKittyBFrames[5]]
	BadKittyBearZerk = _G["BadKittyBearBar"..BadKittyBFrames[6]]
	BadKittyBearRage = _G["BadKittyBearBar"..BadKittyBFrames[7]]
	
	BadKittyCatSRText = _G["BadKittyFrameBar"..BadKittyCFrames[1].."Text"]
	BadKittyCatMangleText = _G["BadKittyFrameBar"..BadKittyCFrames[2].."Text"]
	BadKittyCatRakeText = _G["BadKittyFrameBar"..BadKittyCFrames[3].."Text"]
	BadKittyCatRipText = _G["BadKittyFrameBar"..BadKittyCFrames[4].."Text"]
	BadKittyCatFFFText = _G["BadKittyFrameBar"..BadKittyCFrames[5].."Text"]
	BadKittyCatCPText = _G["BadKittyFrameBar"..BadKittyCFrames[6].."Text"]
	BadKittyCatTFText = _G["BadKittyFrameBar"..BadKittyCFrames[7].."Text"]
	BadKittyCatZerkText = _G["BadKittyFrameBar"..BadKittyCFrames[8].."Text"]
	BadKittyCatEnergyText = _G["BadKittyFrameBar"..BadKittyCFrames[9].."Text"]
	BadKittyCatShredText = _G["BadKittyFrameBar"..BadKittyCFrames[10].."Text"]
	BadKittyCatPSText = _G["BadKittyFrameBar"..BadKittyCFrames[11].."Text"]
	BadKittyCatEnchantText = _G["BadKittyFrameBar"..BadKittyCFrames[12].."Text"]
	BadKittyCatTrink1Text = _G["BadKittyFrameBar"..BadKittyCFrames[13].."Text"]
	BadKittyCatTrink2Text = _G["BadKittyFrameBar"..BadKittyCFrames[14].."Text"]
	BadKittyCatIdolText = _G["BadKittyFrameBar"..BadKittyCFrames[15].."Text"]
	BadKittyBearMangleText = _G["BadKittyBearBar"..BadKittyBFrames[1].."Text"]
	BadKittyBearDemoText = _G["BadKittyBearBar"..BadKittyBFrames[2].."Text"]
	BadKittyBearLacText = _G["BadKittyBearBar"..BadKittyBFrames[3].."Text"]
	BadKittyBearFFFText = _G["BadKittyBearBar"..BadKittyBFrames[4].."Text"]
	BadKittyBearBSText = _G["BadKittyBearBar"..BadKittyBFrames[5].."Text"]
	BadKittyBearZerkText = _G["BadKittyBearBar"..BadKittyBFrames[6].."Text"]
	BadKittyBearRageText = _G["BadKittyBearBar"..BadKittyBFrames[7].."Text"]
	--BadKittyBearBashText = _G["BadKittyBearBar"..BadKittyBFrames[5].."Text"]
	
	BadKittyCatSRSecs = _G["BadKittyFrameBar"..BadKittyCFrames[1].."Secs"]
	BadKittyCatMangleSecs = _G["BadKittyFrameBar"..BadKittyCFrames[2].."Secs"]
	BadKittyCatRakeSecs = _G["BadKittyFrameBar"..BadKittyCFrames[3].."Secs"]
	BadKittyCatRipSecs = _G["BadKittyFrameBar"..BadKittyCFrames[4].."Secs"]
	BadKittyCatFFFSecs = _G["BadKittyFrameBar"..BadKittyCFrames[5].."Secs"]
	BadKittyCatCPSecs = _G["BadKittyFrameBar"..BadKittyCFrames[6].."Secs"]
	BadKittyCatTFSecs = _G["BadKittyFrameBar"..BadKittyCFrames[7].."Secs"]
	BadKittyCatZerkSecs = _G["BadKittyFrameBar"..BadKittyCFrames[8].."Secs"]
	BadKittyCatEnergySecs = _G["BadKittyFrameBar"..BadKittyCFrames[9].."Secs"]
	BadKittyCatShredSecs = _G["BadKittyFrameBar"..BadKittyCFrames[10].."Secs"]
	BadKittyCatPSSecs = _G["BadKittyFrameBar"..BadKittyCFrames[11].."Secs"]
	BadKittyCatEnchantSecs = _G["BadKittyFrameBar"..BadKittyCFrames[12].."Secs"]
	BadKittyCatTrink1Secs = _G["BadKittyFrameBar"..BadKittyCFrames[13].."Secs"]
	BadKittyCatTrink2Secs = _G["BadKittyFrameBar"..BadKittyCFrames[14].."Secs"]
	BadKittyCatIdolSecs = _G["BadKittyFrameBar"..BadKittyCFrames[15].."Secs"]
	BadKittyBearMangleSecs = _G["BadKittyBearBar"..BadKittyBFrames[1].."Secs"]
	BadKittyBearDemoSecs = _G["BadKittyBearBar"..BadKittyBFrames[2].."Secs"]
	BadKittyBearLacSecs = _G["BadKittyBearBar"..BadKittyBFrames[3].."Secs"]
	BadKittyBearFFFSecs = _G["BadKittyBearBar"..BadKittyBFrames[4].."Secs"]
	BadKittyBearBSSecs = _G["BadKittyBearBar"..BadKittyBFrames[5].."Secs"]
	BadKittyBearZerkSecs = _G["BadKittyBearBar"..BadKittyBFrames[6].."Secs"]
	BadKittyBearRageSecs = _G["BadKittyBearBar"..BadKittyBFrames[7].."Secs"]
	--BadKittyBearBashSecs = _G["BadKittyBearBar"..BadKittyBFrames[5].."Secs"]
	
	BadKittyCatSRIcon = _G["BadKittyCatIcon"..BadKittyCFrames[1]]
	BadKittyCatMangleIcon = _G["BadKittyCatIcon"..BadKittyCFrames[2]]
	BadKittyCatRakeIcon = _G["BadKittyCatIcon"..BadKittyCFrames[3]]
	BadKittyCatRipIcon = _G["BadKittyCatIcon"..BadKittyCFrames[4]]
	BadKittyCatFFFIcon = _G["BadKittyCatIcon"..BadKittyCFrames[5]]
	BadKittyCatCPIcon = _G["BadKittyCatIcon"..BadKittyCFrames[6]]
	BadKittyCatTFIcon = _G["BadKittyCatIcon"..BadKittyCFrames[7]]
	BadKittyCatZerkIcon = _G["BadKittyCatIcon"..BadKittyCFrames[8]]
	BadKittyCatEnergyIcon = _G["BadKittyCatIcon"..BadKittyCFrames[9]]
	BadKittyCatShredIcon = _G["BadKittyCatIcon"..BadKittyCFrames[10]]
	BadKittyCatPSIcon = _G["BadKittyCatIcon"..BadKittyCFrames[11]]
	BadKittyCatEnchantIcon = _G["BadKittyCatIcon"..BadKittyCFrames[12]]
	BadKittyCatTrink1Icon = _G["BadKittyCatIcon"..BadKittyCFrames[13]]
	BadKittyCatTrink2Icon = _G["BadKittyCatIcon"..BadKittyCFrames[14]]
	BadKittyCatIdolIcon = _G["BadKittyCatIcon"..BadKittyCFrames[15]]
	BadKittyBearMangleIcon = _G["BadKittyBearIcon"..BadKittyBFrames[1]]
	BadKittyBearDemoIcon = _G["BadKittyBearIcon"..BadKittyBFrames[2]]
	BadKittyBearLacIcon = _G["BadKittyBearIcon"..BadKittyBFrames[3]]
	BadKittyBearFFFIcon = _G["BadKittyBearIcon"..BadKittyBFrames[4]]
	BadKittyBearBSIcon = _G["BadKittyBearIcon"..BadKittyBFrames[5]]
	BadKittyBearZerkIcon = _G["BadKittyBearIcon"..BadKittyBFrames[6]]
	BadKittyBearRageIcon = _G["BadKittyBearIcon"..BadKittyBFrames[7]]
	--BadKittyBearBashIcon = _G["BadKittyBearIcon"..BadKittyBFrames[5]]
	
	BadKittyCatSRIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_SkinTeeth"})
	BadKittyCatMangleIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Mangle2"})
	BadKittyCatRakeIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Disembowel"})
	BadKittyCatRipIcon:SetBackdrop({bgFile="Interface/Icons/Ability_GhoulFrenzy"})
	BadKittyCatFFFIcon:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_FaerieFire"})
	BadKittyCatCPIcon:SetBackdrop({bgFile="Interface/Icons/INV_Jewelcrafting_Gem_28"})
	BadKittyCatTFIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Mount_JungleTiger"})
	BadKittyCatZerkIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Berserk"})
	BadKittyCatEnergyIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_CatForm"})
	BadKittyCatShredIcon:SetBackdrop({bgFile="Interface/Icons/Spell_Shadow_VampiricAura"})
	BadKittyCatPSIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Hunter_Pet_Cat"})
	BadKittyBearDemoIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_DemoralizingRoar"})
	BadKittyBearMangleIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Mangle2"})
	BadKittyBearLacIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Lacerate"})
	BadKittyBearFFFIcon:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_FaerieFire"})
	BadKittyBearBSIcon:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_StoneClawTotem"})
	BadKittyBearZerkIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Berserk"})
	BadKittyBearRageIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Racial_BearForm"})
	--BadKittyBearBashIcon:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Bash"})
	
	for i=1,15,1 do
		local bar = _G["BadKittyFrameBar"..i]
		local icon =_G["BadKittyCatIcon"..i]
		if i>BadKittyCatCount then
			bar:Hide()
			bar:EnableMouse(0)
			icon:Hide()
		else
			bar:Show()
			icon:Show()
		end
	end
	_G["BadKittyFrameBar"..0]:Hide()
	_G["BadKittyCatIcon"..0]:Hide()
	for i=1,7,1 do
		local bar = _G["BadKittyBearBar"..i]
		local icon =_G["BadKittyBearIcon"..i]
		if i>BadKittyBearCount then
			bar:Hide()
			bar:EnableMouse(0)
			icon:Hide()
		else
			bar:Show()
			icon:Show()
		end
	end
	
	BKWSR = _G["BKW"..BadKittyWCFrames[1]]
	BKWRake = _G["BKW"..BadKittyWCFrames[2]]
	BKWFFF = _G["BKW"..BadKittyWCFrames[3]]
	BKWTF = _G["BKW"..BadKittyWCFrames[4]]
	BKWMangle = _G["BKW"..BadKittyWCFrames[7]]
	BKWRip = _G["BKW"..BadKittyWCFrames[6]]
	BKWOOC = _G["BKW"..BadKittyWCFrames[5]]
	BKWZerk = _G["BKW"..BadKittyWCFrames[8]]
	BKWShred = _G["BKW"..BadKittyWCFrames[9]]
	BKWEnchant = _G["BKW"..BadKittyWCFrames[10]]
	BKWTrink1 = _G["BKW"..BadKittyWCFrames[11]]
	BKWTrink2 = _G["BKW"..BadKittyWCFrames[12]]
	BKWIdol = _G["BKW"..BadKittyWCFrames[13]]
	
	BKWSRText = _G["BKW"..BadKittyWCFrames[1].."Text"]
	BKWRakeText = _G["BKW"..BadKittyWCFrames[2].."Text"]
	BKWFFFText = _G["BKW"..BadKittyWCFrames[3].."Text"]
	BKWTFText = _G["BKW"..BadKittyWCFrames[4].."Text"]
	BKWMangleText = _G["BKW"..BadKittyWCFrames[7].."Text"]
	BKWRipText = _G["BKW"..BadKittyWCFrames[6].."Text"]
	BKWOOCText = _G["BKW"..BadKittyWCFrames[5].."Text"]
	BKWZerkText = _G["BKW"..BadKittyWCFrames[8].."Text"]
	BKWShredText = _G["BKW"..BadKittyWCFrames[9].."Text"]
	BKWEnchantText = _G["BKW"..BadKittyWCFrames[10].."Text"]
	BKWTrink1Text = _G["BKW"..BadKittyWCFrames[11].."Text"]
	BKWTrink2Text = _G["BKW"..BadKittyWCFrames[12].."Text"]
	BKWIdolText = _G["BKW"..BadKittyWCFrames[13].."Text"]
	
	BKWSR:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_SkinTeeth"})
	BKWRake:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Disembowel"})
	BKWFFF:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_FaerieFire"})
	BKWTF:SetBackdrop({bgFile="Interface/Icons/Ability_Mount_JungleTiger"})
	BKWMangle:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Mangle2"})
	BKWRip:SetBackdrop({bgFile="Interface/Icons/Ability_GhoulFrenzy"})
	BKWOOC:SetBackdrop({bgFile="Interface/Icons/Spell_Shadow_ManaBurn"})
	BKWZerk:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Berserk"})
	BKWShred:SetBackdrop({bgFile="Interface/Icons/Spell_Shadow_VampiricAura"})
	BadKitty_ParseTrinks()
	--others come from BadKitty_ParseTrinks() which doesn't work at startup
	
	BKWBearLacerate = _G["BKWBear"..BadKittyWBFrames[1]]
	BKWBearDemo = _G["BKWBear"..BadKittyWBFrames[2]]
	BKWBearFFF = _G["BKWBear"..BadKittyWBFrames[3]]
	BKWBearMangle = _G["BKWBear"..BadKittyWBFrames[4]]
	BKWBearBarkskin = _G["BKWBear"..BadKittyWBFrames[5]]
	BKWBearZerk = _G["BKWBear"..BadKittyWBFrames[6]]
	
	BKWBearLacerateText = _G["BKWBear"..BadKittyWBFrames[1].."Text"]
	BKWBearDemoText = _G["BKWBear"..BadKittyWBFrames[2].."Text"]
	BKWBearFFFText = _G["BKWBear"..BadKittyWBFrames[3].."Text"]
	BKWBearMangleText = _G["BKWBear"..BadKittyWBFrames[4].."Text"]
	BKWBearBarkskinText = _G["BKWBear"..BadKittyWBFrames[5].."Text"]
	BKWBearZerkText = _G["BKWBear"..BadKittyWBFrames[6].."Text"]
	
	BKWBearLacerate:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Lacerate"})
	BKWBearDemo:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_DemoralizingRoar"})
	BKWBearFFF:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_FaerieFire"})
	BKWBearMangle:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Mangle2"})
	BKWBearBarkskin:SetBackdrop({bgFile="Interface/Icons/Spell_Nature_StoneClawTotem"})
	BKWBearZerk:SetBackdrop({bgFile="Interface/Icons/Ability_Druid_Berserk"})
	
	if not BadKittySaves[13] then BadKittySaves[13]=0.5 end
	for i=1,13,1 do
		local icon = _G["BKW"..i]
		if i>BadKittyWCatCount then
			icon:SetAlpha(0)
		else
			icon:SetAlpha(BadKittySaves[13])
		end
	end
	for i=1,6,1 do
		local icon = _G["BKWBear"..i]
		if i>BadKittyWBearCount then
			icon:SetAlpha(0)
		else
			icon:SetAlpha(BadKittySaves[13])
		end
	end
	
	BadKitty_Setup()
end


function BadKitty_HideAll()
	BKOOCFrame:Hide()
	BKBearOOCFrame:Hide()
	BKWMangle:Hide()
	BKWSR:Hide()
	BKWRake:Hide()
	BKWRip:Hide()
	BKWFFF:Hide()
	BKWTF:Hide()
	BKWZerk:Hide()
	BKWOOC:Hide()
	BKWShred:Hide()
	BKWEnchant:Hide()
	BKWTrink1:Hide()
	BKWTrink2:Hide()
	BKWIdol:Hide()
	BKWBearMangle:Hide()
	BKWBearZerk:Hide()
	BKWBearLacerate:Hide()
	BKWBearBarkskin:Hide()
	BKWBearDemo:Hide()
	BKWBearFFF:Hide()
	BadKittyWarnings:EnableMouse(0)
	BKWMoveFrame:SetAlpha(0)
	BKWMoveFrame:EnableMouse(0)
	BadKittyBearWarnings:EnableMouse(0)
	BKWBearMoveFrame:SetAlpha(0)
	BKWBearMoveFrame:EnableMouse(0)
	BKWMangle:EnableMouse(0)
	BKWSR:EnableMouse(0)
	BKWRake:EnableMouse(0)
	BKWRip:EnableMouse(0)
	BKWFFF:EnableMouse(0)
	BKWTF:EnableMouse(0)
	BKWZerk:EnableMouse(0)
	BKWOOC:EnableMouse(0)
	BKWShred:EnableMouse(0)
	BKWEnchant:EnableMouse(0)
	BKWTrink1:EnableMouse(0)
	BKWTrink2:EnableMouse(0)
	BKWIdol:EnableMouse(0)
	BKWBearMangle:EnableMouse(0)
	BKWBearZerk:EnableMouse(0)
	BKWBearLacerate:EnableMouse(0)
	BKWBearDemo:EnableMouse(0)
	BKWBearBarkskin:EnableMouse(0)
	BKWBearFFF:EnableMouse(0)
end

function BadKitty_GetSpellNameById(spellId)
	if (spellId == nil) then
		return nil
	end
	local spellName, _, _, _, _, _, _, _, _ = GetSpellInfo(spellId)
	return spellName
end

local BADKITTY_MANGLE_CAT = BadKitty_GetSpellNameById(33876)
local BADKITTY_MANGLE_BEAR = BadKitty_GetSpellNameById(33878)
local BADKITTY_SAVAGE_ROAR = BadKitty_GetSpellNameById(52610)
local BADKITTY_CLEARCASTING = BadKitty_GetSpellNameById(16870)
local BADKITTY_RAKE = BadKitty_GetSpellNameById(59881)
local BADKITTY_RIP = BadKitty_GetSpellNameById(1079)
local BADKITTY_FAERIE_FIRE_FERAL = BadKitty_GetSpellNameById(16857)
local BADKITTY_FAERIE_FIRE = BadKitty_GetSpellNameById(770)
local BADKITTY_TRAUMA = BadKitty_GetSpellNameById(46856) 
local BADKITTY_LACERATE = BadKitty_GetSpellNameById(48568)
local BADKITTY_DEMO_ROAR = BadKitty_GetSpellNameById(48560)
local BADKITTY_DEMO_SHOUT = BadKitty_GetSpellNameById(47437)
local BADKITTY_TIGERS_FURY = BadKitty_GetSpellNameById(9846)
local BADKITTY_BARKSKIN = BadKitty_GetSpellNameById(22812)
local BADKITTY_BERSERK = BadKitty_GetSpellNameById(50334)
local BADKITTY_CURSE_OF_WEAKNESS = BadKitty_GetSpellNameById(7646)
local BADKITTY_SHRED = BadKitty_GetSpellNameById(27002)
local BADKITTY_CHARGE = BadKitty_GetSpellNameById(49376)
local BADKITTY_PREDATORS_SWIFTNESS = BadKitty_GetSpellNameById(69369)
local BADKITTY_VINDICATION = BadKitty_GetSpellNameById(26017)
local BADKITTY_WEAPON = BadKitty_GetSpellNameById(59620)  --Berserking
local BADKITTY_TRINKET_1 = BadKitty_GetSpellNameById(71401) --WFS
local BADKITTY_TRINKET_2 = BadKitty_GetSpellNameById(71403) --NES
local BADKITTY_IDOL = BadKitty_GetSpellNameById(71175)	--Crying Moon

--[[local BADKITTY_ICY_TALONS = BadKitty_GetSpellNameById(55789)
local BADKITTY_WINDFURY = BadKitty_GetSpellNameById(8515)
local BADKITTY_LOTP = BadKitty_GetSpellNameById(24932)
local BADKITTY_ILOTP = BadKitty_GetSpellNameById(60889)
local BADKITTY_MIGHT = BadKitty_GetSpellNameById(56520)
local BADKITTY_GREATER_MIGHT = BadKitty_GetSpellNameById(29381)
local BADKITTY_BATTLE_SHOUT = BadKitty_GetSpellNameById(47436)
local BADKITTY_ABOMS_MIGHT = BadKitty_GetSpellNameById(53138)
local BADKITTY_TRUESHOT = BadKitty_GetSpellNameById(31519)
local BADKITTY_UNLEASHED_RAGE = BadKitty_GetSpellNameById(30805)
--local BADKITTY_MOONKIN_AURA = BadKitty_GetSpellNameById(24907)
--local BADKITTY_SWIFT_RET = BadKitty_GetSpellNameById()
local BADKITTY_ARCANE_EMPOWERMENT = BadKitty_GetSpellNameById(70543)
local BADKITTY_FEROCIOUS_INSPIRATION = BadKitty_GetSpellNameById(34456)
--???local BADKITTY_SANCTIFIED_RET = BadKitty_GetSpellNameById(26017)
local BADKITTY_GREATER_KINGS = BadKitty_GetSpellNameById(25898)
local BADKITTY_KINGS = BadKitty_GetSpellNameById(20217)
local BADKITTY_DRUM_KINGS = BadKitty_GetSpellNameById(72586)
local BADKITTY_MARK = BadKitty_GetSpellNameById(39233)
local BADKITTY_GIFT = BadKitty_GetSpellNameById(72588) --also drum gift, fyi
local BADKITTY_HORN = BadKitty_GetSpellNameById(57623)
local BADKITTY_STRENGTH_OF_EARTH = BadKitty_GetSpellNameById(58646)]]

local BadKittySpells = {}
BadKittySpells[BADKITTY_MANGLE_CAT] = 0
BadKittySpells[BADKITTY_SAVAGE_ROAR] = 0
BadKittySpells[BADKITTY_CLEARCASTING] = 0
BadKittySpells[BADKITTY_RAKE] = 0
BadKittySpells[BADKITTY_RIP] = 0
BadKittySpells[BADKITTY_FAERIE_FIRE_FERAL] = 0
BadKittySpells[BADKITTY_TRAUMA] = 0
BadKittySpells[BADKITTY_MANGLE_BEAR] = 0
BadKittySpells[BADKITTY_FAERIE_FIRE] = 0
BadKittySpells[BADKITTY_LACERATE] = 0
BadKittySpells[BADKITTY_DEMO_ROAR] = 0
BadKittySpells[BADKITTY_DEMO_SHOUT] = 0
BadKittySpells[BADKITTY_CURSE_OF_WEAKNESS] = 0
BadKittySpells[BADKITTY_TIGERS_FURY] = 0
BadKittySpells[BADKITTY_BARKSKIN] = 0
BadKittySpells[BADKITTY_BERSERK] = 0
BadKittySpells[BADKITTY_PREDATORS_SWIFTNESS] = 0
BadKittySpells[BADKITTY_VINDICATION] = 0
BadKittySpells[BADKITTY_WEAPON] = 0
BadKittySpells[BADKITTY_TRINKET_1] = 0
BadKittySpells[BADKITTY_TRINKET_2] = 0
BadKittySpells[BADKITTY_IDOL] = 0
BadKittyShredCount = 3

--[[local BadKittyMHaste = {BADKITTY_ICY_TALONS,BADKITTY_WINDFURY}
local BadKittyCrit = {BADKITTY_LOTP,BADKITTY_ILOTP}--,BADKITTY_RAMPAGE}
local BadKittyAP = {BADKITTY_MIGHT,BADKITTY_GREATER_MIGHT,BADKITTY_BATTLE_SHOUT}
local BadKittyAPPercent = {BADKITTY_ABOMS_MIGHT,BADKITTY_TRUESHOT,BADKITTY_UNLEASHED_RAGE}
--BadKittyHaste = {}
local BadKittyDamage = {BADKITTY_ARCANE_EMPOWERMENT,BADKITTY_FEROCIOUS_INSPIRATION}--,BADKITTY_SANCTIFIED_RET}
local BadKittyStatsPercent = {BADKITTY_MARK,BADKITTY_GIFT}
local BadKittyStats = {BADKITTY_KINGS,BADKITTY_GREATER_KINGS,BADKITTY_DRUM_KINGS}
local BadKittyAgiStr = {BADKITTY_HORN,BADKITTY_STRENGTH_OF_EARTH}]]

BadKittyThisIsStupid = 0

function BadKitty_OnEvent(self, event, ...)
	if event == "VARIABLES_LOADED" then
		if BadKittySaves[2]<95 then BadKittySaves[2]=95 end
		BKOOCFrame:SetAlpha(0.5)
		BKBearOOCFrame:SetAlpha(0.5)
		BadKitty_HideAll()
	elseif event == "ADDON_LOADED" and arg1=="BadKitty" then
		BadKittyThisIsStupid = 1
		if BadKittySaves[3]~=1.11 then
			BadKitty_OldVersion()
		end
		BadKitty_TextureMenuMake()
		if not BadKittyCFrames[10] then BadKittyCFrames[10]=10 end
		if not BadKittyCFrames[11] then BadKittyCFrames[11]=11 end
		--BadKittyOptions:Show()	--hack for 3.1.  I'll fix later.
		--BadKittyOptions:Hide()
		if BadKittySaves[2]<95 then BadKittySaves[2]=95 end
		if BadKittySaves[6] == "defaults" then
			BadKittySaves[6] = 12
		end
		if BadKittySaves[12]==nil then
			BadKittySaves[12] = 3
		end
		BadKittyTempHide=BadKittySaves[7]
		localizedClass, englishClass = UnitClass("player")
		if englishClass~="DRUID" then
			this:UnregisterAllEvents()
			BadKitty_Output("[BadKitty] whispers: You aren't a Druid!  I'm turning off!")
			BadKittyWarnings:Hide()
			BadKittyBearWarnings:Hide()
			BKWMoveFrame:Hide()
			BKWBearMoveFrame:Hide()
			BadKittyBear:Hide()
			BadKittyFrame:Hide()
			BKOOCFrame:Hide()
			BKBearOOCFrame:Hide()
		else
			BadKitty_Output("BadKitty loaded successfully!")
			--BadKitty_ParseTrinks()
			
		end
		BadKitty_SetFrames()
		BadKitty_CatWarningShape(BadKittySaves[14])
		BadKitty_BearWarningShape(BadKittySaves[15])
	elseif event =="PLAYER_REGEN_DISABLED" then
		BadKitty_ParseTrinks()
	elseif event =="PLAYER_TARGET_CHANGED" then	--Updates information on new target
		local unittarget = UnitGUID("target")
		LacCount = 0
		for i,j in pairs(BadKittySpells) do
			if i~=BADKITTY_SAVAGE_ROAR and i~=BADKITTY_CLEARCASTING and i~=BADKITTY_PREDATORS_SWIFTNESS and i~=BADKITTY_BERSERK then
				BadKittySpells[i]=0
			end
			local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitDebuff("target", i)
			if expirationTime then
				if name == BADKITTY_RAKE or name == BADKITTY_RIP or name == BADKITTY_LACERATE then
					if caster=="player" then
						BadKittySpells[i] = expirationTime
					end
					if name==BADKITTY_LACERATE then
						LacCount = count
					end
				else
					BadKittySpells[i] = expirationTime
				end
			end
		end
	else	--All relevant happenings (target and self) are captured and put to work.
		local unittarget = UnitGUID("target")
		local spelltype = select(2,...);
		local user = select(4,...);
		local userid = select(3,...);
		local tarid = select(6,...);
		local spellname = select(10,...);
		if spellname~=BADKITTY_BERSERK and spellname~=BADKITTY_SAVAGE_ROAR and spellname~=BADKITTY_CLEARCASTING and spellname~=BADKITTY_PREDATORS_SWIFTNESS and spellname~=BADKITTY_TRINKET_1 and spellname~=BADKITTY_TRINKET_2 and spellname ~=BADKITTY_IDOL and tarid ~= unittarget then return end
		if spelltype=="SPELL_CAST_SUCCESS" and userid==UnitGUID("player") then	--Ghetto way to find out if the shred glyph refreshed Rip or not
			if spellname==BADKITTY_RIP then
				BadKittyRipRefresh = 1
				BadKittyShredCount = 3
			else 
				BadKittyRipRefresh = 0
			end
		end
		if spellname == BADKITTY_SHRED then
			local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitDebuff("target", BADKITTY_RIP);
			if expirationTime and caster=="player" then
				BadKittySpells[BADKITTY_RIP]=expirationTime
			end
		end
		if BadKittySpells[spellname] then
			if (spelltype=="SPELL_AURA_APPLIED_DOSE" or spelltype=="SPELL_AURA_APPLIED") and spellname==BADKITTY_LACERATE and userid==UnitGUID("player") then
				if spellname==BADKITTY_BERSERK then BadKitty_Output("lul") end
				local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitDebuff("target", spellname);
				LacCount = count
				BadKittySpells[spellname] = expirationTime
			elseif spelltype=="SPELL_AURA_APPLIED" or spelltype=="SPELL_AURA_REFRESH" then
				if spellname==BADKITTY_RIP and spelltype=="SPELL_AURA_REFRESH" and userid==UnitGUID("player") then 
					if BadKittyRipRefresh==0 then--if rip didn't refresh itself, then the shred glyph did.
						BadKittyShredCount = BadKittyShredCount-1
					end
				end
				if spellname==BADKITTY_BERSERK or spellname==BADKITTY_SAVAGE_ROAR or spellname==BADKITTY_CLEARCASTING or spellname==BADKITTY_PREDATORS_SWIFTNESS or spellname==BADKITTY_TRINKET_1 or spellname==BADKITTY_TRINKET_2 or spellname==BADKITTY_IDOL then
					if spellname==BADKITTY_BERSERK then
						for i=1,40,1 do	--Berserking is named Berserk, which conflicts with Berserk, so I have to do it this way
							local _, _, _, _, _, _, expirationTime, _, _, _, spellId  =  UnitBuff("player", i)
							if spellId == 50334 then
								if expirationTime then
									BadKittySpells[BADKITTY_BERSERK] = expirationTime
									BadKittyZerkUp = 1
									--BadKitty_Output("1")
								end
							end
						end
					else
						local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", spellname);
						if not expirationTime then
							if (spellname==BADKITTY_TRINKET_1 and (BADKITTY_TRINKET_1==BadKitty_GetSpellNameById(71485))) or (spellname==BADKITTY_TRINKET_2 and (BADKITTY_TRINKET_2==BadKitty_GetSpellNameById(71485))) then
								local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BadKitty_GetSpellNameById(71484));
								if not expirationTime then
									local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BadKitty_GetSpellNameById(71492));
								end
							end
						end
						if not expirationTime then expirationTime=0 end
						BadKittySpells[spellname] = expirationTime
					end
				else
					local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitDebuff("target", spellname);
					if spellname==BADKITTY_RIP or spellname==BADKITTY_RAKE or spellname==BADKITTY_CLEARCASTING then
						if userid~=UnitGUID("player") then
							return
						end
					end
					BadKittySpells[spellname] = expirationTime
				end
			elseif spelltype=="SPELL_AURA_REMOVED" and spellname~=BADKITTY_SAVAGE_ROAR and spellname~=BADKITTY_CLEARCASTING and spellname~=BADKITTY_PREDATORS_SWIFTNESS then
				local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitDebuff("target", spellname);
				if expirationTime then
					if spellname==BADKITTY_RAKE or spellname==BADKITTY_RIP or spellname==BADKITTY_LACERATE then
						if caster~="player" then BadKittySpells[spellname]=0 end
						if spellname==BADKITTY_LACERATE then
							LacCount = 0
						end
					else
						BadKittySpells[spellname]=expirationTime
					end
				else
					BadKittySpells[spellname]=0
				end
				if spellname==BADKITTY_BERSERK then
					BadKittyZerkUp = 0
				end
			elseif spelltype=="SPELL_AURA_REMOVED" then
				local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", spellname)
				if expirationTime then
					BadKittySpells[spellname]=expirationTime
				else
					BadKittySpells[spellname]=0
				end
			end
		end
	end
end

function BadKitty_UpdateMe()
	if IsUsableSpell(BADKITTY_TIGERS_FURY) then 
		local start, cd, enable = GetSpellCooldown(BADKITTY_TIGERS_FURY)
		local left = floor(10*(start+cd))/10
		BadKittySpells[BADKITTY_TIGERS_FURY]=left
	end
	if IsUsableSpell(BADKITTY_BERSERK) and BadKittyZerkUp==0 then 
		--BadKitty_Output("2")
		local start, cd, enable = GetSpellCooldown(BADKITTY_BERSERK)
		local left = floor(10*(start+cd))/10
		BadKittySpells[BADKITTY_BERSERK]=left
	end
	if IsUsableSpell(BADKITTY_BARKSKIN) then 
		local start, cd, enable = GetSpellCooldown(BADKITTY_BARKSKIN)
		local left = floor(10*(start+cd))/10
		BadKittySpells[BADKITTY_BARKSKIN]=left
	end
	local start, cd, enable = GetInventoryItemCooldown("player",13)
	if enable==1 then BadKittySpells[BADKITTY_TRINKET_1]=floor(10*(start+cd))/10 end
	local start, cd, enable = GetInventoryItemCooldown("player",14)
	if enable==1 then BadKittySpells[BADKITTY_TRINKET_2]=floor(10*(start+cd))/10 end
	if not BadKittyCatSR then
		BadKitty_SetFrames()
		BadKitty_Setup()
	end
	local shapeshift = GetShapeshiftForm(true)
	if BadKittyLock==0 then
		BadKittyFrame:SetAlpha(1)
		BadKittyFrame:EnableMouse(1)
		BadKittyBear:SetAlpha(1)
		BadKittyBear:EnableMouse(1)
	elseif BadKittySaves[7]==1 and not InCombatLockdown() then
		BadKittyFrame:SetAlpha(0)
		BKOOCFrame:SetAlpha(0)
		BadKittyFrame:EnableMouse(0)
		BadKittyBear:EnableMouse(0)
		BadKittyBear:SetAlpha(0)
		BKBearOOCFrame:SetAlpha(0)
	elseif InCombatLockdown() or BadKittySaves[7]==0 then
		if BadKittySaves[9]==1 then
			BadKittyFrame:SetAlpha(1)
			BKOOCFrame:SetAlpha(0.5)
			BadKittyFrame:EnableMouse(0)
		else
			BadKittyFrame:SetAlpha(0)
			BKOOCFrame:SetAlpha(0)
			BadKittyFrame:EnableMouse(0)
		end
		if BadKittySaves[5]==1 then
			BadKittyBear:EnableMouse(0)
			BadKittyBear:SetAlpha(1)
			BKBearOOCFrame:SetAlpha(0.5)
		else
			BadKittyBear:EnableMouse(0)
			BadKittyBear:SetAlpha(0)
			BKBearOOCFrame:SetAlpha(0)
		end
		if shapeshift==3 then
			BadKittyBear:EnableMouse(0)
			BadKittyBear:SetAlpha(0)
			BKBearOOCFrame:SetAlpha(0)
		elseif shapeshift==1 then
			BadKittyFrame:SetAlpha(0)
			BKOOCFrame:SetAlpha(0)
			BadKittyFrame:EnableMouse(0)
		else
			BadKittyBear:EnableMouse(0)
			BadKittyBear:SetAlpha(0)
			BadKittyFrame:SetAlpha(0)
			BKOOCFrame:SetAlpha(0)
			BKBearOOCFrame:SetAlpha(0)
			BadKittyFrame:EnableMouse(0)
		end
	end
	BadKitty_Weapon()
	if not BKtimeleft then BKtimeleft = {} end
	local timenow=GetTime()
	local target = UnitGUID("target")
	for i,j in pairs(BadKittySpells) do
		BKtimeleft[i]=abs(j)-timenow 
		if BKtimeleft[i]<0 then BKtimeleft[i]=0 end
	end
	if BKtimeleft[BADKITTY_BERSERK]<1.5 then BKtimeleft[BADKITTY_BERSERK]=0 end --GCD is annoying
	BadKittyCatSR:SetValue(BKtimeleft[BADKITTY_SAVAGE_ROAR])
	BadKitty_UpdateCPs()
	BadKitty_ShredCount()
	BadKitty_Power()
	BadKittyCatRip:SetValue(BKtimeleft[BADKITTY_RIP])
	BadKittyCatRake:SetValue(BKtimeleft[BADKITTY_RAKE])
	BadKittyCatTF:SetValue(BKtimeleft[BADKITTY_TIGERS_FURY])
	BadKittyCatPS:SetValue(BKtimeleft[BADKITTY_PREDATORS_SWIFTNESS])
	BadKittyCatEnchant:SetValue(BKtimeleft[BADKITTY_WEAPON])
	BadKittyCatTrink1:SetValue(BKtimeleft[BADKITTY_TRINKET_1])
	BadKittyCatTrink2:SetValue(BKtimeleft[BADKITTY_TRINKET_2])
	BadKittyCatIdol:SetValue(BKtimeleft[BADKITTY_IDOL])
	if BadKittySaves[21]==0 then
		BadKittyCatZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
		BadKittyBearZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
	else
		--[[name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId  =  UnitBuff("player", BADKITTY_BERSERK)
		if spellId==50334 then	--make sure it's Berserk
			if expirationTime then
				BadKittyCatZerk:SetValue(expirationTime-GetTime())
				BadKittyBearZerk:SetValue(expirationTime-GetTime())
			else
				BadKittyCatZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
				BadKittyBearZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
			end
		end]]
		BadKittyCatZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
		BadKittyBearZerk:SetValue(BKtimeleft[BADKITTY_BERSERK])
	end
	if BadKittySpells[BADKITTY_FAERIE_FIRE_FERAL]==0 then
		BadKittyCatFFF:SetValue(BKtimeleft[BADKITTY_FAERIE_FIRE])
		BadKittyBearFFF:SetValue(BKtimeleft[BADKITTY_FAERIE_FIRE])
	else
		BadKittyCatFFF:SetValue(BKtimeleft[BADKITTY_FAERIE_FIRE_FERAL])
		BadKittyBearFFF:SetValue(BKtimeleft[BADKITTY_FAERIE_FIRE_FERAL])
	end
	if BadKittySpells[BADKITTY_MANGLE_CAT]~=0 then
		BadKittyCatMangle:SetValue(BKtimeleft[BADKITTY_MANGLE_CAT])
		BadKittyBearMangle:SetValue(BKtimeleft[BADKITTY_MANGLE_CAT])
	elseif BadKittySpells[BADKITTY_MANGLE_BEAR]~=0 then
		BadKittyCatMangle:SetValue(BKtimeleft[BADKITTY_MANGLE_BEAR])
		BadKittyBearMangle:SetValue(BKtimeleft[BADKITTY_MANGLE_BEAR])
	else
		BadKittyCatMangle:SetValue(BKtimeleft[BADKITTY_TRAUMA])
		BadKittyBearMangle:SetValue(BKtimeleft[BADKITTY_TRAUMA])
	end
	if BadKittySpells[BADKITTY_DEMO_ROAR]~=0 then
		BadKittyBearDemo:SetValue(BKtimeleft[BADKITTY_DEMO_ROAR])
	elseif BadKittySpells[BADKITTY_DEMO_SHOUT]~=0 then
		BadKittyBearDemo:SetValue(BKtimeleft[BADKITTY_DEMO_SHOUT])
	elseif BadKittySpells[BADKITTY_CURSE_OF_WEAKNESS]~=0 then
		BadKittyBearDemo:SetValue(BKtimeleft[BADKITTY_CURSE_OF_WEAKNESS])
	elseif BadKittySpells[BADKITTY_VINDICATION]~=0 then
		BadKittyBearDemo:SetValue(BKtimeleft[BADKITTY_VINDICATION])
	else
		BadKittyBearDemo:SetValue(0)
	end
	BadKittyBearLac:SetValue(BKtimeleft[BADKITTY_LACERATE])
	BadKittyBearBS:SetValue(BKtimeleft[BADKITTY_BARKSKIN])
	if BadKittySpells[BADKITTY_LACERATE]~=0 then
		BadKittyBearLacText:SetText("Lacerate x" .. LacCount)
	else
		BadKittyBearLacText:SetText("Lacerate x" .. 0)
	end
	BadKitty_Seconds(BKtimeleft)
	BadKitty_OOC()
end

function BadKitty_GetItemID(slot)
	if GetInventoryItemLink("player",slot) then
		return tonumber(strsub(strmatch(GetInventoryItemLink("player",slot),"%:%d*%:"),2,-2))
	else
		return 0
	end
end

function BadKitty_GetEnchantID()
	--don't judge me
	return tonumber(strsub(strmatch(strsub(strmatch(GetInventoryItemLink("player",16),"item%:%d*%:%d*%:"),7),"%:%d*%:"),2,-2))
end

function BadKitty_GetItemTexture(slot)
	_, _, _, _, _, _, _, _, _, itemTexture, _ = GetItemInfo(BadKitty_GetItemID(slot)) 
	return itemTexture
end

function BadKitty_PukeID()
	BadKitty_Output(BadKitty_GetEnchantID())
end

function BadKitty_PukeIDs()
	--puke ids for trinks and idol to chat
	local thing = {}
	thing[1]=BadKitty_GetItemID(13)
	thing[2]=BadKitty_GetItemID(14)
	thing[3]=BadKitty_GetItemID(18)
	BadKitty_Output("1:"..thing[1].."  2:"..thing[2].."  idol:"..thing[3])
end

function BadKitty_Weapon()
	for i=1,40,1 do	--Berserking is named Berserk, which conflicts with Berserk, so I have to do it this way
		local _, _, _, _, _, _, expirationTime, _, _, _, spellId  =  UnitBuff("player", i)
		if spellId == BADKITTY_WEAPON then
			if expirationTime then
				BadKittySpells[BADKITTY_WEAPON] = expirationTime
			end
		end
	end
end

function BadKitty_ParseTrinks()
	BKWTrink1:SetBackdrop({bgFile=BadKitty_GetItemTexture(13)})
	BKWTrink2:SetBackdrop({bgFile=BadKitty_GetItemTexture(14)})
	BKWEnchant:SetBackdrop({bgFile=BadKitty_GetItemTexture(16)})
	BKWIdol:SetBackdrop({bgFile=BadKitty_GetItemTexture(18)})
	if BadKitty_GetItemID(13)~=0 then
		if BadKittyProcList[BadKitty_GetEnchantID()]==nil then BADKITTY_WEAPON=BadKitty_GetEnchantID() 
		else BADKITTY_WEAPON = BadKittyProcList[BadKitty_GetEnchantID()] end	--Berserking is named Berserk, which conflicts with Berserk
		if BadKittyProcList[BadKitty_GetItemID(13)]==nil then BADKITTY_TRINKET_1=BadKitty_GetItemID(13) 
		else BADKITTY_TRINKET_1 = BadKitty_GetSpellNameById(BadKittyProcList[BadKitty_GetItemID(13)]) end
		if BadKittyProcList[BadKitty_GetItemID(14)]==nil then BADKITTY_TRINKET_2=BadKitty_GetItemID(14) 
		else BADKITTY_TRINKET_2 = BadKitty_GetSpellNameById(BadKittyProcList[BadKitty_GetItemID(14)]) end
		if BadKittyProcList[BadKitty_GetItemID(18)]==nil then BADKITTY_IDOL=BadKitty_GetItemID(18) 
		else BADKITTY_IDOL = BadKitty_GetSpellNameById(BadKittyProcList[BadKitty_GetItemID(18)]) end
		BadKittySpells[BADKITTY_WEAPON] = 0
		BadKittySpells[BADKITTY_TRINKET_1] = 0
		BadKittySpells[BADKITTY_TRINKET_2] = 0
		BadKittySpells[BADKITTY_IDOL] = 0
	end
end

function BadKitty_UpdateCPs()
	cps = GetComboPoints(UnitName("player"))*8
	if cps ==1*8 then
		BadKittyCatCP:SetStatusBarColor(0,1,0);
	elseif cps ==2*8 then
		BadKittyCatCP:SetStatusBarColor(0.25,0.75,0);
	elseif cps ==3*8 then
		BadKittyCatCP:SetStatusBarColor(0.5,0.5,0);
	elseif cps ==4*8 then
		BadKittyCatCP:SetStatusBarColor(0.75,0.25,0);
	elseif cps ==5*8 then
		BadKittyCatCP:SetStatusBarColor(1,0,0);
	end
	BadKittyCatCP:SetValue(cps)
	BadKittyCatCPSecs:SetText(floor(cps/8))
end 

function BadKitty_ShredCount()
	if BadKittyShredCount==1 then
		BadKittyCatShred:SetStatusBarColor(1,0,0);
	elseif BadKittyShredCount==2 then
		BadKittyCatShred:SetStatusBarColor(0.5,0.5,0);
	elseif BadKittyShredCount==3 then
		BadKittyCatShred:SetStatusBarColor(0,1,0);
	end
	BadKittyCatShred:SetValue(BadKittyShredCount)
	BadKittyCatShredSecs:SetText(BadKittyShredCount)
	if InCombatLockdown() and GetShapeshiftForm(true)==3 then
		if BadKittyShredCount==3 then
			BKWShred:Show()
			BKWShred:SetBackdropColor(BadKitty_WarningColors(0))
			BKWShredText:SetText(BadKittyShredCount)
		elseif BadKittyShredCount==2 or BadKittyShredCount==1 then
			BKWShred:Show()
			BKWShred:SetBackdropColor(BadKitty_WarningColors(1))
			BKWShredText:SetText(BadKittyShredCount)
		elseif BadKittyShredCount==0 then
			BKWShred:Hide()
		end
	else
		BKWShred:Hide()
	end
end

function BadKitty_Power()
	local energy = UnitPower("player",3)
	BadKittyCatEnergy:SetValue(energy*0.4)
	BadKittyCatEnergySecs:SetText(energy)
	local rage = UnitPower("player",1)
	BadKittyBearRage:SetValue(rage*.4)
	BadKittyBearRageSecs:SetText(rage)
end

function BadKitty_OOC()
	if BadKittySpells[BADKITTY_CLEARCASTING]>0 and BadKittySaves[10]==1 then
		BKOOCFrame:Show()
		BKBearOOCFrame:Show()
	else
		BKOOCFrame:Hide()
		BKBearOOCFrame:Hide()
	end
	if BadKittySpells[BADKITTY_CLEARCASTING]>0 and BadKittySaves[11]==1 and GetShapeshiftForm(true)== 3 and InCombatLockdown() then
		BKWOOC:Show()
	elseif not InCombatLockdown() or GetShapeshiftForm(true)~= 3 then
		BKWOOC:Hide()
	else
		BKWOOC:Hide()
	end
end

function BadKitty_Seconds(timeleft)
	for i,j in pairs(timeleft) do
		if j<1 then
			timeleft[i] = floor(10*j)/10
		else
			timeleft[i] = floor(j)
		end
	end
	if timeleft[BADKITTY_MANGLE_CAT]~=0 then
		BadKittyCatMangleSecs:SetText(timeleft[BADKITTY_MANGLE_CAT])
		BadKittyBearMangleSecs:SetText(timeleft[BADKITTY_MANGLE_CAT])
	elseif timeleft[BADKITTY_MANGLE_BEAR]~=0 then
		BadKittyCatMangleSecs:SetText(timeleft[BADKITTY_MANGLE_BEAR])
		BadKittyBearMangleSecs:SetText(timeleft[BADKITTY_MANGLE_BEAR])
	else
		BadKittyCatMangleSecs:SetText(timeleft[BADKITTY_TRAUMA])
		BadKittyBearMangleSecs:SetText(timeleft[BADKITTY_TRAUMA])
	end
	BadKittyCatSRSecs:SetText(timeleft[BADKITTY_SAVAGE_ROAR])
	BadKittyCatPSSecs:SetText(timeleft[BADKITTY_PREDATORS_SWIFTNESS])
	BadKittyCatRakeSecs:SetText(timeleft[BADKITTY_RAKE])
	BadKittyCatRipSecs:SetText(timeleft[BADKITTY_RIP])
	BadKittyCatTFSecs:SetText(timeleft[BADKITTY_TIGERS_FURY])
	BadKittyCatEnchantSecs:SetText(timeleft[BADKITTY_WEAPON])
	BadKittyCatTrink1Secs:SetText(timeleft[BADKITTY_TRINKET_1])
	BadKittyCatTrink2Secs:SetText(timeleft[BADKITTY_TRINKET_2])
	BadKittyCatIdolSecs:SetText(timeleft[BADKITTY_IDOL])
	if BadKittySaves[21]==0 then
		BadKittyCatZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
		BadKittyBearZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
	else
		--local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BADKITTY_BERSERK)
		--local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff("player", BADKITTY_BERSERK) 
		--if expirationTime and spellId==50334 then
			--if icon=="Interface\\Icons\\Ability_Druid_Berserk" then 
		if BadKittyZerkUp == 1 then
			BadKittyCatZerkText:SetText("Berserk is UP")
			BadKittyBearZerkText:SetText("Berserk is UP")
			BadKittyCatZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
			BadKittyBearZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
			--[[if expirationTime<1 then
				BadKittyCatZerkSecs:SetText(floor(10*(expirationTime-GetTime()))/10)
				BadKittyBearZerkSecs:SetText(floor(10*(expirationTime-GetTime()))/10)
			else
				BadKittyCatZerkSecs:SetText(floor(expirationTime-GetTime()))
				BadKittyBearZerkSecs:SetText(floor(expirationTime-GetTime()))
			end]] 
			--end
		else
			BadKittyCatZerkText:SetText("Berserk")
			BadKittyBearZerkText:SetText("Berserk")
		end
		BadKittyCatZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
		BadKittyBearZerkSecs:SetText(timeleft[BADKITTY_BERSERK])
		--end
	end
	
	
	
	
	if timeleft[BADKITTY_FAERIE_FIRE]~=0 then
		BadKittyCatFFFSecs:SetText(timeleft[BADKITTY_FAERIE_FIRE])
		BadKittyBearFFFSecs:SetText(timeleft[BADKITTY_FAERIE_FIRE])
	else
		BadKittyCatFFFSecs:SetText(timeleft[BADKITTY_FAERIE_FIRE_FERAL])
		BadKittyBearFFFSecs:SetText(timeleft[BADKITTY_FAERIE_FIRE_FERAL])
	end
	if timeleft[BADKITTY_DEMO_ROAR]~=0 then
		BadKittyBearDemoSecs:SetText(timeleft[BADKITTY_DEMO_ROAR])
	elseif timeleft[BADKITTY_DEMO_SHOUT]~=0 then
		BadKittyBearDemoSecs:SetText(timeleft[BADKITTY_DEMO_SHOUT])
	elseif timeleft[BADKITTY_CURSE_OF_WEAKNESS]~=0 then
		BadKittyBearDemoSecs:SetText(timeleft[BADKITTY_CURSE_OF_WEAKNESS])
	elseif timeleft[BADKITTY_VINDICATION]~=0 then
		BadKittyBearDemoSecs:SetText(timeleft[BADKITTY_VINDICATION])
	else
		BadKittyBearDemoSecs:SetText("0")
	end
	BadKittyBearLacSecs:SetText(timeleft[BADKITTY_LACERATE])
	BadKittyBearBSSecs:SetText(timeleft[BADKITTY_BARKSKIN])
	if GetShapeshiftForm(true)==3 then	-- Call warnings.  A bit messy.
		BadKitty_Warnings(timeleft)
		--BadKitty_WarningBars(1,timeleft)
		BKWBearMangle:Hide()
		BKWBearZerk:Hide()
		BKWBearLacerate:Hide()
		BKWBearDemo:Hide()
		BKWBearBarkskin:Hide()
		BKWBearFFF:Hide()
	elseif GetShapeshiftForm(true)==1 then
		BadKitty_BearWarnings(timeleft)
		BKWMangle:Hide()
		BKWSR:Hide()
		BKWRake:Hide()
		BKWRip:Hide()
		BKWFFF:Hide()
		BKWTF:Hide()
		BKWZerk:Hide()
		BKWShred:Hide()
		BKWEnchant:Hide()
		BKWTrink1:Hide()
		BKWTrink2:Hide()
		BKWIdol:Hide()
	else
		BKWMangle:Hide()
		BKWSR:Hide()
		BKWRake:Hide()
		BKWRip:Hide()
		BKWFFF:Hide()
		BKWTF:Hide()
		BKWShred:Hide()
		BKWZerk:Hide()
		BKWEnchant:Hide()
		BKWTrink1:Hide()
		BKWTrink2:Hide()
		BKWIdol:Hide()
		BKWBearMangle:Hide()
		BKWBearZerk:Hide()
		BKWBearLacerate:Hide()
		BKWBearDemo:Hide()
		BKWBearBarkskin:Hide()
		BKWBearFFF:Hide()
	end
end

function BadKitty_Warnings(timeleft)
	if BadKittySaves[11]==0 or not InCombatLockdown() then
		BKWMangle:Hide()
		BKWSR:Hide()
		BKWRake:Hide()
		BKWRip:Hide()
		BKWFFF:Hide()
		BKWZerk:Hide()
		BKWTF:Hide()
		BKWShred:Hide()
		BKWEnchant:Hide()
		BKWTrink1:Hide()
		BKWTrink2:Hide()
		BKWIdol:Hide()
		return 0
	end
	for i,j in pairs(timeleft) do
		if InCombatLockdown() and (i==BADKITTY_TRINKET_1 or i==BADKITTY_TRINKET_2) then
			if i==BADKITTY_TRINKET_1 then 
				if BadKittySaves[21]==0 then
					BKWTrink1:Hide()
				else
					local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BADKITTY_TRINKET_1)
					local _, _, enable = GetInventoryItemCooldown("player",13)
					if expirationTime and expirationTime>0 then
						if expirationTime<1 then
							BKWTrink1Text:SetText(floor(10*(expirationTime-GetTime()))/10)
							BadKittyCatTrink1:SetValue(floor(10*(expirationTime-GetTime()))/10)
						else
							BKWTrink1Text:SetText(floor(expirationTime-GetTime()))
							BadKittyCatTrink1:SetValue(floor(expirationTime-GetTime()))
						end
						BKWTrink1:SetBackdropColor(BadKitty_WarningColors(2))
						BKWTrink1:Show()
					elseif j>0 and j<BadKittySaves[12] then
						BKWTrink1:Show()
						BKWTrink1:SetBackdropColor(BadKitty_WarningColors(0))
						BKWTrink1Text:SetText(j)
					elseif j==0 and enable==1 then
						BKWTrink1:Show()
						BKWTrink1:SetBackdropColor(BadKitty_WarningColors(1))
						BKWTrink1Text:SetText("")
					else
						BKWTrink1:Hide()
					end
				end
			elseif i==BADKITTY_TRINKET_2 then 
				if BadKittySaves[21]==0 then
					BKWTrink2:Hide()
				else
					local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BADKITTY_TRINKET_2)
					local _, _, enable = GetInventoryItemCooldown("player",14)
					if expirationTime and expirationTime>0 then
						if expirationTime<1 then
							BKWTrink2Text:SetText(floor(10*(expirationTime-GetTime()))/10)
							BadKittyCatTrink2:SetValue(floor(10*(expirationTime-GetTime()))/10)
						else
							BKWTrink2Text:SetText(floor(expirationTime-GetTime()))
							BadKittyCatTrink2:SetValue(floor(expirationTime-GetTime()))
						end
						BKWTrink2:SetBackdropColor(BadKitty_WarningColors(2))
						BKWTrink2:Show()
					elseif j>0 and j<BadKittySaves[12] then
						BKWTrink2:Show()
						BKWTrink2:SetBackdropColor(BadKitty_WarningColors(0))
						BKWTrink2Text:SetText(j)
					elseif j==0 and enable==1 then
						BKWTrink2:Show()
						BKWTrink2:SetBackdropColor(BadKitty_WarningColors(1))
						BKWTrink2Text:SetText("")
					else
						BKWTrink2:Hide()
					end
				end
			end
		elseif j < BadKittySaves[12] and j >0 and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then
				if max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])>BadKittySaves[12] 
					or max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])==0 then
				else
					BKWMangle:Show()
					BKWMangle:SetBackdropColor(BadKitty_WarningColors(0))
					BKWMangleText:SetText(j)
				end
			elseif i==BADKITTY_SAVAGE_ROAR then 
				BKWSR:Show()
				BKWSR:SetBackdropColor(BadKitty_WarningColors(0))
				BKWSRText:SetText(j)
			elseif i==BADKITTY_RAKE then 
				BKWRake:Show()
				BKWRake:SetBackdropColor(BadKitty_WarningColors(0))
				BKWRakeText:SetText(j)
			elseif i==BADKITTY_RIP then 
				BKWRip:Show()
				BKWRip:SetBackdropColor(BadKitty_WarningColors(0))
				BKWRipText:SetText(j)
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then 
				if max(timeleft[BADKITTY_FAERIE_FIRE],timeleft[BADKITTY_FAERIE_FIRE_FERAL])>BadKittySaves[12] 
					or max(timeleft[BADKITTY_FAERIE_FIRE],timeleft[BADKITTY_FAERIE_FIRE_FERAL])==0 then
				else 
					BKWFFF:Show()
					BKWFFF:SetBackdropColor(BadKitty_WarningColors(0))
					BKWFFFText:SetText(j)
				end
			elseif i==BADKITTY_TIGERS_FURY then
				BKWTF:Show()
				BKWTF:SetBackdropColor(BadKitty_WarningColors(0))
				BKWTFText:SetText(j)
			elseif i==BADKITTY_BERSERK then
				BKWZerk:Show()
				BKWZerk:SetBackdropColor(BadKitty_WarningColors(0))
				BKWZerkText:SetText(j)
			elseif i==BADKITTY_WEAPON then
				BKWEnchant:Show()
				BKWEnchant:SetBackdropColor(BadKitty_WarningColors(0))
				BKWEnchantText:SetText(j)
			elseif i==BADKITTY_IDOL then
				BKWIdol:Show()
				BKWIdol:SetBackdropColor(BadKitty_WarningColors(0))
				BKWIdolText:SetText(j)
			end
		elseif j==0 and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then
				if max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])>0 then 
				else
					BKWMangle:Show()
					BKWMangle:SetBackdropColor(BadKitty_WarningColors(1))
					BKWMangleText:SetText("")
				end
			elseif i==BADKITTY_SAVAGE_ROAR then 
				BKWSR:Show()
				BKWSR:SetBackdropColor(BadKitty_WarningColors(1))
				BKWSRText:SetText("")
			elseif i==BADKITTY_RAKE then 
				BKWRake:Show()
				BKWRake:SetBackdropColor(BadKitty_WarningColors(1))
				BKWRakeText:SetText("")
			elseif i==BADKITTY_RIP then 
				BKWRip:Show()
				BKWRip:SetBackdropColor(BadKitty_WarningColors(1))
				BKWRipText:SetText("")
			elseif i==BADKITTY_TIGERS_FURY then
				BKWTF:Show()
				BKWTF:SetBackdropColor(BadKitty_WarningColors(1))
				BKWTFText:SetText("")
			elseif i==BADKITTY_BERSERK then
				BKWZerk:Show()
				BKWZerk:SetBackdropColor(BadKitty_WarningColors(1))
				BKWZerkText:SetText("")
			elseif i==BADKITTY_WEAPON then
				BKWEnchant:Hide()
			elseif i==BADKITTY_IDOL then
				BKWIdol:Hide()
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then 
				if max(timeleft[BADKITTY_FAERIE_FIRE_FERAL],timeleft[BADKITTY_FAERIE_FIRE])>0 then 
				else
					BKWFFF:Show()
					BKWFFF:SetBackdropColor(BadKitty_WarningColors(1))
					BKWFFFText:SetText("")
				end
			end
		elseif j>BadKittySaves[12] and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then BKWMangle:Hide()
			elseif i==BADKITTY_SAVAGE_ROAR then BKWSR:Hide()
			elseif i==BADKITTY_RAKE then BKWRake:Hide()
			elseif i==BADKITTY_RIP then BKWRip:Hide()
			elseif i==BADKITTY_TIGERS_FURY then BKWTF:Hide()
			elseif i==BADKITTY_BERSERK then 
				if BadKittySaves[21]==0 then
					BKWZerk:Hide()
				else
					--local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BADKITTY_BERSERK)
					--local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff("player", BADKITTY_BERSERK) 
					--if expirationTime and expirationTime>0 and spellId==50334 then
						--if icon=="Interface\\Icons\\Ability_Druid_Berserk" then 
							--[[if expirationTime<1 then
								BKWZerkText:SetText(floor(10*(expirationTime-GetTime()))/10)
							else
								BKWZerkText:SetText(floor(expirationTime-GetTime()))
							end]]
					if BadKittyZerkUp == 1 then
						BKWZerk:SetBackdropColor(BadKitty_WarningColors(2))
						BKWZerkText:SetText(timeleft[BADKITTY_BERSERK])
						BKWZerk:Show()
						--end
					else
						BKWZerk:Hide()
					end
				end
			
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then BKWFFF:Hide()
			elseif i==BADKITTY_IDOL then
				BKWIdol:Show()
				BKWIdol:SetBackdropColor(BadKitty_WarningColors(0))
				BKWIdolText:SetText(j)
			elseif i==BADKITTY_WEAPON then
				BKWEnchant:Show()
				BKWEnchant:SetBackdropColor(BadKitty_WarningColors(0))
				BKWEnchantText:SetText(j)
			end
		end
	end
end

function BadKitty_BearWarnings(timeleft)
	if BadKittySaves[8]==0 or not InCombatLockdown() then
		BKWBearMangle:Hide()
		BKWBearZerk:Hide()
		BKWBearLacerate:Hide()
		BKWBearDemo:Hide()
		BKWBearBarkskin:Hide()
		BKWBearFFF:Hide()
		BKWBearZerk:Hide()
		BKWBearBarkskin:Hide()
		return 0
	end
	for i,j in pairs(timeleft) do
		if j < BadKittySaves[12] and j >0 and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then
				if max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])>BadKittySaves[12] 
					or max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])==0 then
				else
					BKWBearMangle:Show()
					BKWBearMangle:SetBackdropColor(BadKitty_WarningColors(0))
					BKWBearMangleText:SetText(j)
				end
			elseif i==BADKITTY_LACERATE then 
				BKWBearLacerate:Show()
				BKWBearLacerate:SetBackdropColor(BadKitty_WarningColors(0))
				BKWBearLacerateText:SetText(j)
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then 
				if max(timeleft[BADKITTY_FAERIE_FIRE],timeleft[BADKITTY_FAERIE_FIRE_FERAL])>BadKittySaves[12] 
					or max(timeleft[BADKITTY_FAERIE_FIRE],timeleft[BADKITTY_FAERIE_FIRE_FERAL])==0 then
				else 
					BKWFFF:Show()
					BKWFFF:SetBackdropColor(BadKitty_WarningColors(0))
					BKWFFFText:SetText(j)
				end
			elseif i==BADKITTY_DEMO_SHOUT or i==BADKITTY_DEMO_ROAR or i==BADKITTY_CURSE_OF_WEAKNESS or i==BADKITTY_VINDICATION then 
				if max(timeleft[BADKITTY_DEMO_SHOUT],timeleft[BADKITTY_DEMO_ROAR],timeleft[BADKITTY_CURSE_OF_WEAKNESS],timeleft[BADKITTY_VINDICATION])>BadKittySaves[12] 
					or max(timeleft[BADKITTY_DEMO_SHOUT],timeleft[BADKITTY_DEMO_ROAR],timeleft[BADKITTY_CURSE_OF_WEAKNESS],timeleft[BADKITTY_VINDICATION])==0 then
				else 
					BKWBearDemo:Show()
					BKWBearDemo:SetBackdropColor(BadKitty_WarningColors(0))
					BKWBearDemoText:SetText(j)
				end
			elseif i==BADKITTY_BARKSKIN then
				BKWBearBarkskin:Show()
				BKWBearBarkskin:SetBackdropColor(BadKitty_WarningColors(0))
				BKWBearBarkskinText:SetText(j)
			elseif i==BADKITTY_BERSERK then
				BKWBearZerk:Show()
				BKWBearZerk:SetBackdropColor(BadKitty_WarningColors(0))
				BKWBearZerkText:SetText(j)
			end
		elseif j==0 and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then
				if max(timeleft[BADKITTY_MANGLE_CAT],timeleft[BADKITTY_MANGLE_BEAR],timeleft[BADKITTY_TRAUMA])>0 then 
				else
					BKWBearMangle:Show()
					BKWBearMangle:SetBackdropColor(BadKitty_WarningColors(1))
					BKWBearMangleText:SetText("")
				end
			elseif i==BADKITTY_LACERATE then 
				BKWBearLacerate:Show()
				BKWBearLacerate:SetBackdropColor(BadKitty_WarningColors(1))
				BKWBearLacerateText:SetText("")
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then 
				if max(timeleft[BADKITTY_FAERIE_FIRE_FERAL],timeleft[BADKITTY_FAERIE_FIRE])>0 then 
				else
					BKWBearFFF:Show()
					BKWBearFFF:SetBackdropColor(BadKitty_WarningColors(1))
					BKWBearFFFText:SetText("")
				end
			elseif i==BADKITTY_DEMO_SHOUT or i==BADKITTY_DEMO_ROAR or i==BADKITTY_CURSE_OF_WEAKNESS or i==BADKITTY_VINDICATION then 
				if max(timeleft[BADKITTY_DEMO_SHOUT],timeleft[BADKITTY_DEMO_ROAR],timeleft[BADKITTY_CURSE_OF_WEAKNESS],timeleft[BADKITTY_VINDICATION])>0 then 
				else
					BKWBearDemo:Show()
					BKWBearDemo:SetBackdropColor(BadKitty_WarningColors(1))
					BKWBearDemoText:SetText("")
				end
			elseif i==BADKITTY_BARKSKIN then
				BKWBearBarkskin:Show()
				BKWBearBarkskin:SetBackdropColor(BadKitty_WarningColors(1))
				BKWBearBarkskinText:SetText("")
			elseif i==BADKITTY_BERSERK then
				BKWBearZerk:Show()
				BKWBearZerk:SetBackdropColor(BadKitty_WarningColors(1))
				BKWBearZerkText:SetText("")
			end
		elseif j>BadKittySaves[12] and InCombatLockdown() then
			if i==BADKITTY_MANGLE_CAT or i==BADKITTY_MANGLE_BEAR or i==BADKITTY_TRAUMA then BKWBearMangle:Hide()
			elseif i==BADKITTY_LACERATE then BKWBearLacerate:Hide()
			elseif i==BADKITTY_DEMO_ROAR or i==BADKITTY_DEMO_SHOUT or i==BADKITTY_VINDICATION then BKWBearDemo:Hide()
			elseif i==BADKITTY_FAERIE_FIRE_FERAL or i==BADKITTY_FAERIE_FIRE then BKWBearFFF:Hide()
			elseif i==BADKITTY_BARKSKIN then BKWBearBarkskin:Hide()
			elseif i==BADKITTY_BERSERK then 
				if BadKittySaves[21]==0 then
					BKWBearZerk:Hide()
				else
					--local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable  =  UnitBuff("player", BADKITTY_BERSERK)
					--local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff("player", BADKITTY_BERSERK) 
					--if expirationTime and spellId==50334 then
						--if icon=="Interface\\Icons\\Ability_Druid_Berserk" then 
						--[[if expirationTime<1 then
							BKWBearZerkText:SetText(floor(10*(expirationTime-GetTime()))/10)
						else
							BKWBearZerkText:SetText(floor(expirationTime-GetTime()))
						end]]
					if BadKittyZerkUp == 1 then
						BKWBearZerk:SetBackdropColor(BadKitty_WarningColors(2))
						BKWBearZerkText:SetText(timeleft[BADKITTY_BERSERK])
						BKWBearZerk:Show()
						--end
					else
						BKWBearZerk:Hide()
					end
				end
			end
		end
	end
end


function BadKitty_Setup()
	local _G = getfenv()
	BadKittyFrame:SetHeight(BadKittySaves[1]*BadKittyCatCount)
	BadKittyBear:SetHeight(BadKittySaves[1]*BadKittyBearCount)
	BadKittyFrame:SetWidth(BadKittySaves[2])
	BadKittyBear:SetWidth(BadKittySaves[2])
	for i=1,BadKittyCatCount,1 do
		_G["BadKittyFrameBar"..i]:SetWidth(BadKittySaves[2])
		_G["BadKittyFrameBar"..i]:SetHeight(BadKittySaves[1])
		_G["BadKittyFrameBar"..i]:SetPoint("TOP",BadKittyFrame, "TOP",0,BadKittySaves[1]*-(i-1))
		_G["BadKittyCatIcon"..i]:SetWidth(BadKittySaves[1])
		_G["BadKittyCatIcon"..i]:SetHeight(BadKittySaves[1])
		_G["BadKittyFrameBar"..i.."Text"]:SetFont("Fonts\\FRIZQT__.TTF",BadKittySaves[6])
		_G["BadKittyFrameBar"..i.."Secs"]:SetFont("Fonts\\FRIZQT__.TTF",BadKittySaves[6])
		_G["BadKittyFrameBar"..i]:SetStatusBarTexture(BadKittyBarTexture)
	end
	for i=1,BadKittyBearCount,1 do
		_G["BadKittyBearBar"..i]:SetWidth(BadKittySaves[2])
		_G["BadKittyBearBar"..i]:SetHeight(BadKittySaves[1])
		_G["BadKittyBearBar"..i]:SetPoint("TOP",BadKittyBear, "TOP",0,BadKittySaves[1]*-(i-1))
		_G["BadKittyBearIcon"..i]:SetWidth(BadKittySaves[1])
		_G["BadKittyBearIcon"..i]:SetHeight(BadKittySaves[1])
		_G["BadKittyBearBar"..i.."Text"]:SetFont("Fonts\\FRIZQT__.TTF",BadKittySaves[6])
		_G["BadKittyBearBar"..i.."Secs"]:SetFont("Fonts\\FRIZQT__.TTF",BadKittySaves[6])
		_G["BadKittyBearBar"..i]:SetStatusBarTexture(BadKittyBarTexture)
	end
	BKOOCFrame:SetWidth(min(BadKittySaves[1]*BadKittyCatCount,BadKittySaves[2]))
	BKOOCFrame:SetHeight(min(BadKittySaves[1]*BadKittyCatCount,BadKittySaves[2]))
	BKBearOOCFrame:SetWidth(min(BadKittySaves[1]*BadKittyBearCount,BadKittySaves[2]))
	BKBearOOCFrame:SetHeight(min(BadKittySaves[1]*BadKittyBearCount,BadKittySaves[2]))
	
	for i=1,13,1 do
		_G["BKW"..i]:SetHeight(BadKittySaves[16])
		_G["BKW"..i]:SetWidth(BadKittySaves[16])
	end
	for i=1,6,1 do
		_G["BKWBear"..i]:SetHeight(BadKittySaves[16])
		_G["BKWBear"..i]:SetWidth(BadKittySaves[16])
	end
	BadKitty_CatWarningShape(BadKittySaves[14])
	BadKitty_BearWarningShape(BadKittySaves[15])
	
	--Warning Frame text (placeholder kinda)
	BKWMangleText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWSRText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWRakeText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWRipText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWFFFText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWTFText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWZerkText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWShredText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWEnchantText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWTrink1Text:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWTrink2Text:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWIdolText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearMangleText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearLacerateText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearZerkText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearDemoText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearFFFText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	BKWBearBarkskinText:SetFont("Fonts\\FRIZQT__.TTF", BadKittySaves[19])
	
	BadKittyCatSRText:SetText("Savage Roar")
	BadKittyCatMangleText:SetText("Mangle")
	BadKittyCatRakeText:SetText("Rake")
	BadKittyCatRipText:SetText("Rip")
	BadKittyCatFFFText:SetText("FFF")
	BadKittyCatCPText:SetText("Combo")
	BadKittyCatTFText:SetText("Tiger's Fury")
	BadKittyCatZerkText:SetText("Berserk")
	BadKittyCatEnergyText:SetText("Energy")
	BadKittyCatShredText:SetText("Shred Count")
	BadKittyCatPSText:SetText("Instant Nature")
	BadKittyCatEnchantText:SetText("Enchant")
	BadKittyCatTrink1Text:SetText("Trinket 1")
	BadKittyCatTrink2Text:SetText("Trinket 2")
	BadKittyCatIdolText:SetText("Idol")
	BadKittyBearDemoText:SetText("Demo")
	BadKittyBearLacText:SetText("Lacerate")
	BadKittyBearMangleText:SetText("Mangle")
	BadKittyBearFFFText:SetText("FFF")
	BadKittyBearBSText:SetText("Barkskin")
	BadKittyBearZerkText:SetText("Berserk")
	BadKittyBearRageText:SetText("Rage")
	--if BadKittyColorOptionsExampleBar then 
		BadKittyColorOptionsExampleBar:SetStatusBarTexture(BadKittyBarTexture)
		BadKittyColorOptionsExampleBarText:SetText("Savage Roar")
		BadKittyColorOptionsExampleBarSecs:SetText("35")
	--end
	
	BadKitty_Colorize()
	if BadKittySaves[4]==1 then
		BadKittyCatSR:SetMinMaxValues(0,36)
		BadKittyCatMangle:SetMinMaxValues(0,60)
		BadKittyCatRake:SetMinMaxValues(0,9)
		BadKittyCatRip:SetMinMaxValues(0,16)
		BadKittyCatFFF:SetMinMaxValues(0,300)
		BadKittyCatShred:SetMinMaxValues(0,3)
		BadKittyCatPS:SetMinMaxValues(0,7)
		BadKittyCatEnchant:SetMinMaxValues(0,15)
		BadKittyCatTrink1:SetMinMaxValues(0,15)
		BadKittyCatTrink2:SetMinMaxValues(0,15)
		BadKittyCatIdol:SetMinMaxValues(0,15)
		BadKittyBearMangle:SetMinMaxValues(0,18)
		BadKittyBearDemo:SetMinMaxValues(0,30)
		BadKittyBearLac:SetMinMaxValues(0,15)
		BadKittyBearFFF:SetMinMaxValues(0,40)
	else
		BadKittyCatSR:SetMinMaxValues(0,40)
		BadKittyCatMangle:SetMinMaxValues(0,40)
		BadKittyCatRake:SetMinMaxValues(0,40)
		BadKittyCatRip:SetMinMaxValues(0,40)
		BadKittyCatFFF:SetMinMaxValues(0,40)
		BadKittyCatShred:SetMinMaxValues(0,3)
		BadKittyCatPS:SetMinMaxValues(0,40)
		BadKittyCatEnchant:SetMinMaxValues(0,40)
		BadKittyCatTrink1:SetMinMaxValues(0,40)
		BadKittyCatTrink2:SetMinMaxValues(0,40)
		BadKittyCatIdol:SetMinMaxValues(0,40)
		BadKittyBearMangle:SetMinMaxValues(0,40)
		BadKittyBearDemo:SetMinMaxValues(0,40)
		BadKittyBearLac:SetMinMaxValues(0,40)
		BadKittyBearFFF:SetMinMaxValues(0,40)
	end
 end

function BadKitty_OldVersion()
	if BadKittySaves[3]<1.9 then
		--					1			2			3			4			5		6		7		8			9		10
		--					height		width		version		barratio	BBars	font	chide	Bwarnings	Cbars	ooc
		BadKittySaves = 	{15			,110		,1.11		,0			,1		,12		,1		,1			,1		,1
		
		--					11			12			13		14			15			16		17		18			19			20			21
		--					Cwarnings	warntime	walph	cor			bor			wsize	BKWmod	Wcolors		Wfont		>.>			zerkd
							,1			,3			,0.5	,{3,'c'}	,{3,"c"}	,50		,0		,1			,25			,1			,1}
	end
	BadKittySaves[3]=1.11
	BadKittySaves[14]={3,"c"}
	BadKittySaves[15]={3,"c"}
	BadKittySaves[19]=25
	BadKittyCFrames[12]=12
	BadKittyCFrames[13]=13
	BadKittyCFrames[14]=14
	BadKittyCFrames[15]=15
	BadKitty_Output("padfjaoifjaoidfj")
	BadKittyWCFrames[10]=10
	BadKittyWCFrames[11]=11
	BadKittyWCFrames[12]=12
	BadKittyWCFrames[13]=13

	BadKitty_SetFrames()
	BadKittyNewVersion:Show()
end

function BK_T()
	for i=1,12,1 do
		BadKitty_Output(BadKittySaves[i].." "..BadKittyDefaults[i])
	end
end 

function BadKitty_WarningColors(isUp)
	if isUp==1 and BadKittySaves[18]==1 then
		return BadKittyRed[1],BadKittyRed[2],BadKittyRed[3]
	elseif isUp==2 and BadKittySaves[18]==1 then
		return BadKittyGreen[1],BadKittyGreen[2],BadKittyGreen[3]
	else
		return BadKittyWhite[1],BadKittyWhite[2],BadKittyWhite[3]
	end
end


function BadKitty_HideShow(bool,frame)
	if bool==1 then
		getglobal(frame):Show()
	else
		getglobal(frame):Hide()
	end
end