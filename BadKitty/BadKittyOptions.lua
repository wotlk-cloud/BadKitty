function BadKitty_OLoad(panel)
	SlashCmdList["BADKITTY"] = BadKitty_Slashes
	SLASH_BADKITTY1 = "/badkitty"
	SLASH_BADKITTY2 = "/bk"
	panel.name = "BadKitty"
	InterfaceOptions_AddCategory(panel)
	--[[BadKittyOptionsCheckOOCWarnings:SetChecked(BadKittySaves[4])
	if not BadKittyOptionsCheckOOCWarnings:GetChecked() then
		BadKittyOptionsCheckOOCBars:SetChecked()
	end]]
end

function BadKitty_OpenOptions()
	InterfaceOptionsFrame_OpenToCategory(BadKittyLayoutOptions)
	InterfaceOptionsFrame_OpenToCategory(BadKittyOptions)
end

function BadKitty_OptionsLoad(panel,name)	--Only for children!
	panel.name = name
	panel.parent = "BadKitty"
	InterfaceOptions_AddCategory(panel)
end

function BadKitty_Slashes(msg)
	if msg == "0" then
		ReloadUI();
		return 0;
	end
	if msg=="toggle" then
		if BadKittySaves[5]==1 or BadKittySaves[9]==1 then
			BadKittySaves[5]=0
			BadKittySaves[8]=0
			BadKittySaves[9]=0
			BadKittySaves[11]=0
		else
			BadKittySaves[5]=1
			BadKittySaves[8]=1
			BadKittySaves[9]=1
			BadKittySaves[11]=1
		end
		return 0
	elseif msg=="lock" then
		if BadKittyLock==1 then
			BadKittyOptionsCheckLock:SetChecked(0)
			BadKittyLock=0
		else
			BadKittyOptionsCheckLock:SetChecked(1)
			BadKittyLock=1
		end
		BadKitty_Lock()
		return
	end
	InterfaceOptionsFrame_OpenToCategory(BadKittyColorOptions)
	InterfaceOptionsFrame_OpenToCategory(BadKittyOptions)
	--[[
	local a,b=strfind(msg, "%S+")
	Cmd = strsub(msg,a,b)
	Sub = strsub(msg,b+2)
	if Cmd == "toggle" then
		if BadKittySaves[9]==1 or BadKittySaves[11]==1 then
			BadKittySaves[9]=0
			BadKittySaves[11]=0
		else
			BadKittySaves[9]=1
			BadKittySaves[11]=1
		end
	end]]
end 

--------

function BadKitty_Font()
	local size = BadKittyOptionsFont:GetValue()
	BadKittySaves[6] = size
	BadKitty_Setup()
end

function BadKitty_RatioToggle()
	if this:GetChecked() then
		BadKittySaves[4]=1
	else
		BadKittySaves[4]=0
	end
	BadKitty_Setup()
end

function BadKitty_Resize()
	local width = BadKittyOptionsWidth:GetValue()
	local height = BadKittyOptionsHeight:GetValue()
	if height and height>0 then
		BadKittySaves[1] = height
	end
	if width then
		BadKittySaves[2] = width
	end
	BadKitty_SetFrames()
end

function BadKitty_CombatHide()
	if this:GetChecked() then
		BadKittySaves[7]=1
	else
		BadKittySaves[7]=0
	end
end

function BadKitty_CWarn()
	if this:GetChecked() then
		BadKittySaves[11] = 1
	else
		BadKittySaves[11] = 0
	end
end

function BadKitty_CBar()
	if this:GetChecked() then
		BadKittySaves[9] = 1
	else
		BadKittySaves[9] = 0
	end
end

function BadKitty_BWarn()
	if this:GetChecked() then
		BadKittySaves[8] = 1
	else
		BadKittySaves[8] = 0
	end
end

function BadKitty_BBar()
	if this:GetChecked() then
		BadKittySaves[5] = 1
	else
		BadKittySaves[5] = 0
	end
end

function BadKitty_Lock()
	if BadKittyOptionsCheckLock:GetChecked() then
		BadKittyLock = 1
		BKWMoveFrame:EnableMouse(0)
		BKWMoveFrame:SetAlpha(0)
		BKWBearMoveFrame:EnableMouse(0)
		BKWBearMoveFrame:SetAlpha(0)
		BadKittySaves[7]=BadKittyTempHide
	else
		BadKittyLock = 0
		BKWMoveFrame:EnableMouse(1)
		BKWMoveFrame:SetAlpha(1)
		BKWBearMoveFrame:EnableMouse(1)
		BKWBearMoveFrame:SetAlpha(1)
		BadKittyTempHide=BadKittySaves[7]
		BadKittySaves[7]=0
	end
end

function BadKitty_OOCToggle()
	if this:GetChecked() then
		BadKittySaves[10] = 1
	else
		BadKittySaves[10] = 0
	end
end

function BadKitty_OOCPosition()
	if BadKittyOptionsCheckOOCBars:GetChecked() then
		BadKittySaves[4] = 1
	else
		BadKittySaves[4] = 0 
	end
	BadKitty_Setup()
