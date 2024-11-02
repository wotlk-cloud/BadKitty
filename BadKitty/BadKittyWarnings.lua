--Note:  	This entire file is the work of Ukrudt (agamaggan-eu).  The concept and code
--			are his design.  As of WoW 3.2 I have merged his addon (formerly BadKittyWarnings)
--			with BadKitty, at his offering.


--Functions

function BadKittyWarning_Clear()
BadKittyFrame_Background:SetTexture(0.1,0.1,0.1,0.5)
BadKittyBear_Background:SetTexture(0.1,0.1,0.1,0.5)
end

function BadKittyWarning_Errormessage()
	local behindMessage ="You must be behind your target."
	local wrongWayMessage = "You are facing the wrong way!"
	local wrongWayMessage2 = "Target needs to be in front of you."
	if BadKittySaves[17]==0 then return end
	if UnitAffectingCombat("player") then
	  if UnitIsDeadOrGhost("target") or not UnitExists("target") or not UnitIsVisible("target") then
	       BadKittyFrame_Background:SetTexture(0.5,0.5,0.5,1)
	       BadKittyBear_Background:SetTexture(0.5,0.5,0.5,1)
	  elseif IsSpellInRange("Claw", "target")==0  and UnitIsEnemy("player", "target") then
	     BadKittyFrame_Background:SetTexture(1,0,0,1)
	     BadKittyBear_Background:SetTexture(1,0,0,1)
	  elseif not UnitIsEnemy("player", "target") then
	     BadKittyFrame_Background:SetTexture(0,0,1,1)
	     BadKittyBear_Background:SetTexture(0,0,1,1)
	  elseif arg1 == behindMessage or arg1 ==wrongWayMessage or arg1 ==wrongWayMessage2 then 
	    BadKittyFrame_Background:SetTexture(1,1,0,1)  
	    BadKittyBear_Background:SetTexture(1,1,0,1) 
	  end
	end
end

--Eventhandling

local localizedClass, englishClass = UnitClass("player");

if englishClass == "DRUID" then
 
 local frame, events = CreateFrame("Frame"), {};
 
 function events:UNIT_SPELLCAST_SUCCEEDED(...)
 if arg1=="player" then
   BadKittyWarning_Clear()
 end 
 end


 function events:PLAYER_REGEN_ENABLED(...)
 if BadKittySaves[17] then
  BadKittyWarning_Clear()
 end
 end

 function events:PLAYER_TARGET_CHANGED(...)
  BadKittyWarning_Clear()
 end

 
 function events:UI_ERROR_MESSAGE(...)
  BadKittyWarning_Errormessage()
 end

 
 frame:SetScript("OnEvent", function(self, event, ...)
	 if BadKittySaves[17] then
		events[event](self, ...); -- call one of the functions above
	 end
 end);
 for k, v in pairs(events) do
		frame:RegisterEvent(k); -- Register all events for which handlers have been defined
 end
end




