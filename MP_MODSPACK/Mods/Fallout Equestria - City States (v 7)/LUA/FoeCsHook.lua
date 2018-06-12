
function UpdateCityStateScreen(popup)

	if( (popup.Type ~= ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_DIPLO) and 
		(popup.Type ~= ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING) ) then
		return
	end

	local lookUpTitle = "/InGame/CityStateDiploPopup/TitleLabel"
	local lookUpDescription = "/InGame/CityStateDiploPopup/DescriptionLabel"
	local lookUpBackgroundImage = "/InGame/CityStateDiploPopup/BackgroundImage"

	local cityStateSplash = "foeplaceholder.dds"
	local cityStateSplashMilitary = "foecitystatebackgroundmilitary.dds"
	local cityStateSplashCultured = "foeplaceholder.dds"
	local cityStateSplashReligious = "foecitystatebackgroundreligious.dds"
	local cityStateSplashMercantile = "foecitystatebackgroundmercantile.dds"
	local cityStateSplashMaritime = "foeplaceholder.dds"

	local isFoeCityState = true

	if( popup.Type == ButtonPopupTypes.BUTTONPOPUP_CITY_STATE_GREETING ) then
		lookUpTitle = "/InGame/CityStateGreetingPopup/TitleLabel"
		lookUpDescription = "/InGame/CityStateGreetingPopup/DescriptionLabel"
		lookUpBackgroundImage = "/InGame/CityStateGreetingPopup/BackgroundImage"
	end

	local strTitle = ContextPtr:LookUpControl(lookUpTitle):GetText()

	--ContextPtr:LookUpControl(lookUpBackgroundImage):UnloadTexture()

	if strTitle == "ARBU" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_ARBU_S")
		cityStateSplash = cityStateSplashMaritime
	elseif strTitle == "FILLYDELPHIA" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_FILLYDELPHIA_S")
		cityStateSplash = cityStateSplashMilitary
	elseif strTitle == "BUCKLYN CROSS" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_BUCKLYN_S")
		cityStateSplash = cityStateSplashMaritime
	elseif strTitle == "CHAPEL" then
		strShortDescription = Locale.ConvertTextKey("TXT_KEY_CIV5_CHAPEL_S")
		cityStateSplash = cityStateSplashReligious
	elseif strTitle == "NEW APPLELOOSA" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_APPLELOOSA_S")
		cityStateSplash = cityStateSplashMaritime
	elseif strTitle == "FRIENDSHIP CITY" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_FRIENDSHIP_S")
		cityStateSplash = cityStateSplashMercantile
	elseif strTitle == "GLYPHMARK" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_GLYPHMARK_S")
		cityStateSplash = cityStateSplashCultured
	elseif strTitle == "TENPONY TOWER" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_TENPONY_S")
		cityStateSplash = cityStateSplashCultured
	elseif strTitle == "STALLIONGRAD" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_STALLIONGRAD_S")
		cityStateSplash = cityStateSplashMilitary
	elseif strTitle == "JUNCTION R-7" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_JUNCTION_S")
		cityStateSplash = cityStateSplashMilitary
	elseif strTitle == "STABLE CITY" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_STABLECITY_S")
		cityStateSplash = cityStateSplashMercantile
	elseif strTitle == "THE GLOW" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_GLOW_S")
		cityStateSplash = cityStateSplashMercantile
	elseif strTitle == "VERGE" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_VERGE_S")
		cityStateSplash = cityStateSplashMercantile
	elseif strTitle == "FORUM" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_FORUM_S")
		cityStateSplash = cityStateSplashMilitary
	elseif strTitle == "COLTS WELL" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_WELL_S")
		cityStateSplash = cityStateSplashMercantile
	elseif strTitle == "NEW PEGASUS" then
		strShortDescription =  Locale.ConvertTextKey("TXT_KEY_CIV5_PEGASUS_S")
		cityStateSplash = cityStateSplashCultured
	else 
		isFoeCityState = false
	end

	if (isFoeCityState == true) then
		ContextPtr:LookUpControl(lookUpDescription):SetText(strShortDescription)
		ContextPtr:LookUpControl(lookUpBackgroundImage):SetTextureAndResize(cityStateSplash)
	end

end

Events.SerialEventGameMessagePopup.Add(UpdateCityStateScreen)