end

function BadKitty_CenterFrame()
	BadKittyFrame:ClearAllPoints()
	BadKittyFrame:SetPoint("CENTER", "UIParent", "CENTER")
	BadKittyWarnings:ClearAllPoints()
	BadKittyWarnings:SetPoint("CENTER", "UIParent", "CENTER")
	BadKittyBear:ClearAllPoints()
	BadKittyBear:SetPoint("CENTER", "UIParent", "CENTER")
	BadKittyBearWarnings:ClearAllPoints()
	BadKittyBearWarnings:SetPoint("CENTER", "UIParent", "CENTER")
	
end

function BKMove()
	if BadKittyLock == 0 then
		BadKittyFrame:StartMoving()
	end
end 

function BKBMove()
	if BadKittyLock == 0 then
		BadKittyBear:StartMoving()
	end
end 

function BKWMove()
	if BadKittyLock == 0 then
		BadKittyWarnings:StartMoving()
	end
end 

function BKWBearMove()
	if BadKittyLock == 0 then
		BadKittyBearWarnings:StartMoving()
	end
end 

function BadKitty_Timer()
	BadKittySaves[12] = BadKittyOptionsTimer:GetValue()
end

function BadKitty_HideBear()
	BadKittyBear:Hide()
	BadKittyBearWarnings:Hide()
end 

function BadKitty_BarOrder(bar,action,formTable)
	BadKittyBarOptionsCatText0:Hide()
	BadKittyBarOptionsBearText0:Hide()
	if action=="UP" then
		maxj=1
		for i,j in ipairs(formTable) do 
			if j==bar then current = i end
			if j==bar-1 then previous = i end
			if j>maxj then maxj = j end
		end
		formTable[current]=bar-1
		formTable[previous]=bar
	elseif action=="DOWN" then
		for i,j in ipairs(formTable) do 
			if j==bar then current = i end
			if j==bar+1 then nexti = i end
		end
		formTable[current]=bar+1
		formTable[nexti]=bar
	end
	BadKitty_SetFrames()
	BadKitty_BarOptionsText()
end 

function BadKitty_WarnOrder(warn,action,formTable)
	if action=="UP" then
		maxj=1
		for i,j in ipairs(formTable) do 
			if j==warn then current = i end
			if j==warn-1 then previous = i end
			if j>maxj then maxj = j end
		end
		formTable[current]=warn-1
		formTable[previous]=warn
	elseif action=="DOWN" then
		for i,j in ipairs(formTable) do 
			if j==warn then current = i end
			if j==warn+1 then nexti = i end
		end
		formTable[current]=warn+1
		formTable[nexti]=warn
	end
	BadKitty_SetFrames()
end 

function BadKitty_BarOptionsText()
	local _G = getfenv()
	for i,j in ipairs(BadKittyCFrames) do
		if 		i==1 then _G["BadKittyBarOptionsCatText"..j]:SetText("Savage Roar")
		elseif	i==2 then _G["BadKittyBarOptionsCatText"..j]:SetText("Mangle")
		elseif	i==3 then _G["BadKittyBarOptionsCatText"..j]:SetText("Rake")
		elseif	i==4 then _G["BadKittyBarOptionsCatText"..j]:SetText("Rip")
		elseif	i==5 then _G["BadKittyBarOptionsCatText"..j]:SetText("Faerie Fire")
		elseif	i==6 then _G["BadKittyBarOptionsCatText"..j]:SetText("Combos")
		elseif	i==7 then _G["BadKittyBarOptionsCatText"..j]:SetText("Tiger's Fury")
		elseif	i==8 then _G["BadKittyBarOptionsCatText"..j]:SetText("Berserk")
		elseif	i==9 then _G["BadKittyBarOptionsCatText"..j]:SetText("Energy")
		elseif	i==10	then _G["BadKittyBarOptionsCatText"..j]:SetText("Shred Count")
		elseif	i==11	then _G["BadKittyBarOptionsCatText"..j]:SetText("Instant Nature")
		elseif	i==12	then _G["BadKittyBarOptionsCatText"..j]:SetText("Enchant")
		elseif	i==13	then _G["BadKittyBarOptionsCatText"..j]:SetText("Trinket 1")
		elseif	i==14	then _G["BadKittyBarOptionsCatText"..j]:SetText("Trinket 2")
		elseif	i==15	then _G["BadKittyBarOptionsCatText"..j]:SetText("Idol")		
		end
	end
	for i,j in ipairs(BadKittyBFrames) do
		if 		i==1 then _G["BadKittyBarOptionsBearText"..j]:SetText("Mangle")
		elseif	i==2 then _G["BadKittyBarOptionsBearText"..j]:SetText("Demo Roar")
		elseif	i==3 then _G["BadKittyBarOptionsBearText"..j]:SetText("Lacerate")
		elseif	i==4 then _G["BadKittyBarOptionsBearText"..j]:SetText("Faerie Fire")
		elseif	i==5 then _G["BadKittyBarOptionsBearText"..j]:SetText("Barkskin")
		elseif	i==6 then _G["BadKittyBarOptionsBearText"..j]:SetText("Berserk")
		elseif	i==7 then _G["BadKittyBarOptionsBearText"..j]:SetText("Rage")
		end
	end
