/*
    Yokus Island Express
    Version: 0.0.1
    Author: WarsheepGER
    Compatible Versions:
        Steam (PC) || W10 (functional) || W7 (untested, might not work)
    
    
    [[DESCRIPTION]]
	any% true: noisemaker, Keydor, Titelscreen,Bossfight, end
	any% no-oob: noisemaker, kickback, slugvac, summons, leash, hook, bucket, filled_bucket, seedpod, guano, (fight boon), spring_key, divefish, (fight spina), (fight sal), nimskey, kazoo, end
	any% nims quest: noisemaker, kickback, slugvac, summons, leash, hook, bucket, filled_bucket, seedpod, guano, (fight boon), spring_key, (fight spina), (fight sal), nimskey, kazoo, end
	any% all bosses: noisemaker, kickback, slugvac, summons, leash, hook, bucket, filled_bucket, seedpod, guano, (fight boon), spring_key, (fight spina), (fight sal), end
	100%: noisemaker, kickback, slugvac, mailbag, divefish, idol1, double_fruit, summons, leash, hook, bucket, filled_bucket, seedpod, guano, (fight boon), spore1, spore2, green_package, idol3, idol2, greenkey, bluekey, creepy bauble, tracker_cave, (fight sal), spore3, blue package, sweet bauble, idol4, dive_speed, violet package, spring_key, (fight spina), tracker_spring, spore4, nimskey, great postman badge, kazoo, end, kickback_ivory, spore5, tracker_ivory, tracker_woods, skvader_2, slug_upgrade, true end
	true end: noisemaker, kickback, slugvac, summons, mailbag, leash, hook, bucket, filled_bucket, seedpod, guano, (fight boon), spring_key, divefish, (fight spina), bluekey, creepy bauble, (fight sal), sweet bauble, nimskey, kazoo, end, true end
	wallet% ist einfach: noisemaker, wallet, wallet, slugvac, summons, mailbag, leash, hook, wallet wallet, divefish, creepy bauble, wallet, wallet, sweet bauble, wallet, violet package, wallet, wallet, 600fruits
    
    [[CREDITS]]
*/
state("Yoku") 
    {
        // Values for splits
        string42 LevelName : "Yoku.exe", 0x0054D620, 0x68, 0x130, 0x260, 0x88, 0x1F0; //memscan_level\nXXXXXXXX
        string24 GameTime : "Yoku.exe", 0x0054D620, 0x68, 0x60, 0x230, 0x28, 0xF0; //memscan_time\nXX:XX:XX.xx
        string47 GameItem : "Yoku.exe", 0x0054C2A8, 0x68, 0x130, 0x1B8, 0x28, 0x3F0; //memscan_last_item_added\nxxx:x
        string51 GameState : "Yoku.exe", 0x0054C2A8, 0x68, 0x130, 0x260, 0x88, 0x2F0; //memscan_last_state\nxxx:x
    }
	
