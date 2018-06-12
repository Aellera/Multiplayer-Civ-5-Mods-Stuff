-- voteArranger
-- Author: Harald
-- DateCreated: 1/7/2013 6:10:21 PM
--------------------------------------------------------------
print("-----------------------------------------------")
print("---Initializing Changeling Mod Vote Arranger---")
print("-----------------------------------------------")

function congressEra()
print("--Determining World Congress era")
--Determine highest era among players
print("--Determining highest era among players")
local iHighestEra = 0
for iLoop = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	pPlayer = Players[iLoop]
	local iEra = 0
	if pPlayer:IsAlive() then
		iEra = pPlayer:GetCurrentEra()
		if iEra > iHighestEra then iHighestEra = iEra end
	end
end
print("--Highest era:",iHighestEra)

--Determine how many players are of the highest era
print("--Determining number of top-era players")
local iLivingPlayers = 0
local iTopPlayers = 0
for iLoop = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
	pPlayer = Players[iLoop]
	if pPlayer:IsAlive() then
		iLivingPlayers = iLivingPlayers + 1
		iEra = pPlayer:GetCurrentEra()
		if iEra == iHighestEra then iTopPlayers = iTopPlayers + 1 end
	end
end
print("--Living players:",iLivingPlayers)
print("--Top-era players:",iTopPlayers)

--If at least half are, then the congress era is that era; otherwise it is one less
local iAnswer = 0
if iTopPlayers >= iLivingPlayers / 2 then iAnswer = iHighestEra
else iAnswer = iHighestEra - 1 end
print("--World Congress era:",iAnswer)
return iAnswer
end

function voteArranger( player )

local pPlayer = Players[player]
local iVotes = 0
if pPlayer:IsAlive() then
print("Turn started for ",pPlayer:GetCivilizationShortDescription())
	if pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_CHANGELINGS"] then
	print("Calling World Congress era function.")
	local iCongressEra = congressEra()
	print("Inspecting cities.")
	for pCity in pPlayer:Cities() do
		if pCity:IsOriginalCapital() and (not Players[pCity:GetOriginalOwner()]:IsAlive()) then
			print("--Found a conquered capital of a dead player.")
			--
			iVotes = 0
			if not Players[pCity:GetOriginalOwner()]:IsMinorCiv() then iVotes = iVotes + 1 end	--1/0 in ren (era 3)
			if iCongressEra > 3 then iVotes = iVotes + 1 end									--2/1 in ind (era 4)
			if iCongressEra > 4 then iVotes = iVotes + 1 end									--3/2 in mod (era 5)	
			if iCongressEra > 5 and not Players[pCity:GetOriginalOwner()]:IsMinorCiv() then iVotes = iVotes + 1 end
																								--4/2 after (era 6+) 
			--
			print("--Appropriate number of bonus votes:",iVotes)
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CHANGELING_DIPLOMATIC_OFFICE"],iVotes)
		elseif pCity:IsOriginalCapital() then
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CHANGELING_DIPLOMATIC_OFFICE"],0)
		end
	end
end end
end

function voteRemover( hexPos, player, cityID, newPlayer )
local pPlot = Map.GetPlot(ToGridFromHex(hexPos.x,hexPos.y))
local pCity = pPlot:GetPlotCity()
print(pCity:GetName(),"has changed owners.")
pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_CHANGELING_DIPLOMATIC_OFFICE"],0)
print("Possible extra votes removed.")
end

Events.SerialEventCityCaptured.Add(voteRemover)
GameEvents.PlayerDoTurn.Add(voteArranger)