end 

function BadKitty_WarnOptionsText()
	local _G = getfenv()
	for i,j in ipairs(BadKittyWCFrames) do
		if 		i==1 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Savage Roar")
		elseif	i==2 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Rake")
		elseif	i==3 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Faerie Fire")
		elseif	i==4 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Tiger's Fury")
		elseif	i==5 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Clearcasting")
		elseif	i==6 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Rip")
		elseif	i==7 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Mangle")
		elseif	i==8 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Berserk")
		elseif	i==9 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Shred Count")
		elseif	i==10 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Enchant")
		elseif	i==11 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Trinket 1")
		elseif	i==12 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Trinket 2")
		elseif	i==13 then _G["BadKittyWarnOptionsCatText"..j]:SetText(j.." Idol")
		end
	end
end 

function BadKitty_BearWarnOptionsText()
	local _G = getfenv()
	for i,j in ipairs(BadKittyWBFrames) do
		if 		i==1 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Lacerate")
		elseif	i==2 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Demo Roar")
		elseif	i==3 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Faerie Fire")
		elseif	i==4 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Mangle")
		elseif	i==5 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Barkskin")
		elseif	i==6 then _G["BadKittyWarnOptionsBearText"..j]:SetText(j.." Berserk")
		end
	end
end 

function BadKitty_CatWarningShape(shape)
	local _G = getfenv()
	local adjust = 0
	BadKittySaves[14]=shape
	BKW1:ClearAllPoints()
	BKW2:ClearAllPoints()
	BKW3:ClearAllPoints()
	BKW4:ClearAllPoints()
	BKW5:ClearAllPoints()
	BKW6:ClearAllPoints()
	BKW7:ClearAllPoints()
	BKW8:ClearAllPoints()
	BKW9:ClearAllPoints()
	BKW10:ClearAllPoints()
	BKW11:ClearAllPoints()
	BKW12:ClearAllPoints()
	BKW13:ClearAllPoints()
	BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
	if mod(13,shape[1])==0 then adjust=0 else adjust=1 end
	if shape[2]=='r' then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*(floor(13/shape[1]))+BadKittySaves[16]*adjust)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*shape[1])
		BKWMoveFrame:SetWidth(BadKittySaves[16]*(floor(13/shape[1]))+BadKittySaves[16]*adjust)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*shape[1])
		
		for i=2,13,1 do
			if 1==mod(i,shape[1]) then
				_G["BKW"..i]:SetPoint("LEFT","BKW"..i-shape[1],"RIGHT")
			else
				_G["BKW"..i]:SetPoint("TOP","BKW"..i-1,"BOTTOM")
			end
		end
	elseif shape[2]=='c' then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*shape[1])
		BadKittyWarnings:SetHeight(BadKittySaves[16]*(floor(13/shape[1]))+BadKittySaves[16]*adjust)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*shape[1])
		BKWMoveFrame:SetHeight(BadKittySaves[16]*(floor(13/shape[1]))+BadKittySaves[16]*adjust)
		
		for i=2,13,1 do
			if 1==mod(i,shape[1]) then
				_G["BKW"..i]:SetPoint("TOP","BKW"..i-shape[1],"BOTTOM")
			else
				_G["BKW"..i]:SetPoint("LEFT","BKW"..i-1,"RIGHT")
			end
		end
	end
end