/*	
    startup{} runs when the script gets loaded
*/
startup {
	
	settings.Add("speedrun", true,"Version 0.1. By WarsheepGER.");
	settings.SetToolTip("speedrun", "Check this Option if you want to used the Autosplitter");
	
	settings.CurrentDefaultParent = "speedrun";
		settings.Add("mainsplits", true, "Main Splits"); settings.SetToolTip("mainsplits", "Check only 1 of this Option to run with Default Splits");
		settings.Add("costumesplits", false, "Costume Splits");	settings.SetToolTip("costumesplits", "Check this Option to run with Costume Splits");
	
	settings.CurrentDefaultParent = "mainsplits";
		settings.Add("100%", false, "100%"); settings.SetToolTip("100%", "Check only this Option if you want to run 100%");
		settings.Add("trueend", false, "True End");	settings.SetToolTip("trueend", "Check only this Option if you want to run True End");
		settings.Add("any%", true, "Any%");	settings.SetToolTip("any%", "Check only this Option if you want to run Any%");
		settings.Add("misc", false, "Misc."); settings.SetToolTip("misc", "Check only this Option if you want to run Misc.");
	
	settings.CurrentDefaultParent = "any%";
		settings.Add("any%true", true, "True"); settings.SetToolTip("any%true", "Check only this Option if you want to run Any% True");
		settings.Add("any%nooob", false, "No-OOB"); settings.SetToolTip("any%nooob", "Check only this Option if you want to run Any% No-OOB");
		settings.Add("any%nims", false, "Nims Quest");	settings.SetToolTip("any%nims", "Check only this Option if you want to run Any% Nims Quest");
		settings.Add("any%boss", false, "All Bosses");	settings.SetToolTip("any%boss", "Check only this Option if you want to run Any% All Bosses");
	
	settings.CurrentDefaultParent = "misc";
		settings.Add("fruit%", false, "Fruits%");	settings.SetToolTip("fruit%", "Check only this Option if you want to run Fruits%");
		settings.Add("wallet%", false, "Wallet%"); settings.SetToolTip("wallet%", "Check only this Option if you want to run Wallet%");
		settings.Add("double%", false, "Double%"); settings.SetToolTip("double%", "Check only this Option if you want to run Double%");
		settings.Add("dungball%", false, "Dungball%"); settings.SetToolTip("dungball%", "Check only this Option if you want to run Dungball%");
		
	settings.CurrentDefaultParent = "fruit%";
		settings.Add("fruit100", false, "Fruits 100"); settings.SetToolTip("fruit100", "Check only this Option if you want to run Fruits 100");
		settings.Add("fruit600", false, "Fruits 600"); settings.SetToolTip("fruit600", "Check only this Option if you want to run Fruits 600");
	
	settings.CurrentDefaultParent = "costumesplits";
		settings.Add("levelsplits", false, "Levels"); settings.SetToolTip("levelsplits", "Check this Option if you want to skip on Levels");
		settings.Add("itemsplits", false, "Items"); settings.SetToolTip("itemsplits", "Check this Option if you want to skip on Items");
		settings.Add("othersplits", false, "Others"); settings.SetToolTip("othersplits", "Check this Option if you want to skip on Others");
	
	settings.CurrentDefaultParent = "levelsplits";
		settings.Add("cave", false, "Cave Levels");
		settings.Add("hub", false, "Hub Levels");
		settings.Add("intro", false, "Intro Levels");
		settings.Add("island", false, "Island Levels");
		settings.Add("jungle", false, "Jungle Levels");
		settings.Add("peak", false, "Peak Levels");
		settings.Add("spring", false, "Spring Levels");
	
	settings.CurrentDefaultParent = "itemsplits";
		settings.Add("mainitems", false, "Main Items");
		settings.Add("sidequest", false, "Side Quest");
		settings.Add("othersitems", false, "Others Items");
		
	settings.CurrentDefaultParent = "mainitems";
		settings.Add("mains", false, "Main Items");
		settings.Add("abilities", false, "Abilities");
		settings.Add("keys", false, "Keys");
		settings.Add("beanstalk", false, "Beanstalk");
		
	settings.CurrentDefaultParent = "sidequest";
		settings.Add("willos", false, "Willo Sidequest");
		settings.Add("rinris", false, "Rinri Sidequest");
		settings.Add("packages", false, "Packages");
		settings.Add("othersside", false, "Others Items");
	
	settings.CurrentDefaultParent = "othersitems";
		settings.Add("tracker", false, "Tracker");
		settings.Add("skins", false, "Skins");
		settings.Add("others", false, "Others Items");
//Levels
	settings.CurrentDefaultParent = "cave"; settings.Add("cave_abyssal_access", false, "Door Friends Bottom Left [C0]"); settings.Add("cave_beach_bottom", false, "Ocean Right [C1]"); settings.Add("cave_beaver_blockade", false, "Door Friends [C2]"); settings.Add("cave_boss", false, "Screetch [C3]"); settings.Add("cave_clammy_cenote", false, "The Dolphin [C4]"); settings.Add("cave_east_bay_shore", false, "Beach Right [C5]"); settings.Add("cave_temple_terror_entrance", false, "Temple Trials Entrance [C6]"); settings.Add("cave_temple_terror_lower", false, "Temple Trials [C7]"); settings.Add("cave_temple_terror_treasury", false, "Temple Treasury [C8]"); settings.Add("cave_temple_terror_upper", false, "God Egg [C9]"); settings.Add("cave_winding_waterway", false, "Pitch, Stupid Wickerling [CA]"); 
	settings.CurrentDefaultParent = "hub"; settings.Add("hub_bowel_bumping_left", false, "Endboss [H0] [Any%True]"); settings.Add("hub_cliffside_creek", false, "Fleek Hidden Diva [H1]"); settings.Add("hub_festival", false, "Mokumas Pit [H2]"); settings.Add("hub_festival_sky", false, "Ivory Beeline [H3]"); settings.Add("hub_festival_upper", false, "Ivory Beeline and Kazzo [H4]"); settings.Add("hub_hermits_home", false, "Sin [H5]"); settings.Add("hub_island_express", false, "Top of Tall Totem Tower [H6] [Any%True]"); settings.Add("hub_left_lemur_lane", false, "Sandros Bridge [H7]"); settings.Add("hub_left_lofty_logo", false, "Titel Screen [H8] [Any%True]"); settings.Add("hub_marrow_maze", false, "Endboss Maze [H9]"); settings.Add("hub_obtainium_outland", false, "Willos last Puzzlepiece [HA]"); settings.Add("hub_soaring_stone", false, "Woods Beeline [HB]"); settings.Add("hub_village", false, "Mokumana Village [HC]"); settings.Add("hub_white_cliff", false, "Dipperloaf [HD]"); 
	settings.CurrentDefaultParent = "intro"; settings.Add("intro_landing", false, "Startarea [I0]"); settings.Add("intro_landing_creepy_cavern", false, "Fosfor Skip [I1]"); settings.Add("intro_landing_left", false, "Beach Left [I2]"); settings.Add("intro_landing_right", false, "Sootlinghouse End of intro [I3]"); settings.Add("intro_landing_upper", false, "Noisemaker and Mushrooms [I4]"); settings.Add("intro_muddled_morass", false, "Fosfors Cave [I5]"); settings.Add("intro_secret", false, "Ocean Left  [I6]"); 
	settings.CurrentDefaultParent = "island"; settings.Add("island_ending_2", false, "True End [I7]");
	//name the rest of lvls with [X0]
	settings.CurrentDefaultParent = "jungle"; settings.Add("jungle_canyon_caper", false, "Kickback Introduction [J0]"); settings.Add("jungle_crammed_canopy", false, "Poleskip to Secret Cave [J1]"); settings.Add("jungle_misty_meadow", false, "Meadow slugvacuum shed (jungle_misty_meadow)"); settings.Add("jungle_mollusc_madness", false, "Slug Introduction (jungle_mollusc_madness)"); settings.Add("jungle_roots", false, "Juicery and introshoot (jungle_roots)"); settings.Add("jungle_secluded_climb", false, "Climb to Waterfallskvader (jungle_secluded_climb)"); settings.Add("jungle_slug_struggle", false, "Great Ape (jungle_slug_struggle)"); settings.Add("jungle_spikey_stockade", false, "Secret Cave (jungle_spikey_stockade)"); settings.Add("jungle_tall_tall_tower", false, "Tall Totem Tower (jungle_tall_tall_tower)"); settings.Add("jungle_willy", false, "Willo Queststart(jungle_willy)"); 
	settings.CurrentDefaultParent = "peak"; settings.Add("peak_aerial_ascent", false, "Obtainum-ore Station (peak_aerial_ascent"); settings.Add("peak_beanstalk_base", false, "Basecamp, Beanstalk (peak_beanstalk_base)"); settings.Add("peak_crooked_cliff", false, "Up the Beanstalk (peak_crooked_cliff)"); settings.Add("peak_crystal_crater", false, "Willo at Ivory Crater (peak_crystal_crater)"); settings.Add("peak_filthy_flat", false, "Lighthouse (peak_filthy_flat)"); settings.Add("peak_frostpine_forest", false, "Sootlingcaves (peak_frostpine_forest)"); settings.Add("peak_guano_grief", false, "Guano Tower (peak_guano_grief)"); settings.Add("peak_ice_cold_idol", false, "Water-Fountain (peak_ice_cold_idol)"); settings.Add("peak_obtainium_oracle", false, "Ojva, Trivial Facts (peak_obtainium_oracle)"); settings.Add("peak_sky", false, "Ivory Beeline (peak_sky)"); settings.Add("peak_spacemonk_mystery", false, "Spacemonk Spaceship (peak_spacemonk_mystery)"); settings.Add("peak_spider_fight", false, "Boon Boss, Spider Fight (peak_spider_fight)"); settings.Add("peak_underside", false, "Fountain/Town-skip (peak_underside)");
	settings.CurrentDefaultParent = "spring"; settings.Add("spring_bubbly_basin", false, "Hidden Sanctuary (spring_bubbly_basin)"); settings.Add("spring_cloudburst_cliffs", false, "Great Falls, Waterfall (spring_cloudburst_cliffs)"); settings.Add("spring_gangway_grotto", false, "Skullgang Hideout (spring_gangway_grotto)"); settings.Add("spring_hazy_heaven", false, "Marrow Hills Beeline (spring_hazy_heaven)"); settings.Add("spring_hidden_hotspring", false, "Blowing Head, Bling Bauble (spring_hidden_hotspring)"); settings.Add("spring_jailhouse_japes", false, "Way from Waterfall to Unders (spring_jailhouse_japes)"); settings.Add("spring_shoddy_shanty", false, "Church of the Space Monks (spring_shoddy_shanty)"); settings.Add("spring_sleek_slabs", false, "Marrow Hills Waterfall to Hideout (spring_sleek_slabs)"); settings.Add("spring_tiny_broad", false, "Steam Slug (spring_tiny_broad)"); settings.Add("spring_tortoise_tunnel", false, "Way to Unders and Up to Glowmoths (spring_tortoise_tunnel)"); settings.Add("spring_yokos_yam", false, "Spina Boss, Preasure Fight (spring_yokos_yam)");
//Items
	settings.CurrentDefaultParent = "mains"; settings.Add("collectible", false, "Wickerling"); settings.Add("wallet", false, "Wallet Upgrade"); settings.Add("summons", false, "Summons"); settings.Add("instrument_pile", false, "Ceremony Instruments"); settings.Add("sootling_leash", false, "Sootling Leash");
	settings.CurrentDefaultParent = "abilities"; settings.Add("abilities/map", false, "Island Map"); settings.Add("abilities/partyhorn", false, "Noismaker [Any%True]"); settings.Add("abilities/mailbag", false, "Mail bag"); settings.Add("abilities/speed", false, "Grand Postmaster Badge"); settings.Add("abilities/double_fruit", false, "Boon of Plenty!"); settings.Add("abilities/slug_vaccum", false, "Slug Vacuum"); settings.Add("abilities/slug_upgrade", false, "Slug Vacuum Deluxe"); settings.Add("abilities/kickback", false, "Kickback"); settings.Add("abilities/dive", false, "Dive Fish"); settings.Add("abilities/dive_speed", false, "Fast Dive Fish"); settings.Add("abilities/hook", false, "Sootling on a Leash");
	settings.CurrentDefaultParent = "keys"; settings.Add("bluekey", false, "Blue Key"); settings.Add("greenkey", false, "Green Key"); settings.Add("spring_key", false, "Key to the Underbelly"); settings.Add("nim_key", false, "Nim Key");
	settings.CurrentDefaultParent = "packages"; settings.Add("package_3", false, "Overdue Package for Quinbe"); settings.Add("package_2", false, "Overdue Package for Sin"); settings.Add("package_1", false, "Overdue Package for Treek");
	settings.CurrentDefaultParent = "beanstalk"; settings.Add("bucket_empty", false, "Empty Bucket"); settings.Add("bucket_full", false, "Bucket of Spring Water"); settings.Add("guano", false, "Guano"); settings.Add("seed_pod", false, "Seed Pod");
	settings.CurrentDefaultParent = "willos"; settings.Add("idol1", false, "Statue Chunk"); settings.Add("idol2", false, "Statue Piece 1"); settings.Add("idol3", false, "Statue Piece 2"); settings.Add("idol4", false, "Statue Piece 3"); settings.Add("nugget", false, "Smashed piece of Statue");
	settings.CurrentDefaultParent = "rinris"; settings.Add("spores_1", false, "Light Spores"); settings.Add("spores_2", false, "Dry Spores"); settings.Add("spores_3", false, "Damp Spores"); settings.Add("spores_4", false, "Annoyed Spores"); settings.Add("spores_5", false, "Frosty Spores");
	settings.CurrentDefaultParent = "skins"; settings.Add("skins/skin_1", false, "Bling Sprinkles"); settings.Add("skins/skin_2", false, "Creepy Sprinkles"); settings.Add("skins/skin_3", false, "Deadly Sprinkles"); settings.Add("skins/skin_4", false, "Crimson Sprinkles"); settings.Add("skins/skin_5", false, "Sweet Sprinkles");
	settings.CurrentDefaultParent = "tracker"; settings.Add("treasure_map", false, "Treasure Map"); settings.Add("tracker_caves", false, "Tracker: Crystal Deep"); settings.Add("tracker_jungle", false, "Tracker: Gorilla Woods"); settings.Add("tracker_peak", false, "Tracker: Ivory Peaks"); settings.Add("tracker_springs", false, "Tracker: MMarrow Hill"); settings.Add("tracker_scarabs", false, "Scarab Tracker");
	settings.CurrentDefaultParent = "others"; settings.Add("powerups/skvader_1", false, "Skvader"); settings.Add("powerups/skvader_2", false, "Fat Skvader"); settings.Add("sad_spider", false, "Sad Spiderling");
	settings.CurrentDefaultParent = "othersside"; settings.Add("traitor_spirit", false, "Traitor Spirit"); settings.Add("tadpole", false, "Tadpole"); settings.Add("dustbunny_dirty", false, "Sootling"); settings.Add("mushroom_2", false, "Juicy Cove Mushroom"); settings.Add("mushroom_3", false, "Poison Toadstool"); settings.Add("toolbox", false, "Toolbox"); settings.Add("postal_badge", false, "Old Postal Badge");
//State	
	settings.CurrentDefaultParent = "othersplits";
	settings.Add("door", false, "Doorroom open [Any%True]");
	settings.Add("kickbackdead", false, "Kickback Dead [Any%True]");
}
/*
    shutdown{} runs when the script gets unloaded (disabling autosplitter, closing LiveSplit, changing splits)
*/
shutdown {}

/*
	init{} runs if the given process has been found (can occur multiple times during a session; if you reopen the game as an example)
*/
	init {/*

	// This is how most other scripts I've looked at check for game version, so I'm just assuming this works fine
	if (modules.First().ModuleMemorySize == 0x72E8000)
		version = "Mania Plus V1.05.0713";
	else if (modules.First().ModuleMemorySize == 0xB56000)
		version = "Mania Plus V1.06.0503";
*/
}
/*
    exit{} runs when the attached process exits/dies
*/
exit {}
/*
    update{} always runs
    return false => prevents isLoading{}, gameTime{}, reset{}
*/
update {
	
	return true;
}
/*
    isLoading{} only runs when the timer's active (will be skipped if update{}'s returning false)
    return true => pauses the GameTime-Timer till the next tick
*/
isLoading {}
/*
    gameTime{} only runs when the timer's active (will be skipped if update{}'s returning false)
    return TimeSpan object => sets the GameTime-Timer to the passed time 
*/
gameTime {}

/*
    reset{} only runs when the timer's started or paused (will be skipped if update{}'s returning false)
    return true => triggers a reset
*/
reset {
	if (String.IsNullOrEmpty(current.GameTime)){
	}else{
    if(current.GameTime.Equals("memscan_time\n00:00:00.00"))
	{
        print("Autosplitter Resetted/Stopped");return true;
	}}
}