function BadKitty_CatWarningShapeOld(shape)
	BadKittySaves[14]=shape
	BKW1:ClearAllPoints()
	BKW2:ClearAllPoints()
	BKW3:ClearAllPoints()
	BKW4:ClearAllPoints()
	BKW5:ClearAllPoints()
	BKW6:ClearAllPoints()
	BKW7:ClearAllPoints()
	BKW8:ClearAllPoints()
	BKW9:ClearAllPoints()
	if shape=="Square" then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*3)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*3)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*3)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*3)
		BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
		BKW2:SetPoint("LEFT","BKW1","RIGHT")
		BKW3:SetPoint("LEFT","BKW2","RIGHT")
		BKW4:SetPoint("LEFT","BadKittyWarnings","LEFT")
		BKW5:SetPoint("LEFT","BKW4","RIGHT")
		BKW6:SetPoint("LEFT","BKW5","RIGHT")
		BKW7:SetPoint("BOTTOMLEFT","BadKittyWarnings","BOTTOMLEFT")
		BKW8:SetPoint("LEFT","BKW7","RIGHT")
		BKW9:SetPoint("LEFT","BKW8","RIGHT")
	elseif shape=="HBox" then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*5)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*2)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*5)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*2)
		BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
		BKW2:SetPoint("LEFT","BKW1","RIGHT")
		BKW3:SetPoint("LEFT","BKW2","RIGHT")
		BKW4:SetPoint("LEFT","BKW3","RIGHT")
		BKW5:SetPoint("LEFT","BKW4","RIGHT")
		BKW6:SetPoint("TOP","BKW1","BOTTOM")
		BKW7:SetPoint("LEFT","BKW6","RIGHT")
		BKW8:SetPoint("LEFT","BKW7","RIGHT")
		BKW9:SetPoint("LEFT","BKW8","RIGHT")
	elseif shape=="VBox" then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*2)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*5)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*2)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*5)
		BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
		BKW2:SetPoint("TOP","BKW1","BOTTOM")
		BKW3:SetPoint("TOP","BKW2","BOTTOM")
		BKW4:SetPoint("TOP","BKW3","BOTTOM")
		BKW5:SetPoint("TOP","BKW4","BOTTOM")
		BKW6:SetPoint("TOPRIGHT","BadKittyWarnings","TOPRIGHT")
		BKW7:SetPoint("TOP","BKW6","BOTTOM")
		BKW8:SetPoint("TOP","BKW7","BOTTOM")
		BKW9:SetPoint("TOP","BKW8","BOTTOM")
	elseif shape=="HLine" then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*9)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*1)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*9)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*1)
		BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
		BKW2:SetPoint("LEFT","BKW1","RIGHT")
		BKW3:SetPoint("LEFT","BKW2","RIGHT")
		BKW4:SetPoint("LEFT","BKW3","RIGHT")
		BKW5:SetPoint("LEFT","BKW4","RIGHT")
		BKW6:SetPoint("LEFT","BKW5","RIGHT")
		BKW7:SetPoint("LEFT","BKW6","RIGHT")
		BKW8:SetPoint("LEFT","BKW7","RIGHT")
		BKW9:SetPoint("LEFT","BKW8","RIGHT")
	elseif shape=="VLine" then
		BadKittyWarnings:SetWidth(BadKittySaves[16]*1)
		BadKittyWarnings:SetHeight(BadKittySaves[16]*9)
		BKWMoveFrame:SetWidth(BadKittySaves[16]*1)
		BKWMoveFrame:SetHeight(BadKittySaves[16]*9)
		BKW1:SetPoint("TOPLEFT","BadKittyWarnings","TOPLEFT")
		BKW2:SetPoint("TOP","BKW1","BOTTOM")
		BKW3:SetPoint("TOP","BKW2","BOTTOM")
		BKW4:SetPoint("TOP","BKW3","BOTTOM")
		BKW5:SetPoint("TOP","BKW4","BOTTOM")
		BKW6:SetPoint("TOP","BKW5","BOTTOM")
		BKW7:SetPoint("TOP","BKW6","BOTTOM")
		BKW8:SetPoint("TOP","BKW7","BOTTOM")
		BKW9:SetPoint("TOP","BKW8","BOTTOM")
	end
		
end

function BadKitty_BearWarningShape(shape)
	local _G = getfenv()
	BadKittySaves[15]=shape
	BKWBear1:ClearAllPoints()
	BKWBear2:ClearAllPoints()
	BKWBear3:ClearAllPoints()
	BKWBear4:ClearAllPoints()
	BKWBear5:ClearAllPoints()
	BKWBear6:ClearAllPoints()
	BKWBear1:SetPoint("TOPLEFT","BadKittyBearWarnings","TOPLEFT")
	if mod(6,shape[1])==0 then adjust=0 else adjust=1 end
	if shape[2]=='r' then
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*(floor(6/shape[1]))+BadKittySaves[16]*adjust)
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*shape[1])
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*(floor(6/shape[1]))+BadKittySaves[16]*adjust)
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*shape[1])
		
		for i=2,6,1 do
			if 1==mod(i,shape[1]) then
				_G["BKWBear"..i]:SetPoint("LEFT","BKWBear"..i-shape[1],"RIGHT")
			else
				_G["BKWBear"..i]:SetPoint("TOP","BKWBear"..i-1,"BOTTOM")
			end
		end
	elseif shape[2]=='c' then
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*shape[1])
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*(floor(6/shape[1]))+BadKittySaves[16]*adjust)
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*shape[1])
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*(floor(6/shape[1]))+BadKittySaves[16]*adjust)
		
		for i=2,6,1 do
			if 1==mod(i,shape[1]) then
				_G["BKWBear"..i]:SetPoint("TOP","BKWBear"..i-shape[1],"BOTTOM")
			else
				_G["BKWBear"..i]:SetPoint("LEFT","BKWBear"..i-1,"RIGHT")
			end
		end
	end
end

function BadKitty_BearWarningShapeOld(shape)
	BadKittySaves[15]=shape
	BKWBear1:ClearAllPoints()
	BKWBear2:ClearAllPoints()
	BKWBear3:ClearAllPoints()
	BKWBear4:ClearAllPoints()
	BKWBear5:ClearAllPoints()
	BKWBear6:ClearAllPoints()
	if shape=="HBox" then
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*2)
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*3)
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*2)
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*3)
		BKWBear1:SetPoint("TOPLEFT","BadKittyBearWarnings","TOPLEFT")
		BKWBear2:SetPoint("LEFT","BKWBear1","RIGHT")
		BKWBear3:SetPoint("LEFT","BKWBear2","RIGHT")
		BKWBear4:SetPoint("BOTTOMLEFT","BadKittyBearWarnings","BOTTOMLEFT")
		BKWBear5:SetPoint("LEFT","BKWBear4","RIGHT")
		BKWBear6:SetPoint("LEFT","BKWBear5","RIGHT")
	elseif shape=="VBox" then
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*3)
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*2)
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*3)
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*2)
		BKWBear1:SetPoint("TOPLEFT","BadKittyBearWarnings","TOPLEFT")
		BKWBear2:SetPoint("TOP","BKWBear1","BOTTOM")
		BKWBear3:SetPoint("TOP","BKWBear2","BOTTOM")
		BKWBear4:SetPoint("TOPRIGHT","BadKittyBearWarnings","TOPRIGHT")
		BKWBear5:SetPoint("TOP","BKWBear4","BOTTOM")
		BKWBear6:SetPoint("TOP","BKWBear5","BOTTOM")
	elseif shape=="HLine" then
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*1)
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*6)
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*1)
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*6)
		BKWBear1:SetPoint("TOPLEFT","BadKittyBearWarnings","TOPLEFT")
		BKWBear2:SetPoint("LEFT","BKWBear1","RIGHT")
		BKWBear3:SetPoint("LEFT","BKWBear2","RIGHT")
		BKWBear4:SetPoint("LEFT","BKWBear3","RIGHT")
		BKWBear5:SetPoint("LEFT","BKWBear4","RIGHT")
		BKWBear6:SetPoint("LEFT","BKWBear5","RIGHT")
	elseif shape=="VLine" then
		BadKittyBearWarnings:SetHeight(BadKittySaves[16]*6)
		BadKittyBearWarnings:SetWidth(BadKittySaves[16]*1)
		BKWBearMoveFrame:SetHeight(BadKittySaves[16]*6)
		BKWBearMoveFrame:SetWidth(BadKittySaves[16]*1)
		BKWBear1:SetPoint("TOPLEFT","BadKittyBearWarnings","TOPLEFT")
		BKWBear2:SetPoint("TOP","BKWBear1","BOTTOM")
		BKWBear3:SetPoint("TOP","BKWBear2","BOTTOM")
		BKWBear4:SetPoint("TOP","BKWBear3","BOTTOM")
		BKWBear5:SetPoint("TOP","BKWBear4","BOTTOM")
		BKWBear6:SetPoint("TOP","BKWBear5","BOTTOM")
	end
end

function BadKitty_CatRadioOff()
	BadKittyBarOptionsCatRadio1:SetChecked(0)
	BadKittyBarOptionsCatRadio2:SetChecked(0)
	BadKittyBarOptionsCatRadio3:SetChecked(0)
	BadKittyBarOptionsCatRadio4:SetChecked(0)
	BadKittyBarOptionsCatRadio5:SetChecked(0)
	BadKittyBarOptionsCatRadio6:SetChecked(0)
	BadKittyBarOptionsCatRadio7:SetChecked(0)
	BadKittyBarOptionsCatRadio8:SetChecked(0)
	BadKittyBarOptionsCatRadio9:SetChecked(0)
	BadKittyBarOptionsCatRadio10:SetChecked(0)
	BadKittyBarOptionsCatRadio11:SetChecked(0)
	BadKittyBarOptionsCatRadio12:SetChecked(0)
	BadKittyBarOptionsCatRadio13:SetChecked(0)
	BadKittyBarOptionsCatRadio14:SetChecked(0)
	BadKittyBarOptionsCatRadio15:SetChecked(0)
end

function BadKitty_BearRadioOff()
	BadKittyBarOptionsBearRadio1:SetChecked(0)
	BadKittyBarOptionsBearRadio2:SetChecked(0)
	BadKittyBarOptionsBearRadio3:SetChecked(0)
	BadKittyBarOptionsBearRadio4:SetChecked(0)
	BadKittyBarOptionsBearRadio5:SetChecked(0)
	BadKittyBarOptionsBearRadio6:SetChecked(0)
	BadKittyBarOptionsBearRadio7:SetChecked(0)
end

function BadKitty_WCatRadioOff()
	BadKittyWarnOptionsCatRadio1:SetChecked(0)
	BadKittyWarnOptionsCatRadio2:SetChecked(0)
	BadKittyWarnOptionsCatRadio3:SetChecked(0)
	BadKittyWarnOptionsCatRadio4:SetChecked(0)
	BadKittyWarnOptionsCatRadio5:SetChecked(0)
	BadKittyWarnOptionsCatRadio6:SetChecked(0)
	BadKittyWarnOptionsCatRadio7:SetChecked(0)
	BadKittyWarnOptionsCatRadio8:SetChecked(0)
	BadKittyWarnOptionsCatRadio9:SetChecked(0)
	BadKittyWarnOptionsCatRadio10:SetChecked(0)
	BadKittyWarnOptionsCatRadio11:SetChecked(0)
	BadKittyWarnOptionsCatRadio12:SetChecked(0)
	BadKittyWarnOptionsCatRadio13:SetChecked(0)