/*
    split{} only runs when the timer's running (and skipped if reset{} returns true)
    return true => triggers a split
*/
split {
//Level
	if (String.IsNullOrEmpty(current.LevelName)){}else{
	if(vars.cave_abyssal_access==1 && current.LevelName.Equals("memscan_level\ncave_abyssal_access")){ print("Autosplitt cave_abyssal_access");vars.cave_abyssal_access=0; return true;}
	if(vars.cave_beach_bottom==1 && current.LevelName.Equals("memscan_level\ncave_beach_bottom")){ print("Autosplitt cave_beach_bottom");vars.cave_beach_bottom=0;return true;}
	if(vars.cave_beaver_blockade==1 && current.LevelName.Equals("memscan_level\ncave_beaver_blockade")){ print("Autosplitt cave_beaver_blockade");vars.cave_beaver_blockade=0;return true;}
	if(vars.cave_boss==1 && current.LevelName.Equals("memscan_level\ncave_boss")){ print("Autosplitt cave_boss");vars.cave_boss=0;return true;}
	if(vars.cave_clammy_cenote==1 && current.LevelName.Equals("memscan_level\ncave_clammy_cenote")){ print("Autosplitt cave_clammy_cenote");vars.cave_clammy_cenote=0;return true;}
	if(vars.cave_east_bay_shore==1 && current.LevelName.Equals("memscan_level\ncave_east_bay_shore")){ print("Autosplitt cave_east_bay_shore");vars.cave_east_bay_shore=0;return true;}
	if(vars.cave_temple_terror_entrance==1 && current.LevelName.Equals("memscan_level\ncave_temple_terror_entrance")){ print("Autosplitt cave_temple_terror_entrance");vars.cave_temple_terror_entrance=0;return true;}
	if(vars.cave_temple_terror_lower==1 && current.LevelName.Equals("memscan_level\ncave_temple_terror_lower")){ print("Autosplitt cave_temple_terror_lower");vars.cave_temple_terror_lower=0;return true;}
	if(vars.cave_temple_terror_treasury==1 && current.LevelName.Equals("memscan_level\ncave_temple_terror_treasury")){ print("Autosplitt cave_temple_terror_treasury");vars.cave_temple_terror_treasury=0;return true;}
	if(vars.cave_temple_terror_upper==1 && current.LevelName.Equals("memscan_level\ncave_temple_terror_upper")){ print("Autosplitt cave_temple_terror_upper");vars.cave_temple_terror_upper=0;return true;}
	if(vars.cave_winding_waterway==1 && current.LevelName.Equals("memscan_level\ncave_winding_waterway")){ print("Autosplitt cave_winding_waterway");vars.cave_winding_waterway=0;return true;}		
	if(vars.hub_bowel_bumping_left==1 && current.LevelName.Equals("memscan_level\nhub_bowel_bumping_left")){ print("Autosplitt hub_bowel_bumping_left");vars.hub_bowel_bumping_left=0;return true;}			
	if(vars.hub_cliffside_creek==1 && current.LevelName.Equals("memscan_level\nhub_cliffside_creek")){ print("Autosplitt hub_cliffside_creek");vars.hub_cliffside_creek=0;return true;}
	if(vars.hub_festival==1 && current.LevelName.Equals("memscan_level\nhub_festival")){ print("Autosplitt hub_festival");vars.hub_festival=0;return true;}
	if(vars.hub_festival_sky==1 && current.LevelName.Equals("memscan_level\nhub_festival_sky")){ print("Autosplitt hub_festival_sky");vars.hub_festival_sky=0;return true;}
	if(vars.hub_festival_upper==1 && current.LevelName.Equals("memscan_level\nhub_festival_upper")){ print("Autosplitt hub_festival_upper");vars.hub_festival_upper=0;return true;}
	if(vars.hub_hermits_home==1 && current.LevelName.Equals("memscan_level\nhub_hermits_home")){ print("Autosplitt hub_hermits_home");vars.hub_hermits_home=0;return true;}
	if(vars.hub_island_express==1 && current.LevelName.Equals("memscan_level\nhub_island_express")){ print("Autosplitt hub_island_express");vars.hub_island_express=0;return true;}
	if(vars.hub_left_lemur_lane==1 && current.LevelName.Equals("memscan_level\nhub_left_lemur_lane")){ print("Autosplitt hub_left_lemur_lane");vars.hub_left_lemur_lane=0;return true;}
	if(vars.hub_left_lofty_logo==1 && current.LevelName.Equals("memscan_level\nhub_left_lofty_logo")){ print("Autosplitt hub_left_lofty_logo");vars.hub_left_lofty_logo=0;return true;}
	if(vars.hub_marrow_maze==1 && current.LevelName.Equals("memscan_level\nhub_marrow_maze")){ print("Autosplitt hub_marrow_maze");vars.hub_marrow_maze=0;return true;}
	if(vars.hub_obtainium_outland==1 && current.LevelName.Equals("memscan_level\nhub_obtainium_outland")){ print("Autosplitt hub_obtainium_outland");vars.hub_obtainium_outland=0;return true;}
	if(vars.hub_soaring_stone==1 && current.LevelName.Equals("memscan_level\nhub_soaring_stone")){ print("Autosplitt hub_soaring_stone");vars.hub_soaring_stone=0;return true;}
	if(vars.hub_village==1 && current.LevelName.Equals("memscan_level\nhub_village")){ print("Autosplitt hub_village");vars.hub_village=0;return true;}
	if(vars.hub_white_cliff==1 && current.LevelName.Equals("memscan_level\nhub_white_cliff")){ print("Autosplitt hub_white_cliff");vars.hub_white_cliff=0;return true;}	
	if(vars.intro_landing==1 && current.LevelName.Equals("memscan_level\nintro_landing")){ print("Autosplitt intro_landing");vars.intro_landing=0;return true;}
	if(vars.intro_landing_creepy_cavern==1 && current.LevelName.Equals("memscan_level\nintro_landing_creepy_cavern")){ print("Autosplitt intro_landing_creepy_cavern");vars.intro_landing_creepy_cavern=0;return true;}
	if(vars.intro_landing_left==1 && current.LevelName.Equals("memscan_level\nintro_landing_left")){ print("Autosplitt intro_landing_left");vars.intro_landing_left=0;return true;}
	if(vars.intro_landing_right==1 && current.LevelName.Equals("memscan_level\nintro_landing_right")){ print("Autosplitt intro_landing_right");vars.intro_landing_right=0;return true;}
	if(vars.intro_landing_upper==1 && current.LevelName.Equals("memscan_level\nintro_landing_upper")){ print("Autosplitt intro_landing_upper");vars.intro_landing_upper=0;return true;}
	if(vars.intro_muddled_morass==1 && current.LevelName.Equals("memscan_level\nintro_muddled_morass")){ print("Autosplitt intro_muddled_morass");vars.intro_muddled_morass=0;return true;}
	if(vars.intro_secret==1 && current.LevelName.Equals("memscan_level\nintro_secret")){ print("Autosplitt intro_secret");vars.intro_secret=0;return true;}				
	if(vars.island_ending_2==1 && current.LevelName.Equals("memscan_level\nisland_ending_2")){ print("Autosplitt island_ending_2");vars.island_ending_2=0;return true;}				
	if(vars.jungle_canyon_caper==1 && current.LevelName.Equals("memscan_level\njungle_canyon_caper")){ print("Autosplitt jungle_canyon_caper");vars.jungle_canyon_caper=0;return true;}
	if(vars.jungle_crammed_canopy==1 && current.LevelName.Equals("memscan_level\njungle_crammed_canopy")){ print("Autosplitt jungle_crammed_canopy");vars.jungle_crammed_canopy=0;return true;}
	if(vars.jungle_misty_meadow==1 && current.LevelName.Equals("memscan_level\njungle_misty_meadow")){ print("Autosplitt jungle_misty_meadow");vars.jungle_misty_meadow=0;return true;}
	if(vars.jungle_mollusc_madness==1 && current.LevelName.Equals("memscan_level\njungle_mollusc_madness")){ print("Autosplitt jungle_mollusc_madness");vars.jungle_mollusc_madness=0;return true;}
	if(vars.jungle_roots==1 && current.LevelName.Equals("memscan_level\njungle_roots")){ print("Autosplitt jungle_roots");vars.jungle_roots=0;return true;}
	if(vars.jungle_secluded_climb==1 && current.LevelName.Equals("memscan_level\njungle_secluded_climb")){ print("Autosplitt jungle_secluded_climb");vars.jungle_secluded_climb=0;return true;}
	if(vars.jungle_slug_struggle==1 && current.LevelName.Equals("memscan_level\njungle_slug_struggle")){ print("Autosplitt jungle_slug_struggle");vars.jungle_slug_struggle=0;return true;}
	if(vars.jungle_spikey_stockade==1 && current.LevelName.Equals("memscan_level\njungle_spikey_stockade")){ print("Autosplitt jungle_spikey_stockade");vars.jungle_spikey_stockade=0;return true;}
	if(vars.jungle_tall_tall_tower==1 && current.LevelName.Equals("memscan_level\njungle_tall_tall_tower")){ print("Autosplitt jungle_tall_tall_tower");vars.jungle_tall_tall_tower=0;return true;}
	if(vars.jungle_willy==1 && current.LevelName.Equals("memscan_level\njungle_willy")){ print("Autosplitt jungle_willy");vars.jungle_willy=0;return true;}	
	if(vars.peak_aerial_ascent==1 && current.LevelName.Equals("memscan_level\npeak_aerial_ascent")){ print("Autosplitt peak_aerial_ascent");vars.peak_aerial_ascent=0;return true;}	
	if(vars.peak_beanstalk_base==1 && current.LevelName.Equals("memscan_level\npeak_beanstalk_base")){ print("Autosplitt peak_beanstalk_base");vars.peak_beanstalk_base=0;return true;}	
	if(vars.peak_crooked_cliff==1 && current.LevelName.Equals("memscan_level\npeak_crooked_cliff")){ print("Autosplitt peak_crooked_cliff");vars.peak_crooked_cliff=0;return true;}	
	if(vars.peak_crystal_crater==1 && current.LevelName.Equals("memscan_level\npeak_crystal_crater")){ print("Autosplitt peak_crystal_crater");vars.peak_crystal_crater=0;return true;}	
	if(vars.peak_filthy_flat==1 && current.LevelName.Equals("memscan_level\npeak_filthy_flat")){ print("Autosplitt peak_filthy_flat");vars.peak_filthy_flat=0;return true;}	
	if(vars.peak_frostpine_forest==1 && current.LevelName.Equals("memscan_level\npeak_frostpine_forest")){ print("Autosplitt peak_frostpine_forest");vars.peak_frostpine_forest=0;return true;}	
	if(vars.peak_guano_grief==1 && current.LevelName.Equals("memscan_level\npeak_guano_grief")){ print("Autosplitt peak_guano_grief");vars.peak_guano_grief=0;return true;}	
	if(vars.peak_ice_cold_idol==1 && current.LevelName.Equals("memscan_level\npeak_ice_cold_idol")){ print("Autosplitt peak_ice_cold_idol");vars.peak_ice_cold_idol=0;return true;}	
	if(vars.peak_obtainium_oracle==1 && current.LevelName.Equals("memscan_level\npeak_obtainium_oracle")){ print("Autosplitt peak_obtainium_oracle");vars.peak_obtainium_oracle=0;return true;}	
	if(vars.peak_sky==1 && current.LevelName.Equals("memscan_level\npeak_sky")){ print("Autosplitt peak_sky");vars.peak_sky=0;return true;}	
	if(vars.peak_spacemonk_mystery==1 && current.LevelName.Equals("memscan_level\npeak_spacemonk_mystery")){ print("Autosplitt peak_spacemonk_mystery");vars.peak_spacemonk_mystery=0;return true;}	
	if(vars.peak_spider_fight==1 && current.LevelName.Equals("memscan_level\npeak_spider_fight")){ print("Autosplitt peak_spider_fight");vars.peak_spider_fight=0;return true;}	
	if(vars.peak_underside==1 && current.LevelName.Equals("memscan_level\npeak_underside")){ print("Autosplitt peak_underside");vars.peak_underside=0;return true;}	
	if(vars.spring_bubbly_basin==1 && current.LevelName.Equals("memscan_level\nspring_bubbly_basin")){ print("Autosplitt spring_bubbly_basin");vars.spring_bubbly_basin=0;return true;}	
	if(vars.spring_cloudburst_cliffs==1 && current.LevelName.Equals("memscan_level\nspring_cloudburst_cliffs")){ print("Autosplitt spring_cloudburst_cliffs");vars.spring_cloudburst_cliffs=0;return true;}	
	if(vars.spring_gangway_grotto==1 && current.LevelName.Equals("memscan_level\nspring_gangway_grotto")){ print("Autosplitt spring_gangway_grotto");vars.spring_gangway_grotto=0;return true;}	
	if(vars.spring_hazy_heaven==1 && current.LevelName.Equals("memscan_level\nspring_hazy_heaven")){ print("Autosplitt spring_hazy_heaven");vars.spring_hazy_heaven=0;return true;}	
	if(vars.spring_hidden_hotspring==1 && current.LevelName.Equals("memscan_level\nspring_hidden_hotspring")){ print("Autosplitt spring_hidden_hotspring");vars.spring_hidden_hotspring=0;return true;}	
	if(vars.spring_jailhouse_japes==1 && current.LevelName.Equals("memscan_level\nspring_jailhouse_japes")){ print("Autosplitt spring_jailhouse_japes");vars.spring_jailhouse_japes=0;return true;}	
	if(vars.spring_shoddy_shanty==1 && current.LevelName.Equals("memscan_level\nspring_shoddy_shanty")){ print("Autosplitt spring_shoddy_shanty");vars.spring_shoddy_shanty=0;return true;}	
	if(vars.spring_sleek_slabs==1 && current.LevelName.Equals("memscan_level\nspring_sleek_slabs")){ print("Autosplitt spring_sleek_slabs");vars.spring_sleek_slabs=0;return true;}	
	if(vars.spring_tiny_broad==1 && current.LevelName.Equals("memscan_level\nspring_tiny_broad")){ print("Autosplitt spring_tiny_broad");vars.spring_tiny_broad=0;return true;}	
	if(vars.spring_tortoise_tunnel==1 && current.LevelName.Equals("memscan_level\nspring_tortoise_tunnel")){ print("Autosplitt spring_tortoise_tunnel");vars.spring_tortoise_tunnel=0;return true;}	
	if(vars.spring_yokos_yam==1 && current.LevelName.Equals("memscan_level\nspring_yokos_yam")){ print("Autosplitt spring_yokos_yam");vars.spring_yokos_yam=0;return true;}
	}
//Items 

	if (String.IsNullOrEmpty(current.GameItem)){}else{
	if(vars.collectible==1 && current.GameItem.Equals("memscan_last_item_added\ncollectible")){ print("Autosplitt collectible");vars.collectible=0;return true;}
	if(vars.wallet==1 && current.GameItem.Equals("memscan_last_item_added\nwallet")){ print("Autosplitt wallet");vars.wallet=0;return true;}
	if(vars.tadpole==1 && current.GameItem.Equals("memscan_last_item_added\ntadpole")){ print("Autosplitt tadpole");vars.tadpole=0;return true;}
	if(vars.dustbunny_dirty==1 && current.GameItem.Equals("memscan_last_item_added\ndustbunny_dirty")){ print("Autosplitt dustbunny_dirty");vars.dustbunny_dirty=0;return true;}
	if(vars.nugget==1 && current.GameItem.Equals("memscan_last_item_added\nnugget")){ print("Autosplitt nugget");vars.nugget=0;return true;}
	if(vars.traitor_spirit==1 && current.GameItem.Equals("memscan_last_item_added\ntraitor_spirit")){ print("Autosplitt traitor_spirit");vars.traitor_spirit=0;return true;}
	if(vars.summons==1 && current.GameItem.Equals("memscan_last_item_added\nsummons")){ print("Autosplitt summons");vars.summons=0;return true;}
	if(vars.abilities_map==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/map")){ print("Autosplitt abilities_map");vars.abilities_map=0;return true;}
	if(vars.abilities_partyhorn==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/partyhorn")){ print("Autosplitt abilities_partyhorn");vars.abilities_partyhorn=0;return true;}
	if(vars.abilities_mailbag==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/mailbag")){ print("Autosplitt abilities_mailbag");vars.abilities_mailbag=0;return true;}
	if(vars.abilities_speed==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/speed")){ print("Autosplitt abilities_speed");vars.abilities_speed=0;return true;}
	if(vars.abilities_double_fruit==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/double_fruit")){ print("Autosplitt abilities_double_fruit");vars.abilities_double_fruit=0;return true;}
	if(vars.abilities_slug_vaccum==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/slug_vaccum")){ print("Autosplitt abilities_slug_vaccum");vars.abilities_slug_vaccum=0;return true;}
	if(vars.abilities_slug_upgrade==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/slug_upgrade")){ print("Autosplitt abilities_slug_upgrade");vars.abilities_slug_upgrade=0;return true;}
	if(vars.abilities_kickback==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/kickback")){ print("Autosplitt abilities_kickback");vars.abilities_kickback=0;return true;}
	if(vars.abilities_dive==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/dive")){ print("Autosplitt abilities_dive");vars.abilities_dive=0;return true;}
	if(vars.abilities_dive_speed==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/dive_speed")){ print("Autosplitt abilities_dive_speed");vars.abilities_dive_speed=0;return true;}
	if(vars.abilities_hook==1 && current.GameItem.Equals("memscan_last_item_added\nabilities/hook")){ print("Autosplitt abilities_hook");vars.abilities_hook=0;return true;}
	if(vars.sootling_leash==1 && current.GameItem.Equals("memscan_last_item_added\nsootling_leash")){ print("Autosplitt sootling_leash");vars.sootling_leash=0;return true;}
	if(vars.bucket_empty==1 && current.GameItem.Equals("memscan_last_item_added\nbucket_empty")){ print("Autosplitt bucket_empty");vars.bucket_empty=0;return true;}
	if(vars.bucket_full==1 && current.GameItem.Equals("memscan_last_item_added\nbucket_full")){ print("Autosplitt bucket_full");vars.bucket_full=0;return true;}
	if(vars.guano==1 && current.GameItem.Equals("memscan_last_item_added\nguano")){ print("Autosplitt guano");vars.guano=0;return true;}
	if(vars.seed_pod==1 && current.GameItem.Equals("memscan_last_item_added\nseed_pod")){ print("Autosplitt seed_pod");vars.seed_pod=0;return true;}
	if(vars.bluekey==1 && current.GameItem.Equals("memscan_last_item_added\nbluekey")){ print("Autosplitt bluekey");vars.bluekey=0;return true;}
	if(vars.greenkey==1 && current.GameItem.Equals("memscan_last_item_added\ngreenkey")){ print("Autosplitt greenkey");vars.greenkey=0;return true;}
	if(vars.spring_key==1 && current.GameItem.Equals("memscan_last_item_added\nspring_key")){ print("Autosplitt spring_key");vars.spring_key=0;return true;}
	if(vars.nim_key==1 && current.GameItem.Equals("memscan_last_item_added\nnim_key")){ print("Autosplitt nim_key");vars.nim_key=0;return true;}
	if(vars.instrument_pile==1 && current.GameItem.Equals("memscan_last_item_added\ninstrument_pile")){ print("Autosplitt instrument_pile");vars.instrument_pile=0;return true;}
	if(vars.toolbox==1 && current.GameItem.Equals("memscan_last_item_added\ntoolbox")){ print("Autosplitt toolbox");vars.toolbox=0;return true;}
	if(vars.sad_spider==1 && current.GameItem.Equals("memscan_last_item_added\nsad_spider")){ print("Autosplitt sad_spider");vars.sad_spider=0;return true;}
	if(vars.postal_badge==1 && current.GameItem.Equals("memscan_last_item_added\npostal_badge")){ print("Autosplitt postal_badge");vars.postal_badge=0;return true;}
	if(vars.treasure_map==1 && current.GameItem.Equals("memscan_last_item_added\ntreasure_map")){ print("Autosplitt treasure_map");vars.treasure_map=0;return true;}
	if(vars.mushroom_2==1 && current.GameItem.Equals("memscan_last_item_added\nmushroom_2")){ print("Autosplitt mushroom_2");vars.mushroom_2=0;return true;}
	if(vars.mushroom_3==1 && current.GameItem.Equals("memscan_last_item_added\nmushroom_3")){ print("Autosplitt mushroom_3");vars.mushroom_3=0;return true;}
	if(vars.powerups_skvader_1==1 && current.GameItem.Equals("memscan_last_item_added\npowerups/skvader_1")){ print("Autosplitt powerups_skvader_1");vars.powerups_skvader_1=0;return true;}
	if(vars.powerups_skvader_2==1 && current.GameItem.Equals("memscan_last_item_added\npowerups/skvader_2")){ print("Autosplitt powerups_skvader_2");vars.powerups_skvader_2=0;return true;}
	if(vars.package_3==1 && current.GameItem.Equals("memscan_last_item_added\npackage_3")){ print("Autosplitt package_3");vars.package_3=0;return true;}
	if(vars.package_2==1 && current.GameItem.Equals("memscan_last_item_added\npackage_2")){ print("Autosplitt package_2");vars.package_2=0;return true;}
	if(vars.package_1==1 && current.GameItem.Equals("memscan_last_item_added\npackage_1")){ print("Autosplitt package_1");vars.package_1=0;return true;}
	if(vars.idol1==1 && current.GameItem.Equals("memscan_last_item_added\nidol1")){ print("Autosplitt idol1");vars.idol1=0;return true;}
	if(vars.idol2==1 && current.GameItem.Equals("memscan_last_item_added\nidol2")){ print("Autosplitt idol2");vars.idol2=0;return true;}
	if(vars.idol3==1 && current.GameItem.Equals("memscan_last_item_added\nidol3")){ print("Autosplitt idol3");vars.idol3=0;return true;}
	if(vars.idol4==1 && current.GameItem.Equals("memscan_last_item_added\nidol4")){ print("Autosplitt idol4");vars.idol4=0;return true;}
	if(vars.spores_1==1 && current.GameItem.Equals("memscan_last_item_added\nspores_1")){ print("Autosplitt spores_1");vars.spores_1=0;return true;}
	if(vars.spores_2==1 && current.GameItem.Equals("memscan_last_item_added\nspores_2")){ print("Autosplitt spores_2");vars.spores_2=0;return true;}
	if(vars.spores_3==1 && current.GameItem.Equals("memscan_last_item_added\nspores_3")){ print("Autosplitt spores_3");vars.spores_3=0;return true;}
	if(vars.spores_4==1 && current.GameItem.Equals("memscan_last_item_added\nspores_4")){ print("Autosplitt spores_4");vars.spores_4=0;return true;}
	if(vars.spores_5==1 && current.GameItem.Equals("memscan_last_item_added\nspores_5")){ print("Autosplitt spores_5");vars.spores_5=0;return true;}
	if(vars.tracker_caves==1 && current.GameItem.Equals("memscan_last_item_added\ntracker_caves")){ print("Autosplitt tracker_caves");vars.tracker_caves=0;return true;}
	if(vars.tracker_jungle==1 && current.GameItem.Equals("memscan_last_item_added\ntracker_jungle")){ print("Autosplitt tracker_jungle");vars.tracker_jungle=0;return true;}
	if(vars.tracker_peak==1 && current.GameItem.Equals("memscan_last_item_added\ntracker_peak")){ print("Autosplitt tracker_peak");vars.tracker_peak=0;return true;}
	if(vars.tracker_springs==1 && current.GameItem.Equals("memscan_last_item_added\ntracker_springs")){ print("Autosplitt tracker_springs");vars.tracker_springs=0;return true;}
	if(vars.tracker_scarabs==1 && current.GameItem.Equals("memscan_last_item_added\ntracker_scarabs")){ print("Autosplitt tracker_scarabs");vars.tracker_scarabs=0;return true;}
	if(vars.skins_skin_1==1 && current.GameItem.Equals("memscan_last_item_added\nskins/skin_1")){ print("Autosplitt skins_skin_1");vars.skins_skin_1=0;return true;}
	if(vars.skins_skin_2==1 && current.GameItem.Equals("memscan_last_item_added\nskins/skin_2")){ print("Autosplitt skins_skin_2");vars.skins_skin_2=0;return true;}
	if(vars.skins_skin_3==1 && current.GameItem.Equals("memscan_last_item_added\nskins/skin_3")){ print("Autosplitt skins_skin_3");vars.skins_skin_3=0;return true;}
	if(vars.skins_skin_4==1 && current.GameItem.Equals("memscan_last_item_added\nskins/skin_4")){ print("Autosplitt skins_skin_4");vars.skins_skin_4=0;return true;}
	if(vars.skins_skin_5==1 && current.GameItem.Equals("memscan_last_item_added\nskins/skin_5")){ print("Autosplitt skins_skin_5");vars.skins_skin_5=0;return true;}
	}
//State
	if (String.IsNullOrEmpty(current.GameState)){}else{
	if(vars.door==1 && current.GameState.Equals("memscan_last_state\nintro_landing_creepy_cavern:327")){ print("Autosplitt door");vars.door=0;return true;}
	if(vars.kickbackdead==1 && current.GameState.Equals("memscan_last_state\nhub_bowel_bumping_left:3246")){ print("Autosplitt kickbackdead");vars.kickbackdead=0;return true;}
	}
}

/*
    start{} only runs when the timer's paused
    return true => starts the timer
*/
start {
	if (settings["speedrun"]) {
		if (String.IsNullOrEmpty(current.GameTime)){}else{
		if(current.GameTime.Equals("memscan_time\n00:00:00.01")) { 	
//Levels
			if (settings["cave_abyssal_access"]){vars.cave_abyssal_access=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_abyssal_access=0;}
			if (settings["cave_beach_bottom"]){vars.cave_beach_bottom=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_beach_bottom=0;}
			if (settings["cave_beaver_blockade"]){vars.cave_beaver_blockade=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_beaver_blockade=0;}
			if (settings["cave_boss"]){vars.cave_boss=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_boss=0;}
			if (settings["cave_clammy_cenote"]){vars.cave_clammy_cenote=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_clammy_cenote=0;}
			if (settings["cave_east_bay_shore"]){vars.cave_east_bay_shore=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_east_bay_shore=0;}
			if (settings["cave_temple_terror_entrance"]){vars.cave_temple_terror_entrance=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_temple_terror_entrance=0;}
			if (settings["cave_temple_terror_lower"]){vars.cave_temple_terror_lower=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_temple_terror_lower=0;}
			if (settings["cave_temple_terror_treasury"]){vars.cave_temple_terror_treasury=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_temple_terror_treasury=0;}
			if (settings["cave_temple_terror_upper"]){vars.cave_temple_terror_upper=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_temple_terror_upper=0;}
			if (settings["cave_winding_waterway"]){vars.cave_winding_waterway=1; print("Autosplitter| Split: X aktivated");}else{ vars.cave_winding_waterway=0;}			
			if (settings["hub_bowel_bumping_left"] || settings["any%true"]){vars.hub_bowel_bumping_left=1; print("Autosplitter| Split: Endboss [H0] aktivated");}else{ vars.hub_bowel_bumping_left=0;}					
			if (settings["hub_cliffside_creek"]){vars.hub_cliffside_creek=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_cliffside_creek=0;}
			if (settings["hub_festival"]){vars.hub_festival=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_festival=0;}
			if (settings["hub_festival_sky"]){vars.hub_festival_sky=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_festival_sky=0;}
			if (settings["hub_festival_upper"]){vars.hub_festival_upper=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_festival_upper=0;}
			if (settings["hub_hermits_home"]){vars.hub_hermits_home=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_hermits_home=0;}
			if (settings["hub_island_express"] || settings["any%true"]){vars.hub_island_express=1; print("Autosplitter| Split: Top of Tall Totem Tower [H6] aktivated");}else{ vars.hub_island_express=0;}
			if (settings["hub_left_lemur_lane"]){vars.hub_left_lemur_lane=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_left_lemur_lane=0;}
			if (settings["hub_left_lofty_logo"] || settings["any%true"]){vars.hub_left_lofty_logo=1; print("Autosplitter| Split: Titel Screen [H8] aktivated");}else{ vars.hub_left_lofty_logo=0;}
			if (settings["hub_marrow_maze"]){vars.hub_marrow_maze=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_marrow_maze=0;}
			if (settings["hub_obtainium_outland"]){vars.hub_obtainium_outland=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_obtainium_outland=0;}
			if (settings["hub_soaring_stone"]){vars.hub_soaring_stone=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_soaring_stone=0;}
			if (settings["hub_village"]){vars.hub_village=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_village=0;}
			if (settings["hub_white_cliff"]){vars.hub_white_cliff=1; print("Autosplitter| Split: X aktivated");}else{ vars.hub_white_cliff=0;}		
			if (settings["intro_landing"]){vars.intro_landing=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_landing=0;}
			if (settings["intro_landing_creepy_cavern"]){vars.intro_landing_creepy_cavern=1; print("Autosplitter| Split: Fosfor Skip [I1] aktivated");}else{ vars.intro_landing_creepy_cavern=0;}
			if (settings["intro_landing_left"]){vars.intro_landing_left=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_landing_left=0;}
			if (settings["intro_landing_right"]){vars.intro_landing_right=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_landing_right=0;}
			if (settings["intro_landing_upper"]){vars.intro_landing_upper=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_landing_upper=0;}
			if (settings["intro_muddled_morass"]){vars.intro_muddled_morass=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_muddled_morass=0;}
			if (settings["intro_secret"]){vars.intro_secret=1; print("Autosplitter| Split: X aktivated");}else{ vars.intro_secret=0;}								
			if (settings["island_ending_2"]){vars.island_ending_2=1; print("Autosplitter| Split: X aktivated");}else{ vars.island_ending_2=0;}							
			if (settings["jungle_canyon_caper"]){vars.jungle_canyon_caper=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_canyon_caper=0;}
			if (settings["jungle_crammed_canopy"]){vars.jungle_crammed_canop=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_crammed_canopy=0;}
			if (settings["jungle_misty_meadow"]){vars.jungle_misty_meadow=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_misty_meadow=0;}
			if (settings["jungle_mollusc_madness"]){vars.jungle_mollusc_madness=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_mollusc_madness=0;}
			if (settings["jungle_roots"]){vars.jungle_roots=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_roots=0;}
			if (settings["jungle_secluded_climb"]){vars.jungle_secluded_climb=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_secluded_climb=0;}
			if (settings["jungle_slug_struggle"]){vars.jungle_slug_struggle=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_slug_struggle=0;}
			if (settings["jungle_spikey_stockade"]){vars.jungle_spikey_stockade=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_spikey_stockade=0;}
			if (settings["jungle_tall_tall_tower"]){vars.jungle_tall_tall_tower=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_tall_tall_tower=0;}
			if (settings["jungle_willy"]){vars.jungle_willy=1; print("Autosplitter| Split: X aktivated");}else{ vars.jungle_willy=0;}		
			if (settings["peak_aerial_ascent"]){vars.peak_aerial_ascent=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_aerial_ascent=0;}	
			if (settings["peak_beanstalk_base"]){vars.peak_beanstalk_base=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_beanstalk_base=0;}	
			if (settings["peak_crooked_cliff"]){vars.peak_crooked_cliff=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_crooked_cliff=0;}	
			if (settings["peak_crystal_crater"]){vars.peak_crystal_crater=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_crystal_crater=0;}	
			if (settings["peak_filthy_flat"]){vars.peak_filthy_flat=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_filthy_flat=0;}	
			if (settings["peak_frostpine_forest"]){vars.peak_frostpine_forest=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_frostpine_forest=0;}	
			if (settings["peak_guano_grief"]){vars.peak_guano_grief=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_guano_grief=0;}	
			if (settings["peak_ice_cold_idol"]){vars.peak_ice_cold_idol=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_ice_cold_idol=0;}	
			if (settings["peak_obtainium_oracle"]){vars.peak_obtainium_oracle=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_obtainium_oracle=0;}	
			if (settings["peak_sky"]){vars.peak_sky=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_sky=0;}	
			if (settings["peak_spacemonk_mystery"]){vars.peak_spacemonk_mystery=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_spacemonk_mystery=0;}	
			if (settings["peak_spider_fight"]){vars.peak_spider_fight=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_spider_fight=0;}	
			if (settings["peak_underside"]){vars.peak_underside=1; print("Autosplitter| Split: X aktivated");}else{ vars.peak_underside=0;}		
			if (settings["spring_bubbly_basin"]){vars.spring_bubbly_basin=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_bubbly_basin=0;}	
			if (settings["spring_cloudburst_cliffs"]){vars.spring_cloudburst_cliffs=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_cloudburst_cliffs=0;}	
			if (settings["spring_gangway_grotto"]){vars.spring_gangway_grotto=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_gangway_grotto=0;}	
			if (settings["spring_hazy_heaven"]){vars.spring_hazy_heaven=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_hazy_heaven=0;}	
			if (settings["spring_hidden_hotspring"]){vars.spring_hidden_hotspring=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_hidden_hotspring=0;}	
			if (settings["spring_jailhouse_japes"]){vars.spring_jailhouse_japes=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_jailhouse_japes=0;}	
			if (settings["spring_shoddy_shanty"]){vars.spring_shoddy_shanty=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_shoddy_shanty=0;}	
			if (settings["spring_sleek_slabs"]){vars.spring_sleek_slabs=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_sleek_slabs=0;}	
			if (settings["spring_tiny_broad"]){vars.spring_tiny_broad=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_tiny_broad=0;}	
			if (settings["spring_tortoise_tunnel"]){vars.spring_tortoise_tunnel=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_tortoise_tunnel=0;}	
			if (settings["spring_yokos_yam"]){vars.spring_yokos_yam=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_yokos_yam=0;}	
//Items
			if (settings["collectible"]){vars.collectible=1; print("Autosplitter| Split: X aktivated");}else{ vars.collectible=0;}
			if (settings["wallet"]){vars.wallet=1; print("Autosplitter| Split: X aktivated");}else{ vars.wallet=0;}
			if (settings["tadpole"]){vars.tadpole=1; print("Autosplitter| Split: X aktivated");}else{ vars.tadpole=0;}
			if (settings["dustbunny_dirty"]){vars.dustbunny_dirty=1; print("Autosplitter| Split: X aktivated");}else{ vars.dustbunny_dirty=0;}
			if (settings["nugget"]){vars.nugget=1; print("Autosplitter| Split: X aktivated");}else{ vars.nugget=0;}
			if (settings["traitor_spirit"]){vars.traitor_spirit=1; print("Autosplitter| Split: X aktivated");}else{ vars.traitor_spirit=0;}
			if (settings["summons"]){vars.summons=1; print("Autosplitter| Split: X aktivated");}else{ vars.summons=0;}
			if (settings["abilities/map"]){vars.abilities_map=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_map=0;}
			if (settings["abilities/partyhorn"] || settings["any%true"]){vars.abilities_partyhorn=1; print("Autosplitter| Split: Noismaker aktivated");}else{ vars.abilities_partyhorn=0;}
			if (settings["abilities/mailbag"]){vars.abilities_mailbag=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_mailbag=0;}
			if (settings["abilities/speed"]){vars.abilities_speed=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_speed=0;}
			if (settings["abilities/double_fruit"]){vars.abilities_double_fruit=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_double_fruit=0;}
			if (settings["abilities/slug_vaccum"]){vars.abilities_slug_vaccum=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_slug_vaccum=0;}
			if (settings["abilities/slug_upgrade"]){vars.abilities_slug_upgrade=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_slug_upgrade=0;}
			if (settings["abilities/kickback"]){vars.abilities_kickback=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_kickback=0;}
			if (settings["abilities/dive"]){vars.abilities_dive=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_dive=0;}
			if (settings["abilities/dive_speed"]){vars.abilities_dive_speed=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_dive_speed=0;}
			if (settings["abilities/hook"]){vars.abilities_hook=1; print("Autosplitter| Split: X aktivated");}else{ vars.abilities_hook=0;}
			if (settings["sootling_leash"]){vars.sootling_leash=1; print("Autosplitter| Split: X aktivated");}else{ vars.sootling_leash=0;}
			if (settings["bucket_empty"]){vars.bucket_empty=1; print("Autosplitter| Split: X aktivated");}else{ vars.bucket_empty=0;}
			if (settings["bucket_full"]){vars.bucket_full=1; print("Autosplitter| Split: X aktivated");}else{ vars.bucket_full=0;}
			if (settings["guano"]){vars.guano=1; print("Autosplitter| Split: X aktivated");}else{ vars.guano=0;}
			if (settings["seed_pod"]){vars.seed_pod=1; print("Autosplitter| Split: X aktivated");}else{ vars.seed_pod=0;}
			if (settings["bluekey"]){vars.bluekey=1; print("Autosplitter| Split: X aktivated");}else{ vars.bluekey=0;}
			if (settings["greenkey"]){vars.greenkey=1; print("Autosplitter| Split: X aktivated");}else{ vars.greenkey=0;}
			if (settings["spring_key"]){vars.spring_key=1; print("Autosplitter| Split: X aktivated");}else{ vars.spring_key=0;}
			if (settings["nim_key"]){vars.nim_key=1; print("Autosplitter| Split: X aktivated");}else{ vars.nim_key=0;}
			if (settings["instrument_pile"]){vars.instrument_pile=1; print("Autosplitter| Split: X aktivated");}else{ vars.instrument_pile=0;}
			if (settings["toolbox"]){vars.toolbox=1; print("Autosplitter| Split: X aktivated");}else{ vars.toolbox=0;}
			if (settings["sad_spider"]){vars.sad_spider=1; print("Autosplitter| Split: X aktivated");}else{ vars.sad_spider=0;}
			if (settings["postal_badge"]){vars.postal_badge=1; print("Autosplitter| Split: X aktivated");}else{ vars.postal_badge=0;}
			if (settings["treasure_map"]){vars.treasure_map=1; print("Autosplitter| Split: X aktivated");}else{ vars.treasure_map=0;}
			if (settings["mushroom_2"]){vars.mushroom_2=1; print("Autosplitter| Split: X aktivated");}else{ vars.mushroom_2=0;}
			if (settings["mushroom_3"]){vars.mushroom_3=1; print("Autosplitter| Split: X aktivated");}else{ vars.mushroom_3=0;}
			if (settings["powerups/skvader_1"]){vars.powerups_skvader_1=1; print("Autosplitter| Split: X aktivated");}else{ vars.powerups_skvader_1=0;}
			if (settings["powerups/skvader_2"]){vars.powerups_skvader_2=1; print("Autosplitter| Split: X aktivated");}else{ vars.powerups_skvader_2=0;}
			if (settings["package_3"]){vars.package_3=1; print("Autosplitter| Split: X aktivated");}else{ vars.package_3=0;}
			if (settings["package_2"]){vars.package_2=1; print("Autosplitter| Split: X aktivated");}else{ vars.package_2=0;}
			if (settings["package_1"]){vars.package_1=1; print("Autosplitter| Split: X aktivated");}else{ vars.package_1=0;}
			if (settings["idol1"]){vars.idol1=1; print("Autosplitter| Split: X aktivated");}else{ vars.idol1=0;}
			if (settings["idol2"]){vars.idol2=1; print("Autosplitter| Split: X aktivated");}else{ vars.idol2=0;}
			if (settings["idol3"]){vars.idol3=1; print("Autosplitter| Split: X aktivated");}else{ vars.idol3=0;}
			if (settings["idol4"]){vars.idol4=1; print("Autosplitter| Split: X aktivated");}else{ vars.idol4=0;}
			if (settings["spores_1"]){vars.spores_1=1; print("Autosplitter| Split: X aktivated");}else{ vars.spores_1=0;}
			if (settings["spores_2"]){vars.spores_2=1; print("Autosplitter| Split: X aktivated");}else{ vars.spores_2=0;}
			if (settings["spores_3"]){vars.spores_3=1; print("Autosplitter| Split: X aktivated");}else{ vars.spores_3=0;}
			if (settings["spores_4"]){vars.spores_4=1; print("Autosplitter| Split: X aktivated");}else{ vars.spores_4=0;}
			if (settings["spores_5"]){vars.spores_5=1; print("Autosplitter| Split: X aktivated");}else{ vars.spores_5=0;}
			if (settings["tracker_caves"]){vars.tracker_caves=1; print("Autosplitter| Split: X aktivated");}else{ vars.tracker_caves=0;}
			if (settings["tracker_jungle"]){vars.tracker_jungle=1; print("Autosplitter| Split: X aktivated");}else{ vars.tracker_jungle=0;}
			if (settings["tracker_peak"]){vars.tracker_peak=1; print("Autosplitter| Split: X aktivated");}else{ vars.tracker_peak=0;}
			if (settings["tracker_springs"]){vars.tracker_springs=1; print("Autosplitter| Split: X aktivated");}else{ vars.tracker_springs=0;}
			if (settings["tracker_scarabs"]){vars.tracker_scarabs=1; print("Autosplitter| Split: X aktivated");}else{ vars.tracker_scarabs=0;}
			if (settings["skins/skin_1"]){vars.skins_skin_1=1; print("Autosplitter| Split: Bling Sprinkles aktivated");}else{ vars.skins_skin_1=0;}
			if (settings["skins/skin_2"]){vars.skins_skin_2=1; print("Autosplitter| Split: Creepy Sprinkles aktivated");}else{ vars.skins_skin_2=0;}
			if (settings["skins/skin_3"]){vars.skins_skin_3=1; print("Autosplitter| Split: Deadly Sprinkles aktivated");}else{ vars.skins_skin_3=0;}
			if (settings["skins/skin_4"]){vars.skins_skin_4=1; print("Autosplitter| Split: Crimson Sprinkles aktivated");}else{ vars.skins_skin_4=0;}
			if (settings["skins/skin_5"]){vars.skins_skin_5=1; print("Autosplitter| Split: Sweet Sprinkles aktivated");}else{ vars.skins_skin_5=0;}
//State
			if (settings["door"] || settings["any%true"]){vars.door=1; print("Autosplitter| Split: Door aktivated"); }else{ vars.door=0;}
			if (settings["kickbackdead"] || settings["any%true"]){vars.kickbackdead=1; print("Autosplitter| Split: Kickback aktivated"); }else{ vars.kickbackdead=0;}
			print("Autosplitter| Started");return true;
		}
		}		
	}      
}