end

function BadKitty_WBearRadioOff()
	BadKittyWarnOptionsBearRadio1:SetChecked(0)
	BadKittyWarnOptionsBearRadio2:SetChecked(0)
	BadKittyWarnOptionsBearRadio3:SetChecked(0)
	BadKittyWarnOptionsBearRadio4:SetChecked(0)
	BadKittyWarnOptionsBearRadio5:SetChecked(0)
	BadKittyWarnOptionsBearRadio6:SetChecked(0)
end

function BadKitty_WOCatRadioOff()
	--[[BadKittyWarnOptionsCatSquare:SetChecked(0)
	BadKittyWarnOptionsCatHBox:SetChecked(0)
	BadKittyWarnOptionsCatVBox:SetChecked(0)
	BadKittyWarnOptionsCatHLine:SetChecked(0)
	BadKittyWarnOptionsCatVLine:SetChecked(0)]]
end

function BadKitty_WOBearRadioOff()
	--[[BadKittyWarnOptionsBearHBox:SetChecked(0)
	BadKittyWarnOptionsBearVBox:SetChecked(0)
	BadKittyWarnOptionsBearHLine:SetChecked(0)
	BadKittyWarnOptionsBearVLine:SetChecked(0)]]
end

function BadKitty_SetColor()
	local R,G,B = ColorPickerFrame:GetColorRGB()
	--BadKitty_Output(strsub(BadKittyColorTempFrame,21))
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[1] = R
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[2] = G
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[3] = B
	BadKitty_Colorize()
end 

function BadKitty_CancelColor(prevvals)
	local R,G,B = unpack(prevvals)
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[1] = R
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[2] = G
	getglobal("BadKitty"..strsub(BadKittyColorTempFrame,21).."Colors")[3] = B
end 

function BadKitty_SetTextColor()
	local R,G,B = ColorPickerFrame:GetColorRGB()
	BadKittyTextColor[1] = R
	BadKittyTextColor[2] = G
	BadKittyTextColor[3] = B
	BadKitty_Colorize()
end 

function BadKitty_CancelTextColor(prevvals)
	local R,G,B = unpack(prevvals)
	BadKittyTextColor[1] = R
	BadKittyTextColor[2] = G
	BadKittyTextColor[3] = B
end 

function BadKitty_SetWarningTextColor()
	local R,G,B = ColorPickerFrame:GetColorRGB()
	BadKittyWarningTextColor[1] = R
	BadKittyWarningTextColor[2] = G
	BadKittyWarningTextColor[3] = B
	BadKitty_Colorize()
end 

function BadKitty_CancelWarningTextColor(prevvals)
	local R,G,B = unpack(prevvals)
	BadKittyWarningTextColor[1] = R
	BadKittyWarningTextColor[2] = G
	BadKittyWarningTextColor[3] = B
end 

function BadKitty_Colorize()
	if not BadKittyCatSR then return end
	BadKittyCatSR:SetStatusBarColor(BadKittyCatSRColors[1],BadKittyCatSRColors[2],BadKittyCatSRColors[3])
	BadKittyCatMangle:SetStatusBarColor(BadKittyCatMangleColors[1],BadKittyCatMangleColors[2],BadKittyCatMangleColors[3])
	BadKittyCatRake:SetStatusBarColor(BadKittyCatRakeColors[1],BadKittyCatRakeColors[2],BadKittyCatRakeColors[3])
	BadKittyCatRip:SetStatusBarColor(BadKittyCatRipColors[1],BadKittyCatRipColors[2],BadKittyCatRipColors[3])
	BadKittyCatFFF:SetStatusBarColor(BadKittyCatFFFColors[1],BadKittyCatFFFColors[2],BadKittyCatFFFColors[3])
	BadKittyCatTF:SetStatusBarColor(BadKittyCatTFColors[1],BadKittyCatTFColors[2],BadKittyCatTFColors[3])
	BadKittyCatZerk:SetStatusBarColor(BadKittyCatZerkColors[1],BadKittyCatZerkColors[2],BadKittyCatZerkColors[3])
	BadKittyCatEnergy:SetStatusBarColor(BadKittyCatEnergyColors[1],BadKittyCatEnergyColors[2],BadKittyCatEnergyColors[3])
	BadKittyCatPS:SetStatusBarColor(BadKittyCatPSColors[1],BadKittyCatPSColors[2],BadKittyCatPSColors[3])
	BadKittyCatTrink1:SetStatusBarColor(BadKittyCatTrink1Colors[1],BadKittyCatTrink1Colors[2],BadKittyCatTrink1Colors[3])
	BadKittyCatTrink2:SetStatusBarColor(BadKittyCatTrink2Colors[1],BadKittyCatTrink2Colors[2],BadKittyCatTrink2Colors[3])
	BadKittyCatIdol:SetStatusBarColor(BadKittyCatIdolColors[1],BadKittyCatIdolColors[2],BadKittyCatIdolColors[3])
	BadKittyCatEnchant:SetStatusBarColor(BadKittyCatEnchantColors[1],BadKittyCatEnchantColors[2],BadKittyCatEnchantColors[3])
	BadKittyBearDemo:SetStatusBarColor(BadKittyBearDemoColors[1],BadKittyBearDemoColors[2],BadKittyBearDemoColors[3])
	BadKittyBearLac:SetStatusBarColor(BadKittyBearLacColors[1],BadKittyBearLacColors[2],BadKittyBearLacColors[3])
	BadKittyBearMangle:SetStatusBarColor(BadKittyBearMangleColors[1],BadKittyBearMangleColors[2],BadKittyBearMangleColors[3])
	BadKittyBearFFF:SetStatusBarColor(BadKittyBearFFFColors[1],BadKittyBearFFFColors[2],BadKittyBearFFFColors[3])
	BadKittyBearBS:SetStatusBarColor(BadKittyBearBSColors[1],BadKittyBearBSColors[2],BadKittyBearBSColors[3])
	BadKittyBearZerk:SetStatusBarColor(BadKittyBearZerkColors[1],BadKittyBearZerkColors[2],BadKittyBearZerkColors[3])
	BadKittyBearRage:SetStatusBarColor(BadKittyBearRageColors[1],BadKittyBearRageColors[2],BadKittyBearRageColors[3])
	
	BadKittyColorOptionsCatSRTexture:SetTexture(BadKittyCatSRColors[1],BadKittyCatSRColors[2],BadKittyCatSRColors[3])
	BadKittyColorOptionsCatMangleTexture:SetTexture(BadKittyCatMangleColors[1],BadKittyCatMangleColors[2],BadKittyCatMangleColors[3])
	BadKittyColorOptionsCatRakeTexture:SetTexture(BadKittyCatRakeColors[1],BadKittyCatRakeColors[2],BadKittyCatRakeColors[3])
	BadKittyColorOptionsCatRipTexture:SetTexture(BadKittyCatRipColors[1],BadKittyCatRipColors[2],BadKittyCatRipColors[3])
	BadKittyColorOptionsCatFFFTexture:SetTexture(BadKittyCatFFFColors[1],BadKittyCatFFFColors[2],BadKittyCatFFFColors[3])
	BadKittyColorOptionsCatTFTexture:SetTexture(BadKittyCatTFColors[1],BadKittyCatTFColors[2],BadKittyCatTFColors[3])
	BadKittyColorOptionsCatZerkTexture:SetTexture(BadKittyCatZerkColors[1],BadKittyCatZerkColors[2],BadKittyCatZerkColors[3])
	BadKittyColorOptionsCatEnergyTexture:SetTexture(BadKittyCatEnergyColors[1],BadKittyCatEnergyColors[2],BadKittyCatEnergyColors[3])
	BadKittyColorOptionsCatPSTexture:SetTexture(BadKittyCatPSColors[1],BadKittyCatPSColors[2],BadKittyCatPSColors[3])
	BadKittyColorOptionsBearDemoTexture:SetTexture(BadKittyBearDemoColors[1],BadKittyBearDemoColors[2],BadKittyBearDemoColors[3])
	BadKittyColorOptionsBearLacTexture:SetTexture(BadKittyBearLacColors[1],BadKittyBearLacColors[2],BadKittyBearLacColors[3])
	BadKittyColorOptionsBearMangleTexture:SetTexture(BadKittyBearMangleColors[1],BadKittyBearMangleColors[2],BadKittyBearMangleColors[3])
	BadKittyColorOptionsBearFFFTexture:SetTexture(BadKittyBearFFFColors[1],BadKittyBearFFFColors[2],BadKittyBearFFFColors[3])
	BadKittyColorOptionsBearBSTexture:SetTexture(BadKittyBearBSColors[1],BadKittyBearBSColors[2],BadKittyBearBSColors[3])
	BadKittyColorOptionsBearZerkTexture:SetTexture(BadKittyBearZerkColors[1],BadKittyBearZerkColors[2],BadKittyBearZerkColors[3])
	BadKittyColorOptionsBearRageTexture:SetTexture(BadKittyBearRageColors[1],BadKittyBearRageColors[2],BadKittyBearRageColors[3])
	
	BadKittyCatSRSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatMangleSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatRakeSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatRipSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatFFFSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatTFSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatZerkSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatEnergySecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatPSSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearDemoSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearLacSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearMangleSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearFFFSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearBSSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearZerkSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearRageSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatShredSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatCPSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	
	BadKittyCatSRText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatMangleText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatRakeText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatRipText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatFFFText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatTFText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatZerkText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatEnergyText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatPSText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearDemoText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearLacText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearMangleText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearFFFText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearBSText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearZerkText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyBearRageText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatShredText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyCatCPText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	
	BadKittyOptionsTextColorTexture:SetTexture(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyColorOptionsExampleBarText:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyColorOptionsExampleBarSecs:SetTextColor(BadKittyTextColor[1],BadKittyTextColor[2],BadKittyTextColor[3])
	BadKittyColorOptionsExampleBar:SetStatusBarColor(BadKittyCatSRColors[1],BadKittyCatSRColors[2],BadKittyCatSRColors[3])
	
	BadKittyOptionsWarningTextColorTexture:SetTexture(BadKittyWarningTextColor[1],BadKittyWarningTextColor[2],BadKittyWarningTextColor[3])
	local _G = getfenv()
	for i=1,13,1 do
		_G["BKW"..i.."Text"]:SetTextColor(BadKittyWarningTextColor[1],BadKittyWarningTextColor[2],BadKittyWarningTextColor[3])
	end
	for i=1,6,1 do
		_G["BKWBear"..i.."Text"]:SetTextColor(BadKittyWarningTextColor[1],BadKittyWarningTextColor[2],BadKittyWarningTextColor[3])
	end
end 

function BadKitty_BKWModToggle()
	if BadKittyOptionsBKWMod:GetChecked() then
		BadKittySaves[17] = 1
	else
		BadKittySaves[17] = 0
		BadKittyWarning_Clear()
	end
end

function BadKitty_ColorBlind()
	if BadKittyOptionsColorBlind:GetChecked() then
		BadKittySaves[18] = 0
	else
		BadKittySaves[18] = 1
	end
end

function BadKitty_Zerk()
	if BadKittyOptionsZerkDuration:GetChecked()==0 then
		BadKittyCatZerkText:SetText("Berserk")
		BadKittyBearZerkText:SetText("Berserk")
	end
end

function BadKitty_TextureMenuMake()
	BadKittyOptionsTextureMenu = CreateFrame("Frame","BadKittyOptionsTextureMenu",BadKittyColorOptions,"UIDropDownMenuTemplate")
	BadKittyOptionsTextureMenu:SetPoint("TOPLEFT",BadKittyColorOptions,20,-388)
	UIDropDownMenu_Initialize(BadKittyOptionsTextureMenu,BadKitty_TextureMenuInit)
	UIDropDownMenu_SetWidth(BadKittyOptionsTextureMenu,150)
end

function BadKitty_TextureMenuInit()
	level = 1
	local info = UIDropDownMenu_CreateInfo();
	info.text = "Blizzard"; --the text of the menu item
	info.value = [[Interface\TargetingFrame\UI-StatusBar]]; -- the value of the menu item. This can be a string also.
	info.func = function() BadKitty_TextureClick() end; --sets the function to execute when this item is clicked
	info.owner = this:GetParent(); --binds the drop down menu as the parent of the menu item. This is very important for dynamic drop down menues.
	info.checked = nil; --initially set the menu item to being unchecked with a yellow tick
	info.icon = [[Interface\TargetingFrame\UI-StatusBar]]; --we can use this to set an icon for the drop down menu item to accompany the text
	UIDropDownMenu_AddButton(info, level); --Adds the new button to the drop down menu specified in the UIDropDownMenu_Initialise function. In this case, it's MyDropDownMenu
	
	info.text = "Aluminium";
	info.value = [[Interface\Addons\BadKitty\bars\Aluminium]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Aluminium]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Armory";
	info.value = [[Interface\Addons\BadKitty\bars\Armory]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Armory]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "BantoBar";
	info.value = [[Interface\Addons\BadKitty\bars\BantoBar.tga]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\BantoBar]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Glaze2";
	info.value = [[Interface\Addons\BadKitty\bars\Glaze2]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Glaze2]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Gloss";
	info.value = [[Interface\Addons\BadKitty\bars\Gloss]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Gloss]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Graphite";
	info.value = [[Interface\Addons\BadKitty\bars\Graphite]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Graphite]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Grid";
	info.value = [[Interface\Addons\BadKitty\bars\Grid]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Grid]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Healbot";
	info.value = [[Interface\Addons\BadKitty\bars\Healbot]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Healbot]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "LiteStep";
	info.value = [[Interface\Addons\BadKitty\bars\LiteStep]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\LiteStep]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Minimalist";
	info.value = [[Interface\Addons\BadKitty\bars\Minimalist]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Minimalist]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Otravi";
	info.value = [[Interface\Addons\BadKitty\bars\Otravi]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Otravi]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Outline";
	info.value = [[Interface\Addons\BadKitty\bars\Outline]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Outline]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Perl";
	info.value = [[Interface\Addons\BadKitty\bars\Perl]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Perl]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Round";
	info.value = [[Interface\Addons\BadKitty\bars\Round]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Round]];
	UIDropDownMenu_AddButton(info, level);
	
	info.text = "Smooth";
	info.value = [[Interface\Addons\BadKitty\bars\Smooth]];
	info.func = function() BadKitty_TextureClick() end;
	info.owner = this:GetParent();
	info.checked = nil;
	info.icon = [[Interface\Addons\BadKitty\bars\Smooth]];
	UIDropDownMenu_AddButton(info, level);
	
end

function BadKitty_TextureClick()
	UIDropDownMenu_SetSelectedValue(BadKittyOptionsTextureMenu, this.value)
	BadKittyBarTexture = UIDropDownMenu_GetSelectedValue(BadKittyOptionsTextureMenu)
	BadKitty_Setup()
end