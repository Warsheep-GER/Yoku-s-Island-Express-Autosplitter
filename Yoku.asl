/* Info Autosplitter
    Game: Yokus Island Express
    Version: 0.4
    Author: WarsheepGER
	Date: 26.11.2019
    Compatible Versions:
        Steam (PC)||W10 (functional)||W7 (untested,might not work)
		Twitch (PC)||W10 (untested,might not work)||W7 (untested,might not work)
    
    CREDITS
		A realy Big Thans to Llerd Aka Jens Anderson (Devoloper of Yoku) for give me the Usefuls Memscans
		Thanks to xWinG Aka Frederic Dantes (Speedrunner) to help me out to named some Stuff
		Thanks to the Users of Speedrun Tool Development Discord to help me by some Stuff,https://discord.gg/N6wv8pW
		Me WarsheepGER Aka Johannes Kersten the Creator of the Autosplitter|
		
    CHANGELOG
		Version
		0.0.1 	:Added LevelSkips/Gametime First Test
		0.0.2 	:Added ItemSkips rework some Codestuff
		0.0.3 	:Added StateSkips|Changelog|Credits|Version|Description,first work for default runs[anytrue],some other stuff
		0.0.4 	:Added Kickback2 |Named all Settings|,first work for fruit and wallet ,change starttime to ,1 to have 9ms tostart,sometimes he jumped over 1ms,fixed littl bug with a variable
		0.0.5 	:Added Fruits |Wallet selection fixed. 
		0.0.6 	:changed Wallet Selection(only 1 option for 10 Wallets). Kickback/Wallet/Dustbunny/Traitor/Tadpol counter done.
		0.0.7 	:Wickerlinge and Nuggeds get counted now. 
		0.0.8 	:little fix for wickerlinge )))))
		0.0.9 	:named all settings now.first work for splitnames
		0.1 	:fix for -kickback2. named all Splits right.Added Mainsplits: anytrue ,ayn%boss ,any%nim ,anynooob ,fruit ,wallet ,double ,true end ,100
		0.2 	:Added Wickerlings to true end and 100. added Ebon talk to No-OOB and any%nim. added Totems ,Fixed(overworked) nugget traitor dustbunny wallet wickerling and totem counters 
		0.3 	:cleanup code littsl bit. Added better DebugLog
		0.4 	:shorts the code with ms1-ms6 to hold the file smaler
	

		
		ToDO: 
		-optimizing code
		-add exit() 
		-shutdown() 
		-versionscheck?(Steam/Twitch) 
		-dungball%:?     ||settings["dungball%"]) 
		-
		-!!!find state for package done!!!	
*/

state("Yoku"){
        // Values for splits
		string14 GameTime :		"Yoku.exe",0x005525D0,0x68,0x460,0x60,0x260,0x88,0xF0;//ms5\nXX:XX:XX.xx
		string42 LevelName :	"Yoku.exe",0x005525D0,0x68,0x460,0x60,0x260,0x88,0x1F0;//ms6\nXXXXXXXX
		string51 GameState :	"Yoku.exe",0x005525D0,0x68,0x460,0x60,0x260,0x88,0x2F0;//ms1\nxxx:x
		string50 GameItem :		"Yoku.exe",0x005525D0,0x68,0x460,0x60,0x260,0x88,0x3F0;//ms2\nxxx:x or ms3\nxxx:x
		int GameFruits :		"Yoku.exe",0x005525D0,0x68,0x460,0x60,0x260,0x88,0xAB0;//xxx
}
	 
startup {//runs when the script gets loaded
	settings.Add("speedrun",true,"Autosplitter| Version: 0.4 By WarsheepGER");settings.SetToolTip("speedrun","Check the Options you want to used for the Autosplitter");
	settings.CurrentDefaultParent="speedrun";
		settings.Add("mainsplits",true,"Main Splits");settings.SetToolTip("mainsplits","Check only 1 of this Sub Option to run with Default Splits");
		settings.Add("costumesplits",false,"Costume Splits");settings.SetToolTip("costumesplits","Check this Option to run with Costume Splits");
	settings.CurrentDefaultParent="mainsplits";
		settings.Add("100%",false,"100% (49 Splits)");settings.SetToolTip("100%","Check to run 100%");
		settings.Add("trueend",false,"True End (26 Splits)");settings.SetToolTip("trueend","Check to run True End");
		settings.Add("any%",true,"Any%");settings.SetToolTip("any%","Check only 1 of this Sub Option to run Any%");
		settings.Add("misc",false,"Misc.");settings.SetToolTip("misc","Check only 1 of this Sub Option to run Misc.%");
	settings.CurrentDefaultParent="any%";
		settings.Add("any%true",true,"True (6 Splits)");settings.SetToolTip("any%true","Check to run Any% True");
		settings.Add("any%nooob",false,"No-OOB (21 Splits)");settings.SetToolTip("any%nooob","Check to run Any% No-OOB");
		settings.Add("any%nims",false,"Nims Quest (20 Splits)");settings.SetToolTip("any%nims","Check to run Any% Nims Quest");
		settings.Add("any%boss",false,"All Bosses (17 SPlits)");settings.SetToolTip("any%boss","Check to run Any% All Bosses");
	settings.CurrentDefaultParent="misc";
		settings.Add("fruit%",false,"Fruits% (1 SplitT)");	settings.SetToolTip("fruit%","Check to run Fruit%");
		settings.Add("wallet%",false,"Wallet% (14 Splits)");settings.SetToolTip("wallet%","Check to run Wallet%");
		settings.Add("double%",false,"Double% (7 Splits)");settings.SetToolTip("double%","Check to run Double%");
		settings.Add("dungball%",false,"Dungball% not included jet! need a mainroute...");settings.SetToolTip("dungball%","Check to run Dungball%");
	settings.CurrentDefaultParent="costumesplits";
		settings.Add("levelsplits",false,"Levels");settings.SetToolTip("levelsplits","Check this Option if you want to split with Levels");
		settings.Add("itemsplits",false,"Items");settings.SetToolTip("itemsplits","Check this Option if you want to split with Items");
		settings.Add("othersplits",false,"Others");settings.SetToolTip("othersplits","Check this Option if you want to split with Others");
	settings.CurrentDefaultParent="levelsplits";
		settings.Add("cave",false,"Cave Levels");
		settings.Add("hub",false,"Hub Levels");
		settings.Add("intro",false,"Intro Levels");
		settings.Add("island",false,"Island Levels");
		settings.Add("jungle",false,"Jungle Levels");
		settings.Add("peak",false,"Peak Levels");
		settings.Add("spring",false,"Spring Levels");
	settings.CurrentDefaultParent="itemsplits";
		settings.Add("mainitems",false,"Main Items");
		settings.Add("sidequest",false,"Side Quest");
		settings.Add("othersitems",false,"Others Items");
	settings.CurrentDefaultParent="mainitems";
		settings.Add("mains",false,"Main Items");
		settings.Add("abilities",false,"Abilities");
		settings.Add("keys",false,"Keys");
		settings.Add("beanstalk",false,"Beanstalk");
	settings.CurrentDefaultParent="sidequest";
		settings.Add("willos",false,"Willo Sidequest");
		settings.Add("rinris",false,"Rinri Sidequest");
		settings.Add("packages",false,"Packages");
		settings.Add("othersside",false,"Others Items");
	settings.CurrentDefaultParent="othersitems";
		settings.Add("tracker",false,"Tracker");
		settings.Add("skins",false,"Skins");
		settings.Add("others",false,"Others Items");
//Levels
	settings.CurrentDefaultParent="cave";
		settings.Add("cave_abyssal_access",false,"Door Friends Bottom Left [C0]");
		settings.Add("cave_beach_bottom",false,"Ocean Right [C1]");
		settings.Add("cave_beaver_blockade",false,"Door Friends [C2]");
		settings.Add("cave_boss",false,"Screetch [C3]");
		settings.Add("cave_clammy_cenote",false,"The Dolphin [C4]");
		settings.Add("cave_east_bay_shore",false,"Beach Right [C5]");
		settings.Add("cave_temple_terror_entrance",false,"Temple Trials Entrance [C6]");
		settings.Add("cave_temple_terror_lower",false,"Temple Trials [C7]");
		settings.Add("cave_temple_terror_treasury",false,"Temple Treasury [C8]");
		settings.Add("cave_temple_terror_upper",false,"God Egg [C9]");
		settings.Add("cave_winding_waterway",false,"Pitch,Stupid Wickerling [CA]");
	settings.CurrentDefaultParent="hub";
		settings.Add("hub_bowel_bumping_left",false,"Endboss [H0]");
		settings.Add("hub_cliffside_creek",false,"Fleek Hidden Diva [H1]");
		settings.Add("hub_festival",false,"Mokumas Pit [H2]");
		settings.Add("hub_festival_sky",false,"Ivory Beeline [H3]");
		settings.Add("hub_festival_upper",false,"Ivory Beeline and Kazzo [H4]");
		settings.Add("hub_hermits_home",false,"Sin [H5]");
		settings.Add("hub_island_express",false,"Top of Tall Totem Tower [H6]");
		settings.Add("hub_left_lemur_lane",false,"Sandros Bridge [H7]");
		settings.Add("hub_left_lofty_logo",false,"Titel Screen [H8]");
		settings.Add("hub_marrow_maze",false,"Endboss Maze [H9]");
		settings.Add("hub_obtainium_outland",false,"Willos last Puzzlepiece [HA]");
		settings.Add("hub_soaring_stone",false,"Woods Beeline [HB]");
		settings.Add("hub_village",false,"Mokumana Village [HC]");
		settings.Add("hub_white_cliff",false,"Dipperloaf [HD]");
	settings.CurrentDefaultParent="intro";
		settings.Add("intro_landing",false,"Startarea [I0]");
		settings.Add("intro_landing_creepy_cavern",false,"Fosfor Skip [I1]");
		settings.Add("intro_landing_left",false,"Beach Left [I2]");
		settings.Add("intro_landing_right",false,"Sootlinghouse End of intro [I3]");
		settings.Add("intro_landing_upper",false,"Noisemaker and Mushrooms [I4]");
		settings.Add("intro_muddled_morass",false,"Fosfors Cave [I5]");
		settings.Add("intro_secret",false,"Ocean Left  [I6]");
	settings.CurrentDefaultParent="island";
		settings.Add("island_ending_2",false,"True End [I7]");
	settings.CurrentDefaultParent="jungle";
		settings.Add("jungle_canyon_caper",false,"Kickback Introduction [J0]");
		settings.Add("jungle_crammed_canopy",false,"Poleskip to Secret Cave [J1]");
		settings.Add("jungle_misty_meadow",false,"Meadow slugvacuum shed [J2]");
		settings.Add("jungle_mollusc_madness",false,"Slug Introduction [J3]");
		settings.Add("jungle_roots",false,"Juicery and introshoot [J4]");
		settings.Add("jungle_secluded_climb",false,"Climb to Waterfallskvader [J5]");
		settings.Add("jungle_slug_struggle",false,"Great Ape [J6]");
		settings.Add("jungle_spikey_stockade",false,"Secret Cave [J7]");
		settings.Add("jungle_tall_tall_tower",false,"Tall Totem Tower [J8]");
		settings.Add("jungle_willy",false,"Willo Queststart [J9]");
	settings.CurrentDefaultParent="peak";
		settings.Add("peak_aerial_ascent",false,"Obtainum-ore Station [P0]");
		settings.Add("peak_beanstalk_base",false,"Basecamp,Beanstalk [P1]");
		settings.Add("peak_crooked_cliff",false,"Up the Beanstalk [P2]");
		settings.Add("peak_crystal_crater",false,"Willo at Ivory Crater [P3]");
		settings.Add("peak_filthy_flat",false,"Lighthouse [P4]");
		settings.Add("peak_frostpine_forest",false,"Sootlingcaves [P5]");
		settings.Add("peak_guano_grief",false,"Guano Tower [P6]");
		settings.Add("peak_ice_cold_idol",false,"Water-Fountain [P7]");
		settings.Add("peak_obtainium_oracle",false,"Ojva,Trivial Facts [P8]");
		settings.Add("peak_sky",false,"Ivory Beeline [P9]");
		settings.Add("peak_spacemonk_mystery",false,"Spacemonk Spaceship [PA]");
		settings.Add("peak_spider_fight",false,"Boon Boss,Spider Fight [PB]");
		settings.Add("peak_underside",false,"Fountain/Town-skip [PC]");
	settings.CurrentDefaultParent="spring";
		settings.Add("spring_bubbly_basin",false,"Hidden Sanctuary [S0]");
		settings.Add("spring_cloudburst_cliffs",false,"Great Falls,Waterfall [S1]");
		settings.Add("spring_gangway_grotto",false,"Skullgang Hideout [S2]");
		settings.Add("spring_hazy_heaven",false,"Marrow Hills Beeline [S3]");
		settings.Add("spring_hidden_hotspring",false,"Blowing Head,Bling Bauble [S4]");
		settings.Add("spring_jailhouse_japes",false,"Way from Waterfall to Unders [S5]");
		settings.Add("spring_shoddy_shanty",false,"Church of the Space Monks [S6]");
		settings.Add("spring_sleek_slabs",false,"Marrow Hills Waterfall to Hideout [S7]");
		settings.Add("spring_tiny_broad",false,"Steam Slug [S8]");
		settings.Add("spring_tortoise_tunnel",false,"Way to Unders and Up to Glowmoths [S9]");
		settings.Add("spring_yokos_yam",false,"Spina Boss,Preasure Fight [Sa]");
//Items
	settings.CurrentDefaultParent="mains";
		settings.Add("collectible",false,"Wickerling (8 Splits)");
		settings.Add("wallet",false,"Wallet Upgrades (10 Splits)");
		settings.Add("summons",false,"Summons");
		settings.Add("instrument_pile",false,"Ceremony Instruments");
		settings.Add("sootling_leash",false,"Sootling Leash");
	settings.CurrentDefaultParent="abilities";
		settings.Add("abilities/map",false,"Island Map");
		settings.Add("abilities/partyhorn",false,"Noismaker");
		settings.Add("abilities/mailbag",false,"Mail bag");
		settings.Add("abilities/speed",false,"Grand Postmaster Badge");
		settings.Add("abilities/double_fruit",false,"Boon of Plenty!");
		settings.Add("abilities/slug_vaccum",false,"Slug Vacuum");
		settings.Add("abilities/slug_upgrade",false,"Slug Vacuum Deluxe");
		settings.Add("abilities/kickback",false,"Kickback");
		settings.Add("abilities/dive",false,"Dive Fish");
		settings.Add("abilities/dive_speed",false,"Fast Dive Fish");
		settings.Add("abilities/hook",false,"Sootling on a Leash");
	settings.CurrentDefaultParent="keys";
		settings.Add("bluekey",false,"Blue Key");
		settings.Add("greenkey",false,"Green Key");
		settings.Add("spring_key",false,"Key to the Underbelly");
		settings.Add("nim_key",false,"Nim Key");
	settings.CurrentDefaultParent="packages";
		settings.Add("package_1",false,"Overdue Package for Treek");
		settings.Add("package_2",false,"Overdue Package for Sin");
		settings.Add("package_3",false,"Overdue Package for Quinbe");
	settings.CurrentDefaultParent="beanstalk";
		settings.Add("bucket_empty",false,"Empty Bucket");
		settings.Add("bucket_full",false,"Bucket of Spring Water");
		settings.Add("guano",false,"Guano");
		settings.Add("seed_pod",false,"Seed Pod");
	settings.CurrentDefaultParent="willos";
		settings.Add("nugget",false,"4 Smashed piece of Statue");
		settings.Add("idol1",false,"Statue Chunk");
		settings.Add("idol2",false,"Statue Piece 2");
		settings.Add("idol3",false,"Statue Piece 3");
		settings.Add("idol4",false,"Statue Piece 4");
	settings.CurrentDefaultParent="rinris";
		settings.Add("spores_1",false,"Light Spores");
		settings.Add("spores_2",false,"Dry Spores");
		settings.Add("spores_3",false,"Damp Spores");
		settings.Add("spores_4",false,"Annoyed Spores");
		settings.Add("spores_5",false,"Frosty Spores");
	settings.CurrentDefaultParent="skins";
		settings.Add("skins/skin_1",false,"Bling Sprinkles");
		settings.Add("skins/skin_2",false,"Creepy Sprinkles");
		settings.Add("skins/skin_3",false,"Deadly Sprinkles");
		settings.Add("skins/skin_4",false,"Crimson Sprinkles");
		settings.Add("skins/skin_5",false,"Sweet Sprinkles");
	settings.CurrentDefaultParent="tracker";
		settings.Add("treasure_map",false,"Treasure Map");
		settings.Add("tracker_caves",false,"Tracker: Crystal Deep");
		settings.Add("tracker_jungle",false,"Tracker: Gorilla Woods");
		settings.Add("tracker_peak",false,"Tracker: Ivory Peaks");
		settings.Add("tracker_springs",false,"Tracker: Marrow Hill");
		settings.Add("tracker_scarabs",false,"Scarab Tracker");
	settings.CurrentDefaultParent="others";
		settings.Add("powerups/skvader_1",false,"Skvader");
		settings.Add("powerups/skvader_2",false,"Fat Skvader");
	settings.CurrentDefaultParent="othersside";
		settings.Add("traitor_spirit",false,"Traitor Spirit");
		settings.Add("tadpole",false,"Tadpole");
		settings.Add("dustbunny_dirty",false,"Sootling");
		settings.Add("mushroom_2",false,"Juicy Cove Mushroom");
		settings.Add("mushroom_3",false,"Poison Toadstool");
		settings.Add("toolbox",false,"Toolbox");
		settings.Add("postal_badge",false,"Old Postal Badge");
		settings.Add("sad_spider",false,"Sad Spiderling");
//Extraitems
	settings.CurrentDefaultParent="abilities/kickback";
		settings.Add("abilities/kickback2",false,"Kickback 2");
//State	
	settings.CurrentDefaultParent="othersplits";
		settings.Add("fruits",false,"Fruits");
		settings.Add("totems",false,"Totems");
		settings.Add("doorintr",false,"Door Introduction");
		settings.Add("ebontalk",false,"Talk to Ebon");
		settings.Add("bossboon",false,"Boss Boon");
		settings.Add("bosssal",false,"Boss Sal");
		settings.Add("bossspina",false,"Boss Spina");
		settings.Add("endbossdead",false,"Endboss Dead");
	settings.CurrentDefaultParent="fruits";
		settings.Add("fruit100",false,"Fruits 100");settings.SetToolTip("fruit100","Check this Option if you want to run Fruits 100");
		settings.Add("fruit600",false,"Fruits 600");settings.SetToolTip("fruit600","Check this Option if you want to run Fruits 600");
//DebugLog
	Action<string>Log=(text)=>{
	print("Autosplitter| "+text);};
vars.Log = Log;}

shutdown {//runs when the script gets unloaded (disabling autosplitter,closing LiveSplit,changing splits)	
}

init {//runs if the given process has been found (can occur multiple times during a session;if you reopen the game as an example)	
}

exit {//runs when the attached process exits/dies	
}

update {//always runs ,return false => prevents isLoading{},gameTime{},reset{}
	return true;
}

isLoading {//only runs when the timer's active (will be skipped if update{}'s returning false) ,return true => pauses the GameTime-Timer till the next tick
}

gameTime {//only runs when the timer's active (will be skipped if update{}'s returning false) ,return TimeSpan object => sets the GameTime-Timer to the passed time 
}

reset {//only runs when the timer's started or paused (will be skipped if update{}'s returning false) ,return true => triggers a reset
	if(String.IsNullOrEmpty(current.GameTime)){}else{
		if(current.GameTime.Equals("ms5\n00:00:00.0")){
			vars.Log("Resetted");return true;}}
}

split {//only runs when the timer's running (and skipped if reset{} returns true) ,return true => triggers a split
//Level 
	if(String.IsNullOrEmpty(current.LevelName)){}else{
	if(vars.cave_abyssal_access==1&&current.LevelName.Equals("ms6\ncave_abyssal_access")){vars.Log("Split: Door Friends Bottom Left [C0]");vars.cave_abyssal_access=0;return true;}
	if(vars.cave_beach_bottom==1&&current.LevelName.Equals("ms6\ncave_beach_bottom")){vars.Log("Split: Ocean Right [C1]");vars.cave_beach_bottom=0;return true;}
	if(vars.cave_beaver_blockade==1&&current.LevelName.Equals("ms6\ncave_beaver_blockade")){vars.Log("Split: Door Friends [C2]");vars.cave_beaver_blockade=0;return true;}
	if(vars.cave_boss==1&&current.LevelName.Equals("ms6\ncave_boss")){vars.Log("Split: Screetch [C3]");vars.cave_boss=0;return true;}
	if(vars.cave_clammy_cenote==1&&current.LevelName.Equals("ms6\ncave_clammy_cenote")){vars.Log("Split: The Dolphin [C4]");vars.cave_clammy_cenote=0;return true;}
	if(vars.cave_east_bay_shore==1&&current.LevelName.Equals("ms6\ncave_east_bay_shore")){vars.Log("Split: Beach Right [C5]");vars.cave_east_bay_shore=0;return true;}
	if(vars.cave_temple_terror_entrance==1&&current.LevelName.Equals("ms6\ncave_temple_terror_entrance")){vars.Log("Split: Temple Trials Entrance [C6]");vars.cave_temple_terror_entrance=0;return true;}
	if(vars.cave_temple_terror_lower==1&&current.LevelName.Equals("ms6\ncave_temple_terror_lower")){vars.Log("Split: Temple Trials [C7]");vars.cave_temple_terror_lower=0;return true;}
	if(vars.cave_temple_terror_treasury==1&&current.LevelName.Equals("ms6\ncave_temple_terror_treasury")){vars.Log("Split: Temple Treasury [C8]");vars.cave_temple_terror_treasury=0;return true;}
	if(vars.cave_temple_terror_upper==1&&current.LevelName.Equals("ms6\ncave_temple_terror_upper")){vars.Log("Split: God Egg [C9]");vars.cave_temple_terror_upper=0;return true;}
	if(vars.cave_winding_waterway==1&&current.LevelName.Equals("ms6\ncave_winding_waterway")){vars.Log("Split: Stupid Wickerling [CA]");vars.cave_winding_waterway=0;return true;}		
	if(vars.hub_bowel_bumping_left==1&&current.LevelName.Equals("ms6\nhub_bowel_bumping_left")){vars.Log("Split: Endboss [H0]");vars.hub_bowel_bumping_left=0;return true;}			
	if(vars.hub_cliffside_creek==1&&current.LevelName.Equals("ms6\nhub_cliffside_creek")){vars.Log("Split: Fleek Hidden Diva [H1]");vars.hub_cliffside_creek=0;return true;}
	if(vars.hub_festival==1&&current.LevelName.Equals("ms6\nhub_festival")){vars.Log("Split: Mokumas Pit [H2]");vars.hub_festival=0;return true;}
	if(vars.hub_festival_sky==1&&current.LevelName.Equals("ms6\nhub_festival_sky")){vars.Log("Split: Ivory Beeline [H3]");vars.hub_festival_sky=0;return true;}
	if(vars.hub_festival_upper==1&&current.LevelName.Equals("ms6\nhub_festival_upper")){vars.Log("Split: Ivory Beeline and Kazzo [H4]");vars.hub_festival_upper=0;return true;}
	if(vars.hub_hermits_home==1&&current.LevelName.Equals("ms6\nhub_hermits_home")){vars.Log("Split: Sin [H5]");vars.hub_hermits_home=0;return true;}
	if(vars.hub_island_express==1&&current.LevelName.Equals("ms6\nhub_island_express")){vars.Log("Split: Top of Tall Totem Tower [H6]");vars.hub_island_express=0;return true;}
	if(vars.hub_left_lemur_lane==1&&current.LevelName.Equals("ms6\nhub_left_lemur_lane")){vars.Log("Split: Sandros Bridge [H7]");vars.hub_left_lemur_lane=0;return true;}
	if(vars.hub_left_lofty_logo==1&&current.LevelName.Equals("ms6\nhub_left_lofty_logo")){vars.Log("Split: Titel Screen [H8]");vars.hub_left_lofty_logo=0;return true;}
	if(vars.hub_marrow_maze==1&&current.LevelName.Equals("ms6\nhub_marrow_maze")){vars.Log("Split: Endboss Maze [H9]");vars.hub_marrow_maze=0;return true;}
	if(vars.hub_obtainium_outland==1&&current.LevelName.Equals("ms6\nhub_obtainium_outland")){vars.Log("Split: Willos last Puzzlepiece [HA]");vars.hub_obtainium_outland=0;return true;}
	if(vars.hub_soaring_stone==1&&current.LevelName.Equals("ms6\nhub_soaring_stone")){vars.Log("Split: Woods Beeline [HB]");vars.hub_soaring_stone=0;return true;}
	if(vars.hub_village==1&&current.LevelName.Equals("ms6\nhub_village")){vars.Log("Split: Mokumana Village [HC]");vars.hub_village=0;return true;}
	if(vars.hub_white_cliff==1&&current.LevelName.Equals("ms6\nhub_white_cliff")){vars.Log("Split: Dipperloaf [HD]");vars.hub_white_cliff=0;return true;}
	if(vars.intro_landing==1&&current.LevelName.Equals("ms6\nintro_landing")){vars.Log("Split: Startarea [I0]");vars.intro_landing=0;return true;}
	if(vars.intro_landing_creepy_cavern==1&&current.LevelName.Equals("ms6\nintro_landing_creepy_cavern")){vars.Log("Split: Fosfor Skip [I1]");vars.intro_landing_creepy_cavern=0;return true;}
	if(vars.intro_landing_left==1&&current.LevelName.Equals("ms6\nintro_landing_left")){vars.Log("Split: Beach Left [I2]");vars.intro_landing_left=0;return true;}
	if(vars.intro_landing_right==1&&current.LevelName.Equals("ms6\nintro_landing_right")){vars.Log("Split: Sootlinghouse End of intro [I3]");vars.intro_landing_right=0;return true;}
	if(vars.intro_landing_upper==1&&current.LevelName.Equals("ms6\nintro_landing_upper")){vars.Log("Split: Noisemaker and Mushrooms [I4]");vars.intro_landing_upper=0;return true;}
	if(vars.intro_muddled_morass==1&&current.LevelName.Equals("ms6\nintro_muddled_morass")){vars.Log("Split: Fosfors Cave [I5]");vars.intro_muddled_morass=0;return true;}
	if(vars.intro_secret==1&&current.LevelName.Equals("ms6\nintro_secret")){vars.Log("Split: Ocean Left  [I6]");vars.intro_secret=0;return true;}
	if(vars.island_ending_2==1&&current.LevelName.Equals("ms6\nisland_ending_2")){vars.Log("Split: True End [I7]");vars.island_ending_2=0;return true;}	
	if(vars.jungle_canyon_caper==1&&current.LevelName.Equals("ms6\njungle_canyon_caper")){vars.Log("Split: Kickback Introduction [J0]");vars.jungle_canyon_caper=0;return true;}
	if(vars.jungle_crammed_canopy==1&&current.LevelName.Equals("ms6\njungle_crammed_canopy")){vars.Log("Split: Poleskip to Secret Cave [J1]");vars.jungle_crammed_canopy=0;return true;}
	if(vars.jungle_misty_meadow==1&&current.LevelName.Equals("ms6\njungle_misty_meadow")){vars.Log("Split: Meadow slugvacuum shed [J2]");vars.jungle_misty_meadow=0;return true;}
	if(vars.jungle_mollusc_madness==1&&current.LevelName.Equals("ms6\njungle_mollusc_madness")){vars.Log("Split: Slug Introduction [J3]");vars.jungle_mollusc_madness=0;return true;}
	if(vars.jungle_roots==1&&current.LevelName.Equals("ms6\njungle_roots")){vars.Log("Split: Juicery and introshoot [J4]");vars.jungle_roots=0;return true;}
	if(vars.jungle_secluded_climb==1&&current.LevelName.Equals("ms6\njungle_secluded_climb")){vars.Log("Split: Climb to Waterfallskvader [J5]");vars.jungle_secluded_climb=0;return true;}
	if(vars.jungle_slug_struggle==1&&current.LevelName.Equals("ms6\njungle_slug_struggle")){vars.Log("Split: Great Ape [J6]");vars.jungle_slug_struggle=0;return true;}
	if(vars.jungle_spikey_stockade==1&&current.LevelName.Equals("ms6\njungle_spikey_stockade")){vars.Log("Split: Secret Cave [J7]");vars.jungle_spikey_stockade=0;return true;}
	if(vars.jungle_tall_tall_tower==1&&current.LevelName.Equals("ms6\njungle_tall_tall_tower")){vars.Log("Split: Tall Totem Tower [J8]");vars.jungle_tall_tall_tower=0;return true;}
	if(vars.jungle_willy==1&&current.LevelName.Equals("ms6\njungle_willy")){vars.Log("Split: Willo Queststart [J9]");vars.jungle_willy=0;return true;}	
	if(vars.peak_aerial_ascent==1&&current.LevelName.Equals("ms6\npeak_aerial_ascent")){vars.Log("Split: Obtainum-ore Station [P0]");vars.peak_aerial_ascent=0;return true;}	
	if(vars.peak_beanstalk_base==1&&current.LevelName.Equals("ms6\npeak_beanstalk_base")){vars.Log("Split: Basecamp,Beanstalk [P1]");vars.peak_beanstalk_base=0;return true;}	
	if(vars.peak_crooked_cliff==1&&current.LevelName.Equals("ms6\npeak_crooked_cliff")){vars.Log("Split: Up the Beanstalk [P2]");vars.peak_crooked_cliff=0;return true;}	
	if(vars.peak_crystal_crater==1&&current.LevelName.Equals("ms6\npeak_crystal_crater")){vars.Log("Split: Willo at Ivory Crater [P3]");vars.peak_crystal_crater=0;return true;}	
	if(vars.peak_filthy_flat==1&&current.LevelName.Equals("ms6\npeak_filthy_flat")){vars.Log("Split: Lighthouse [P4]");vars.peak_filthy_flat=0;return true;}	
	if(vars.peak_frostpine_forest==1&&current.LevelName.Equals("ms6\npeak_frostpine_forest")){vars.Log("Split: Sootlingcaves [P5]");vars.peak_frostpine_forest=0;return true;}	
	if(vars.peak_guano_grief==1&&current.LevelName.Equals("ms6\npeak_guano_grief")){vars.Log("Split: Guano Tower [P6]");vars.peak_guano_grief=0;return true;}	
	if(vars.peak_ice_cold_idol==1&&current.LevelName.Equals("ms6\npeak_ice_cold_idol")){vars.Log("Split: Water-Fountain [P7]");vars.peak_ice_cold_idol=0;return true;}	
	if(vars.peak_obtainium_oracle==1&&current.LevelName.Equals("ms6\npeak_obtainium_oracle")){vars.Log("Split: Ojva,Trivial Facts [P8]");vars.peak_obtainium_oracle=0;return true;}	
	if(vars.peak_sky==1&&current.LevelName.Equals("ms6\npeak_sky")){vars.Log("Split: Ivory Beeline [P9]");vars.peak_sky=0;return true;}	
	if(vars.peak_spacemonk_mystery==1&&current.LevelName.Equals("ms6\npeak_spacemonk_mystery")){vars.Log("Split: Spacemonk Spaceship [PA]");vars.peak_spacemonk_mystery=0;return true;}	
	if(vars.peak_spider_fight==1&&current.LevelName.Equals("ms6\npeak_spider_fight")){vars.Log("Split: Boon Boss,Spider Fight [PB]");vars.peak_spider_fight=0;return true;}	
	if(vars.peak_underside==1&&current.LevelName.Equals("ms6\npeak_underside")){vars.Log("Split: Fountain/Town-skip [PC]");vars.peak_underside=0;return true;}	
	if(vars.spring_bubbly_basin==1&&current.LevelName.Equals("ms6\nspring_bubbly_basin")){vars.Log("Split: Hidden Sanctuary [S0]");vars.spring_bubbly_basin=0;return true;}	
	if(vars.spring_cloudburst_cliffs==1&&current.LevelName.Equals("ms6\nspring_cloudburst_cliffs")){vars.Log("Split: Great Falls,Waterfall [S1]");vars.spring_cloudburst_cliffs=0;return true;}	
	if(vars.spring_gangway_grotto==1&&current.LevelName.Equals("ms6\nspring_gangway_grotto")){vars.Log("Split: Skullgang Hideout [S2]");vars.spring_gangway_grotto=0;return true;}	
	if(vars.spring_hazy_heaven==1&&current.LevelName.Equals("ms6\nspring_hazy_heaven")){vars.Log("Split: Marrow Hills Beeline [S3]");vars.spring_hazy_heaven=0;return true;}	
	if(vars.spring_hidden_hotspring==1&&current.LevelName.Equals("ms6\nspring_hidden_hotspring")){vars.Log("Split: Blowing Head,Bling Bauble [S4]");vars.spring_hidden_hotspring=0;return true;}	
	if(vars.spring_jailhouse_japes==1&&current.LevelName.Equals("ms6\nspring_jailhouse_japes")){vars.Log("Split: Way from Waterfall to Unders [S5]");vars.spring_jailhouse_japes=0;return true;}	
	if(vars.spring_shoddy_shanty==1&&current.LevelName.Equals("ms6\nspring_shoddy_shanty")){vars.Log("Split: Church of the Space Monks [S6]");vars.spring_shoddy_shanty=0;return true;}	
	if(vars.spring_sleek_slabs==1&&current.LevelName.Equals("ms6\nspring_sleek_slabs")){vars.Log("Split: Marrow Hills Waterfall to Hideout [S7]");vars.spring_sleek_slabs=0;return true;}	
	if(vars.spring_tiny_broad==1&&current.LevelName.Equals("ms6\nspring_tiny_broad")){vars.Log("Split: Steam Slug [S8]");vars.spring_tiny_broad=0;return true;}	
	if(vars.spring_tortoise_tunnel==1&&current.LevelName.Equals("ms6\nspring_tortoise_tunnel")){vars.Log("Split: Way to Unders and Up to Glowmoths [S9]");vars.spring_tortoise_tunnel=0;return true;}	
	if(vars.spring_yokos_yam==1&&current.LevelName.Equals("ms6\nspring_yokos_yam")){vars.Log("Split: Spina Boss,Preasure Fight [Sa]");vars.spring_yokos_yam=0;return true;}}
//Items 
	if(String.IsNullOrEmpty(current.GameItem)){}else{
	if(vars.collectible>=0){
		if(vars.countcollect==80){vars.collectible=0;vars.countcollect=0;}
		if(vars.collectible==1){if(current.GameItem.Equals("ms2\ncollectible:1")||current.GameItem.Equals("ms2\ncollectible:11")||current.GameItem.Equals("ms2\ncollectible:21")||current.GameItem.Equals("ms2\ncollectible:31")||current.GameItem.Equals("ms2\ncollectible:41")||current.GameItem.Equals("ms2\ncollectible:51")||current.GameItem.Equals("ms2\ncollectible:61")||current.GameItem.Equals("ms2\ncollectible:71")){
			vars.countcollect=vars.countcollect+1;vars.collectible=2;}}
		if(vars.collectible==2){if(current.GameItem.Equals("ms2\ncollectible:2")||current.GameItem.Equals("ms2\ncollectible:12")||current.GameItem.Equals("ms2\ncollectible:22")||current.GameItem.Equals("ms2\ncollectible:32")||current.GameItem.Equals("ms2\ncollectible:42")||current.GameItem.Equals("ms2\ncollectible:52")||current.GameItem.Equals("ms2\ncollectible:62")||current.GameItem.Equals("ms2\ncollectible:72")){
			vars.countcollect=vars.countcollect+1;vars.collectible=3;}}
		if(vars.collectible==3){if(current.GameItem.Equals("ms2\ncollectible:3")||current.GameItem.Equals("ms2\ncollectible:13")||current.GameItem.Equals("ms2\ncollectible:23")||current.GameItem.Equals("ms2\ncollectible:33")||current.GameItem.Equals("ms2\ncollectible:43")||current.GameItem.Equals("ms2\ncollectible:53")||current.GameItem.Equals("ms2\ncollectible:63")||current.GameItem.Equals("ms2\ncollectible:73")){
			vars.countcollect=vars.countcollect+1;vars.collectible=4;}}
		if(vars.collectible==4){if(current.GameItem.Equals("ms2\ncollectible:4")||current.GameItem.Equals("ms2\ncollectible:14")||current.GameItem.Equals("ms2\ncollectible:24")||current.GameItem.Equals("ms2\ncollectible:34")||current.GameItem.Equals("ms2\ncollectible:44")||current.GameItem.Equals("ms2\ncollectible:54")||current.GameItem.Equals("ms2\ncollectible:64")||current.GameItem.Equals("ms2\ncollectible:74")){
			vars.countcollect=vars.countcollect+1;vars.collectible=5;}}
		if(vars.collectible==5){if(current.GameItem.Equals("ms2\ncollectible:5")||current.GameItem.Equals("ms2\ncollectible:15")||current.GameItem.Equals("ms2\ncollectible:25")||current.GameItem.Equals("ms2\ncollectible:35")||current.GameItem.Equals("ms2\ncollectible:45")||current.GameItem.Equals("ms2\ncollectible:55")||current.GameItem.Equals("ms2\ncollectible:65")||current.GameItem.Equals("ms2\ncollectible:75")){
			vars.countcollect=vars.countcollect+1;vars.collectible=6;}}
		if(vars.collectible==6){if(current.GameItem.Equals("ms2\ncollectible:6")||current.GameItem.Equals("ms2\ncollectible:16")||current.GameItem.Equals("ms2\ncollectible:26")||current.GameItem.Equals("ms2\ncollectible:36")||current.GameItem.Equals("ms2\ncollectible:46")||current.GameItem.Equals("ms2\ncollectible:56")||current.GameItem.Equals("ms2\ncollectible:66")||current.GameItem.Equals("ms2\ncollectible:76")){
			vars.countcollect=vars.countcollect+1;vars.collectible=7;}}
		if(vars.collectible==7){if(current.GameItem.Equals("ms2\ncollectible:7")||current.GameItem.Equals("ms2\ncollectible:17")||current.GameItem.Equals("ms2\ncollectible:27")||current.GameItem.Equals("ms2\ncollectible:37")||current.GameItem.Equals("ms2\ncollectible:47")||current.GameItem.Equals("ms2\ncollectible:57")||current.GameItem.Equals("ms2\ncollectible:67")||current.GameItem.Equals("ms2\ncollectible:77")){
			vars.countcollect=vars.countcollect+1;vars.collectible=8;}}
		if(vars.collectible==8){if(current.GameItem.Equals("ms2\ncollectible:8")||current.GameItem.Equals("ms2\ncollectible:18")||current.GameItem.Equals("ms2\ncollectible:28")||current.GameItem.Equals("ms2\ncollectible:38")||current.GameItem.Equals("ms2\ncollectible:48")||current.GameItem.Equals("ms2\ncollectible:58")||current.GameItem.Equals("ms2\ncollectible:68")||current.GameItem.Equals("ms2\ncollectible:78")){
			vars.countcollect=vars.countcollect+1;vars.collectible=9;}}
		if(vars.collectible==9){if(current.GameItem.Equals("ms2\ncollectible:9")||current.GameItem.Equals("ms2\ncollectible:19")||current.GameItem.Equals("ms2\ncollectible:29")||current.GameItem.Equals("ms2\ncollectible:39")||current.GameItem.Equals("ms2\ncollectible:49")||current.GameItem.Equals("ms2\ncollectible:59")||current.GameItem.Equals("ms2\ncollectible:69")||current.GameItem.Equals("ms2\ncollectible:79")){
			vars.countcollect=vars.countcollect+1;vars.collectible=10;}}
		if(vars.collectible==10){if(current.GameItem.Equals("ms2\ncollectible:10")||current.GameItem.Equals("ms2\ncollectible:20")||current.GameItem.Equals("ms2\ncollectible:30")||current.GameItem.Equals("ms2\ncollectible:40")||current.GameItem.Equals("ms2\ncollectible:50")||current.GameItem.Equals("ms2\ncollectible:60")||current.GameItem.Equals("ms2\ncollectible:70")||current.GameItem.Equals("ms2\ncollectible:80")){
			vars.countcollect=vars.countcollect+1;vars.collectible=1;vars.Log("Split: 10 Wickerlinge");return true;}}}
	if(vars.nugget>=1){
		if(vars.nugget==1&&current.GameItem.Equals("ms2\nnugget:1")){vars.Log("Split: Smashed piece of Statue 1");vars.nugget=2;return true;}
		if(vars.nugget==2&&current.GameItem.Equals("ms2\nnugget:2")){vars.Log("Split: Smashed piece of Statue 2");vars.nugget=3;return true;}
		if(vars.nugget==3&&current.GameItem.Equals("ms2\nnugget:3")){vars.Log("Split: Smashed piece of Statue 3");vars.nugget=4;return true;}
		if(vars.nugget==4&&current.GameItem.Equals("ms2\nnugget:4")){vars.Log("Split: Smashed piece of Statue 4");vars.nugget=0;return true;}}
	if(vars.tadpole>=1){
		if(vars.counttadpole==8){vars.tadpole=0;vars.counttadpole=0;}
		if(current.GameItem.Equals("ms3\ntadpole:0")){vars.tadpole=1;}
		if(vars.tadpole==1&&current.GameItem.Equals("ms2\ntadpole:1")){vars.Log("Split: Tadpole 1");vars.counttadpole=vars.counttadpole+1;vars.tadpole=2;return true;}
		if(vars.tadpole==2&&current.GameItem.Equals("ms2\ntadpole:2")){vars.Log("Split: Tadpole 2");vars.counttadpole=vars.counttadpole+1;vars.tadpole=3;return true;}
		if(vars.tadpole==3&&current.GameItem.Equals("ms2\ntadpole:3")){vars.Log("Split: Tadpole 3");vars.counttadpole=vars.counttadpole+1;vars.tadpole=4;return true;}
		if(vars.tadpole==4&&current.GameItem.Equals("ms2\ntadpole:4")){vars.Log("Split: Tadpole 4");vars.counttadpole=vars.counttadpole+1;vars.tadpole=5;return true;}
		if(vars.tadpole==5&&current.GameItem.Equals("ms2\ntadpole:5")){vars.Log("Split: Tadpole 5");vars.counttadpole=vars.counttadpole+1;vars.tadpole=6;return true;}
		if(vars.tadpole==6&&current.GameItem.Equals("ms2\ntadpole:6")){vars.Log("Split: Tadpole 6");vars.counttadpole=vars.counttadpole+1;vars.tadpole=7;return true;}
		if(vars.tadpole==7&&current.GameItem.Equals("ms2\ntadpole:7")){vars.Log("Split: Tadpole 7");vars.counttadpole=vars.counttadpole+1;vars.tadpole=8;return true;}
		if(vars.tadpole==8&&current.GameItem.Equals("ms2\ntadpole:8")){vars.Log("Split: Tadpole 8");vars.counttadpole=vars.counttadpole+1;return true;}}
	if(vars.traitor>=1){
		if(vars.counttraitor==4){vars.counttraitor=0;vars.traitor=0;}
		if(current.GameItem.Equals("ms3\ntraitor_spirit:0")){vars.traitor=1;}
		if(vars.traitor==1&&current.GameItem.Equals("ms2\ntraitor_spirit:1")){vars.Log("Split: Traitor Spirit 1");vars.counttraitor=vars.counttraitor+1;vars.traitor=2;return true;}
		if(vars.traitor==2&&current.GameItem.Equals("ms2\ntraitor_spirit:2")){vars.Log("Split: Traitor Spirit 2");vars.counttraitor=vars.counttraitor+1;vars.traitor=3;return true;}
		if(vars.traitor==3&&current.GameItem.Equals("ms2\ntraitor_spirit:3")){vars.Log("Split: Traitor Spirit 3");vars.counttraitor=vars.counttraitor+1;vars.traitor=4;return true;}
		if(vars.traitor==4&&current.GameItem.Equals("ms2\ntraitor_spirit:4")){vars.Log("Split: Traitor Spirit 4");vars.counttraitor=vars.counttraitor+1;;return true;}}
	if(vars.dustbunny>=1){
		if(vars.countdustbunny==6){vars.countdustbunny=0;vars.dustbunny=0;}
		if(current.GameItem.Equals("ms3\ndustbunny_dirty:0")){vars.dustbunny=1;}
		if(vars.dustbunny==1&&current.GameItem.Equals("ms2\ndustbunny_dirty:1")){vars.Log("Split: Sootling 1");vars.countdustbunny=vars.countdustbunny+1;vars.dustbunny=2;return true;}
		if(vars.dustbunny==2&&current.GameItem.Equals("ms2\ndustbunny_dirty:2")){vars.Log("Split: Sootling 2");vars.countdustbunny=vars.countdustbunny+1;vars.dustbunny=3;return true;}
		if(vars.dustbunny==3&&current.GameItem.Equals("ms2\ndustbunny_dirty:3")){vars.Log("Split: Sootling 3");vars.countdustbunny=vars.countdustbunny+1;vars.dustbunny=4;return true;}
		if(vars.dustbunny==4&&current.GameItem.Equals("ms2\ndustbunny_dirty:4")){vars.Log("Split: Sootling 4");vars.countdustbunny=vars.countdustbunny+1;vars.dustbunny=5;return true;}
		if(vars.dustbunny==5&&current.GameItem.Equals("ms2\ndustbunny_dirty:5")){vars.Log("Split: Sootling 5");vars.countdustbunny=vars.countdustbunny+1;vars.dustbunny=6;return true;}
		if(vars.dustbunny==6&&current.GameItem.Equals("ms2\ndustbunny_dirty:6")){vars.Log("Split: Sootling 6");vars.countdustbunny=vars.countdustbunny+1;return true;}}
	if(vars.wallet>=1){
		if(vars.wallet==1&&current.GameItem.Equals("ms2\nwallet:1")){vars.Log("Split: Wallet Upgrades 1");vars.wallet=2;return true;}
		if(vars.wallet==2&&current.GameItem.Equals("ms2\nwallet:2")){vars.Log("Split: Wallet Upgrades 2");vars.wallet=3;return true;}
		if(vars.wallet==3&&current.GameItem.Equals("ms2\nwallet:3")){vars.Log("Split: Wallet Upgrades 3");vars.wallet=4;return true;}
		if(vars.wallet==4&&current.GameItem.Equals("ms2\nwallet:4")){vars.Log("Split: Wallet Upgrades 4");vars.wallet=5;return true;}
		if(vars.wallet==5&&current.GameItem.Equals("ms2\nwallet:5")){vars.Log("Split: Wallet Upgrades 5");vars.wallet=6;return true;}
		if(vars.wallet==6&&current.GameItem.Equals("ms2\nwallet:6")){vars.Log("Split: Wallet Upgrades 6");vars.wallet=7;return true;}
		if(vars.wallet==7&&current.GameItem.Equals("ms2\nwallet:7")){vars.Log("Split: Wallet Upgrades 7");vars.wallet=8;return true;}
		if(vars.wallet==8&&current.GameItem.Equals("ms2\nwallet:8")){vars.Log("Split: Wallet Upgrades 8");vars.wallet=9;return true;}
		if(vars.wallet==9&&current.GameItem.Equals("ms2\nwallet:9")){vars.Log("Split: Wallet Upgrades 9");vars.wallet=10;return true;}
		if(vars.wallet==10&&current.GameItem.Equals("ms2\nwallet:10")){vars.Log("Split: Wallet Upgrades 10");vars.wallet=0;return true;}}
	if(vars.abilities_map==1&&current.GameItem.Equals("ms2\nabilities/map:1")){vars.Log("Split: Map");vars.abilities_map=0;return true;}
	if(vars.abilities_partyhorn==1&&current.GameItem.Equals("ms2\nabilities/partyhorn:1")){vars.Log("Split: Noismaker");vars.abilities_partyhorn=0;return true;}
	if(vars.abilities_mailbag==1&&current.GameItem.Equals("ms2\nabilities/mailbag:1")){vars.Log("Split: Mail bag");vars.abilities_mailbag=0;return true;}
	if(vars.abilities_speed==1&&current.GameItem.Equals("ms2\nabilities/speed:1")){vars.Log("Split: Grand Postmaster Badge");vars.abilities_speed=0;return true;}
	if(vars.abilities_double_fruit==1&&current.GameItem.Equals("ms2\nabilities/double_fruit:1")){vars.Log("Split: Boon of Plenty!");vars.abilities_double_fruit=0;return true;}
	if(vars.abilities_slug_vaccum==1&&current.GameItem.Equals("ms2\nabilities/slug_vaccum:1")){vars.Log("Split: Slug Vacuum");vars.abilities_slug_vaccum=0;return true;}
	if(vars.abilities_slug_upgrade==1&&current.GameItem.Equals("ms2\nabilities/slug_upgrade:1")){vars.Log("Split: Slug Vacuum Deluxe");vars.abilities_slug_upgrade=0;return true;}	
	if(vars.abilities_kickback==1&&current.GameItem.Equals("ms2\nabilities/kickback:1")){vars.Log("Split: Kickback");vars.abilities_kickback=0;return true;}
		if(vars.abilities_kickback2==1&&current.GameItem.Equals("ms2\nabilities/kickback:2")){vars.Log("Split: Kickback 2");vars.abilities_kickback2=0;return true;}
		if(vars.abilities_kickback2==1&&current.GameItem.Equals("ms3\nabilities/kickback:0")){vars.abilities_kickback2=0;vars.kickback2=1;}
			if(vars.kickback2==1&&current.GameItem.Equals("ms2\nabilities/kickback:1")){vars.Log("Split: Kickback 2");vars.kickback2=0;return true;}	
	if(vars.abilities_dive==1&&current.GameItem.Equals("ms2\nabilities/dive:1")){vars.Log("Split: Dive Fish");vars.abilities_dive=0;return true;}
	if(vars.abilities_dive_speed==1&&current.GameItem.Equals("ms2\nabilities/dive_speed:1")){vars.Log("Split: Fast Dive Fish");vars.abilities_dive_speed=0;return true;}
	if(vars.abilities_hook==1&&current.GameItem.Equals("ms2\nabilities/hook:1")){vars.Log("Split: Sootling on a Leash");vars.abilities_hook=0;return true;}
	if(vars.sootling_leash==1&&current.GameItem.Equals("ms2\nsootling_leash:1")){vars.Log("Split: Sootling Leash");vars.sootling_leash=0;return true;}
	if(vars.bucket_empty==1&&current.GameItem.Equals("ms2\nbucket_empty:1")){vars.Log("Split: Empty Bucket");vars.bucket_empty=0;return true;}
	if(vars.bucket_full==1&&current.GameItem.Equals("ms2\nbucket_full:1")){vars.Log("Split: Bucket of Spring Water");vars.bucket_full=0;return true;}
	if(vars.guano==1&&current.GameItem.Equals("ms2\nguano:1")){vars.Log("Split: Guano");vars.guano=0;return true;}
	if(vars.seed_pod==1&&current.GameItem.Equals("ms2\nseed_pod:1")){vars.Log("Split: Seed Pod");vars.seed_pod=0;return true;}
	if(vars.bluekey==1&&current.GameItem.Equals("ms2\nbluekey:1")){vars.Log("Split: Blue Key");vars.bluekey=0;return true;}
	if(vars.greenkey==1&&current.GameItem.Equals("ms2\ngreenkey:1")){vars.Log("Split: Green Key");vars.greenkey=0;return true;}
	if(vars.spring_key==1&&current.GameItem.Equals("ms2\nspring_key:1")){vars.Log("Split: Key to the Underbelly");vars.spring_key=0;return true;}
	if(vars.nim_key==1&&current.GameItem.Equals("ms2\nnim_key:1")){vars.Log("Split: Nims Key");vars.nim_key=0;return true;}
	if(vars.instrument_pile==1&&current.GameItem.Equals("ms2\ninstrument_pile:1")){vars.Log("Split: Ceremony Instruments");vars.instrument_pile=0;return true;}
	if(vars.toolbox==1&&current.GameItem.Equals("ms2\ntoolbox:1")){vars.Log("Split: Toolbox");vars.toolbox=0;return true;}
	if(vars.sad_spider==1&&current.GameItem.Equals("ms2\nsad_spider:1")){vars.Log("Split: Sad Spiderling");vars.sad_spider=0;return true;}
	if(vars.postal_badge==1&&current.GameItem.Equals("ms2\npostal_badge:1")){vars.Log("Split: Old Postal Badge");vars.postal_badge=0;return true;}
	if(vars.treasure_map==1&&current.GameItem.Equals("ms2\ntreasure_map:1")){vars.Log("Split: Treasure Map");vars.treasure_map=0;return true;}
	if(vars.mushroom_2==1&&current.GameItem.Equals("ms2\nmushroom_2:1")){vars.Log("Split: Juicy Cove Mushroom");vars.mushroom_2=0;return true;}
	if(vars.mushroom_3==1&&current.GameItem.Equals("ms2\nmushroom_3:1")){vars.Log("Split: Poison Toadstool");vars.mushroom_3=0;return true;}
	if(vars.powerups_skvader_1==1&&current.GameItem.Equals("ms2\npowerups/skvader_1:1")){vars.Log("Split: Skvader");vars.powerups_skvader_1=0;return true;}
	if(vars.powerups_skvader_2==1&&current.GameItem.Equals("ms2\npowerups/skvader_2:1")){vars.Log("Split: Fat Skvader");vars.powerups_skvader_2=0;return true;}
	if(vars.package_3==1&&current.GameItem.Equals("ms2\npackage_3:1")){vars.Log("Split: Overdue Package for Quinbe");vars.package_3=0;return true;}
	if(vars.package_2==1&&current.GameItem.Equals("ms2\npackage_2:1")){vars.Log("Split: Overdue Package for Sin");vars.package_2=0;return true;}
	if(vars.package_1==1&&current.GameItem.Equals("ms2\npackage_1:1")){vars.Log("Split: Overdue Package for Treek");vars.package_1=0;return true;}
	if(vars.idol1==1&&current.GameItem.Equals("ms2\nidol1:1")){vars.Log("Split: Statue Chunk");vars.idol1=0;return true;}
	if(vars.idol2==1&&current.GameItem.Equals("ms2\nidol2:1")){vars.Log("Split: Statue Piece 2");vars.idol2=0;return true;}
	if(vars.idol3==1&&current.GameItem.Equals("ms2\nidol3:1")){vars.Log("Split: Statue Piece 3");vars.idol3=0;return true;}
	if(vars.idol4==1&&current.GameItem.Equals("ms2\nidol4:1")){vars.Log("Split: Statue Piece 4");vars.idol4=0;return true;}
	if(vars.spores_1==1&&current.GameItem.Equals("ms2\nspores_1:1")){vars.Log("Split: Light Spores");vars.spores_1=0;return true;}
	if(vars.spores_2==1&&current.GameItem.Equals("ms2\nspores_2:1")){vars.Log("Split: Dry Spores");vars.spores_2=0;return true;}
	if(vars.spores_3==1&&current.GameItem.Equals("ms2\nspores_3:1")){vars.Log("Split: Damp Spores");vars.spores_3=0;return true;}
	if(vars.spores_4==1&&current.GameItem.Equals("ms2\nspores_4:1")){vars.Log("Split: Annoyed Spores");vars.spores_4=0;return true;}
	if(vars.spores_5==1&&current.GameItem.Equals("ms2\nspores_5:1")){vars.Log("Split: Frosty Spores");vars.spores_5=0;return true;}
	if(vars.tracker_caves==1&&current.GameItem.Equals("ms2\ntracker_caves:1")){vars.Log("Split: Cave Tracker");vars.tracker_caves=0;return true;}
	if(vars.tracker_jungle==1&&current.GameItem.Equals("ms2\ntracker_jungle:1")){vars.Log("Split: Jungle Tracker");vars.tracker_jungle=0;return true;}
	if(vars.tracker_peak==1&&current.GameItem.Equals("ms2\ntracker_peak:1")){vars.Log("Split: Peak Tracker");vars.tracker_peak=0;return true;}
	if(vars.tracker_springs==1&&current.GameItem.Equals("ms2\ntracker_springs:1")){vars.Log("Split: Springs Tracker");vars.tracker_springs=0;return true;}
	if(vars.tracker_scarabs==1&&current.GameItem.Equals("ms2\ntracker_scarabs:1")){vars.Log("Split: Scarabs Tracker");vars.tracker_scarabs=0;return true;}
	if(vars.skins_skin_1==1&&current.GameItem.Equals("ms2\nskins/skin_1:1")){vars.Log("Split: Bling Sprinkles");vars.skins_skin_1=0;return true;}
	if(vars.skins_skin_2==1&&current.GameItem.Equals("ms2\nskins/skin_2:1")){vars.Log("Split: Creepy Sprinkles");vars.skins_skin_2=0;return true;}
	if(vars.skins_skin_3==1&&current.GameItem.Equals("ms2\nskins/skin_3:1")){vars.Log("Split: Deadly Sprinkles");vars.skins_skin_3=0;return true;}
	if(vars.skins_skin_4==1&&current.GameItem.Equals("ms2\nskins/skin_4:1")){vars.Log("Split: Crimson Sprinkles");vars.skins_skin_4=0;return true;}
	if(vars.skins_skin_5==1&&current.GameItem.Equals("ms2\nskins/skin_5:1")){vars.Log("Split: Sweet Sprinkles");vars.skins_skin_5=0;return true;}}
//State
	if(String.IsNullOrEmpty(current.GameState)){}else{
	if(vars.doorintr==1&&current.GameState.Equals("ms1\nintro_landing_creepy_cavern:327")){vars.Log("Split: Door Introduction");vars.doorintr=0;return true;}
	if(vars.endbossdead==1&&current.GameState.Equals("ms1\nhub_bowel_bumping_left:3246")){vars.Log("Split: Endboss dead");vars.endbossdead=0;return true;}
	if(vars.bossboon==1&&current.GameState.Equals("ms1\npeak_spacemonk_mystery:1436")){vars.Log("Split: Boss Boon");vars.bossboon=0;return true;}
	if(vars.bossspina==1&&current.GameState.Equals("ms1\nspring_gangway_grotto:4437")){vars.Log("Split: Boss Spina");vars.bossspina=0;return true;}
	if(vars.ebontalk==1&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4128")){vars.Log("Split: Talk to Ebon");vars.ebontalk=0;return true;}
	if(vars.bosssal==1&&current.GameState.Equals("ms1\nintro_landing_right:3644")){vars.Log("Split: Boss Sal");vars.bosssal=0;return true;}
	if(vars.totem>=1){	
		if(vars.totem==1&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4539")){vars.Log("Split: Totem 1");vars.totem=2;return true;}
		if(vars.totem==2&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4585")){vars.Log("Split: Totem 2");vars.totem=3;return true;}
		if(vars.totem==3&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4595")){vars.Log("Split: Totem 3");vars.totem=4;return true;}
		if(vars.totem==4&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4575")){vars.Log("Split: Totem 4");vars.totem=5;return true;}
		if(vars.totem==5&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4565")){vars.Log("Split: Totem 5");vars.totem=6;return true;}
		if(vars.totem==6&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4590")){vars.Log("Split: Totem 6");vars.totem=7;return true;}
		if(vars.totem==7&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4570")){vars.Log("Split: Totem 7");vars.totem=8;return true;}
		if(vars.totem==8&&current.GameState.Equals("ms1\ncave_temple_terror_upper:4685")){vars.Log("Split: Totem 8");vars.totem=0;return true;}}
	if(vars.fruit100==1&&current.GameFruits==100){vars.Log("Split: Fruits 600");vars.fruit100=0;return true;}
	if(vars.fruit600==1&&current.GameFruits==600){vars.Log("Split: Fruits 600");vars.fruit600=0;return true;}}
}

start {//only runs when the timer's paused ,return true => starts the timer
	if(settings["speedrun"]) {
		if(String.IsNullOrEmpty(current.GameTime)){}else{
		if(current.GameTime.Equals("ms5\n00:00:00.1")) {	
//Levels
			if(settings["cave_abyssal_access"]){vars.cave_abyssal_access=1;vars.Log("Aktiv: Door Friends Bottom Left [C0]");}else{vars.cave_abyssal_access=0;}
			if(settings["cave_beach_bottom"]){vars.cave_beach_bottom=1;vars.Log("Aktiv: Ocean Right [C1]");}else{vars.cave_beach_bottom=0;}
			if(settings["cave_beaver_blockade"]){vars.cave_beaver_blockade=1;vars.Log("Aktiv: Door Friends [C2]");}else{vars.cave_beaver_blockade=0;}
			if(settings["cave_boss"]){vars.cave_boss=1;vars.Log("Aktiv: Screetch [C3]");}else{vars.cave_boss=0;}
			if(settings["cave_clammy_cenote"]){vars.cave_clammy_cenote=1;vars.Log("Aktiv: The Dolphin [C4]");}else{vars.cave_clammy_cenote=0;}
			if(settings["cave_east_bay_shore"]){vars.cave_east_bay_shore=1;vars.Log("Aktiv: Beach Right [C5]");}else{vars.cave_east_bay_shore=0;}
			if(settings["cave_temple_terror_entrance"]){vars.cave_temple_terror_entrance=1;vars.Log("Aktiv: Temple Trials Entrance [C6]");}else{vars.cave_temple_terror_entrance=0;}
			if(settings["cave_temple_terror_lower"]){vars.cave_temple_terror_lower=1;vars.Log("Aktiv: Temple Trials [C7]");}else{vars.cave_temple_terror_lower=0;}
			if(settings["cave_temple_terror_treasury"]){vars.cave_temple_terror_treasury=1;vars.Log("Aktiv: Temple Treasury [C8]");}else{vars.cave_temple_terror_treasury=0;}
			if(settings["cave_temple_terror_upper"]){vars.cave_temple_terror_upper=1;vars.Log("Aktiv: God Egg [C9]");}else{vars.cave_temple_terror_upper=0;}
			if(settings["cave_winding_waterway"]){vars.cave_winding_waterway=1;vars.Log("Aktiv: Pitch,Stupid Wickerling [CA]");}else{vars.cave_winding_waterway=0;}			
			if(settings["hub_bowel_bumping_left"]||settings["any%true"]){vars.hub_bowel_bumping_left=1;vars.Log("Aktiv: Endboss [H0]");}else{vars.hub_bowel_bumping_left=0;}					
			if(settings["hub_cliffside_creek"]){vars.hub_cliffside_creek=1;vars.Log("Aktiv: Fleek Hidden Diva [H1]");}else{vars.hub_cliffside_creek=0;}
			if(settings["hub_festival"]){vars.hub_festival=1;vars.Log("Aktiv: Mokumas Pit [H2]");}else{vars.hub_festival=0;}
			if(settings["hub_festival_sky"]){vars.hub_festival_sky=1;vars.Log("Aktiv: Ivory Beeline [H3]");}else{vars.hub_festival_sky=0;}
			if(settings["hub_festival_upper"]){vars.hub_festival_upper=1;vars.Log("Aktiv: Ivory Beeline and Kazzo [H4]");}else{vars.hub_festival_upper=0;}
			if(settings["hub_hermits_home"]){vars.hub_hermits_home=1;vars.Log("Aktiv: Sin [H5]");}else{vars.hub_hermits_home=0;}
			if(settings["hub_island_express"]||settings["any%true"]){vars.hub_island_express=1;vars.Log("Aktiv: Top of Tall Totem Tower [H6]");}else{vars.hub_island_express=0;}
			if(settings["hub_left_lemur_lane"]){vars.hub_left_lemur_lane=1;vars.Log("Aktiv: Sandros Bridge [H7]");}else{vars.hub_left_lemur_lane=0;}
			if(settings["hub_left_lofty_logo"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]||settings["wallet%"]||settings["any%true"]){vars.hub_left_lofty_logo=1;vars.Log("Aktiv: Titel Screen [H8]");}else{vars.hub_left_lofty_logo=0;}
			if(settings["hub_marrow_maze"]){vars.hub_marrow_maze=1;vars.Log("Aktiv: Endboss Maze [H9]");}else{vars.hub_marrow_maze=0;}
			if(settings["hub_obtainium_outland"]){vars.hub_obtainium_outland=1;vars.Log("Aktiv: Willos last Puzzlepiece [HA]");}else{vars.hub_obtainium_outland=0;}
			if(settings["hub_soaring_stone"]){vars.hub_soaring_stone=1;vars.Log("Aktiv: Woods Beeline [HB]");}else{vars.hub_soaring_stone=0;}
			if(settings["hub_village"]){vars.hub_village=1;vars.Log("Aktiv: Mokumana Village [HC]");}else{vars.hub_village=0;}
			if(settings["hub_white_cliff"]){vars.hub_white_cliff=1;vars.Log("Aktiv: Dipperloaf [HD]");}else{vars.hub_white_cliff=0;}		
			if(settings["intro_landing"]){vars.intro_landing=1;vars.Log("Aktiv: Startarea [I0]");}else{vars.intro_landing=0;}
			if(settings["intro_landing_creepy_cavern"]){vars.intro_landing_creepy_cavern=1;vars.Log("Aktiv: Fosfor Skip [I1]");}else{vars.intro_landing_creepy_cavern=0;}
			if(settings["intro_landing_left"]){vars.intro_landing_left=1;vars.Log("Aktiv: Beach Left [I2]");}else{vars.intro_landing_left=0;}
			if(settings["intro_landing_right"]){vars.intro_landing_right=1;vars.Log("Aktiv: Sootlinghouse End of intro [I3]");}else{vars.intro_landing_right=0;}
			if(settings["intro_landing_upper"]){vars.intro_landing_upper=1;vars.Log("Aktiv: Noisemaker and Mushrooms [I4]");}else{vars.intro_landing_upper=0;}
			if(settings["intro_muddled_morass"]){vars.intro_muddled_morass=1;vars.Log("Aktiv: Fosfors Cave [I5]");}else{vars.intro_muddled_morass=0;}
			if(settings["intro_secret"]){vars.intro_secret=1;vars.Log("Aktiv: Ocean Left  [I6]");}else{vars.intro_secret=0;}								
			if(settings["island_ending_2"]||settings["trueend"]||settings["100%"]){vars.island_ending_2=1;vars.Log("Aktiv: True End [I7]");}else{vars.island_ending_2=0;}							
			if(settings["jungle_canyon_caper"]){vars.jungle_canyon_caper=1;vars.Log("Aktiv: Kickback Introduction [J0]");}else{vars.jungle_canyon_caper=0;}
			if(settings["jungle_crammed_canopy"]){vars.jungle_crammed_canopy=1;vars.Log("Aktiv: Poleskip to Secret Cave [J1]");}else{vars.jungle_crammed_canopy=0;}
			if(settings["jungle_misty_meadow"]){vars.jungle_misty_meadow=1;vars.Log("Aktiv: Meadow slugvacuum shed [J2]");}else{vars.jungle_misty_meadow=0;}
			if(settings["jungle_mollusc_madness"]){vars.jungle_mollusc_madness=1;vars.Log("Aktiv: Slug Introduction [J3]");}else{vars.jungle_mollusc_madness=0;}
			if(settings["jungle_roots"]){vars.jungle_roots=1;vars.Log("Aktiv: Juicery and introshoot [J4]");}else{vars.jungle_roots=0;}
			if(settings["jungle_secluded_climb"]){vars.jungle_secluded_climb=1;vars.Log("Aktiv: Climb to Waterfallskvader [J5]");}else{vars.jungle_secluded_climb=0;}
			if(settings["jungle_slug_struggle"]){vars.jungle_slug_struggle=1;vars.Log("Aktiv: Great Ape [J6]");}else{vars.jungle_slug_struggle=0;}
			if(settings["jungle_spikey_stockade"]){vars.jungle_spikey_stockade=1;vars.Log("Aktiv: Secret Cave [J7]");}else{vars.jungle_spikey_stockade=0;}
			if(settings["jungle_tall_tall_tower"]){vars.jungle_tall_tall_tower=1;vars.Log("Aktiv: Tall Totem Tower [J8]");}else{vars.jungle_tall_tall_tower=0;}
			if(settings["jungle_willy"]){vars.jungle_willy=1;vars.Log("Aktiv: Willo Queststart [J9]");}else{vars.jungle_willy=0;}		
			if(settings["peak_aerial_ascent"]){vars.peak_aerial_ascent=1;vars.Log("Aktiv: Obtainum-ore Station [P0]");}else{vars.peak_aerial_ascent=0;}	
			if(settings["peak_beanstalk_base"]){vars.peak_beanstalk_base=1;vars.Log("Aktiv: Basecamp,Beanstalk [P1]");}else{vars.peak_beanstalk_base=0;}	
			if(settings["peak_crooked_cliff"]){vars.peak_crooked_cliff=1;vars.Log("Aktiv: Up the Beanstalk [P2]");}else{vars.peak_crooked_cliff=0;}	
			if(settings["peak_crystal_crater"]){vars.peak_crystal_crater=1;vars.Log("Aktiv: Willo at Ivory Crater [P3]");}else{vars.peak_crystal_crater=0;}	
			if(settings["peak_filthy_flat"]){vars.peak_filthy_flat=1;vars.Log("Aktiv: Lighthouse [P4]");}else{vars.peak_filthy_flat=0;}	
			if(settings["peak_frostpine_forest"]){vars.peak_frostpine_forest=1;vars.Log("Aktiv: Sootlingcaves [P5]");}else{vars.peak_frostpine_forest=0;}	
			if(settings["peak_guano_grief"]){vars.peak_guano_grief=1;vars.Log("Aktiv: Guano Tower [P6]");}else{vars.peak_guano_grief=0;}	
			if(settings["peak_ice_cold_idol"]){vars.peak_ice_cold_idol=1;vars.Log("Aktiv: Water-Fountain [P7]");}else{vars.peak_ice_cold_idol=0;}	
			if(settings["peak_obtainium_oracle"]){vars.peak_obtainium_oracle=1;vars.Log("Aktiv: Ojva,Trivial Facts [P8]");}else{vars.peak_obtainium_oracle=0;}	
			if(settings["peak_sky"]){vars.peak_sky=1;vars.Log("Aktiv: Ivory Beeline [P9]");}else{vars.peak_sky=0;}	
			if(settings["peak_spacemonk_mystery"]){vars.peak_spacemonk_mystery=1;vars.Log("Aktiv: Spacemonk Spaceship [PA]");}else{vars.peak_spacemonk_mystery=0;}	
			if(settings["peak_spider_fight"]){vars.peak_spider_fight=1;vars.Log("Aktiv: Boon Boss,Spider Fight [PB]");}else{vars.peak_spider_fight=0;}	
			if(settings["peak_underside"]){vars.peak_underside=1;vars.Log("Aktiv: Fountain/Town-skip [PC]");}else{vars.peak_underside=0;}		
			if(settings["spring_bubbly_basin"]){vars.spring_bubbly_basin=1;vars.Log("Aktiv: Hidden Sanctuary [S0]");}else{vars.spring_bubbly_basin=0;}	
			if(settings["spring_cloudburst_cliffs"]){vars.spring_cloudburst_cliffs=1;vars.Log("Aktiv: Great Falls,Waterfall [S1]");}else{vars.spring_cloudburst_cliffs=0;}	
			if(settings["spring_gangway_grotto"]){vars.spring_gangway_grotto=1;vars.Log("Aktiv: Skullgang Hideout [S2]");}else{vars.spring_gangway_grotto=0;}	
			if(settings["spring_hazy_heaven"]){vars.spring_hazy_heaven=1;vars.Log("Aktiv: Marrow Hills Beeline [S3]");}else{vars.spring_hazy_heaven=0;}	
			if(settings["spring_hidden_hotspring"]){vars.spring_hidden_hotspring=1;vars.Log("Aktiv: Blowing Head,Bling Bauble [S4]");}else{vars.spring_hidden_hotspring=0;}	
			if(settings["spring_jailhouse_japes"]){vars.spring_jailhouse_japes=1;vars.Log("Aktiv: Way from Waterfall to Unders [S5]");}else{vars.spring_jailhouse_japes=0;}	
			if(settings["spring_shoddy_shanty"]){vars.spring_shoddy_shanty=1;vars.Log("Aktiv: Church of the Space Monks [S6]");}else{vars.spring_shoddy_shanty=0;}	
			if(settings["spring_sleek_slabs"]){vars.spring_sleek_slabs=1;vars.Log("Aktiv: Marrow Hills Waterfall to Hideout [S7]");}else{vars.spring_sleek_slabs=0;}	
			if(settings["spring_tiny_broad"]){vars.spring_tiny_broad=1;vars.Log("Aktiv: Steam Slug [S8]");}else{vars.spring_tiny_broad=0;}	
			if(settings["spring_tortoise_tunnel"]){vars.spring_tortoise_tunnel=1;vars.Log("Aktiv: Way to Unders and Up to Glowmoths [S9]");}else{vars.spring_tortoise_tunnel=0;}	
			if(settings["spring_yokos_yam"]){vars.spring_yokos_yam=1;vars.Log("Aktiv: Spina Boss,Preasure Fight [Sa]");}else{vars.spring_yokos_yam=0;}	
//Items  
			if(settings["collectible"]||settings["trueend"]||settings["100%"]){vars.collectible=1;vars.countcollect=0;vars.Log("Aktiv: Wickerling");}else{vars.collectible=0;vars.countcollect=0;}
			if(settings["wallet"]||settings["wallet%"]){vars.wallet=1;vars.countwallet=0;vars.Log("Aktiv: Wallet Upgrade");}else{vars.wallet=0;vars.countwallet=0;}
			if(settings["nugget"]){vars.nugget=1;vars.Log("Aktiv: Smashed piece of Statue");}else{vars.nugget=0;}
			if(settings["tadpole"]){vars.tadpole=1;vars.counttadpole=0;vars.Log("Aktiv: Tadpole (8 Splitt)");}else{vars.tadpole=0;vars.counttadpole=0;}
			if(settings["dustbunny_dirty"]){vars.countdustbunny=0;vars.dustbunny=1;vars.Log("Aktiv: Sootling");}else{vars.countdustbunny=0;vars.dustbunny=0;}
			if(settings["traitor_spirit"]){vars.counttraitor=0;vars.traitor=1;vars.Log("Aktiv: Traitor Spirit");}else{vars.counttraitor_spirit=0;vars.traitor=0;}
			if(settings["summons"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.summons=1;vars.Log("Aktiv: Summons");}else{vars.summons=0;}
			if(settings["abilities/map"]){vars.abilities_map=1;vars.Log("Aktiv: Map");}else{vars.abilities_map=0;}
			if(settings["abilities/partyhorn"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%true"]||settings["wallet%"]||settings["any%boss"]){vars.abilities_partyhorn=1;vars.Log("Aktiv: Noismaker");}else{vars.abilities_partyhorn=0;}
			if(settings["abilities/mailbag"]||settings["trueend"]||settings["100%"]||settings["wallet%"]){vars.abilities_mailbag=1;vars.Log("Aktiv: Mail bag");}else{vars.abilities_mailbag=0;}
			if(settings["abilities/speed"]||settings["100%"]){vars.abilities_speed=1;vars.Log("Aktiv: Grand Postmaster Badge");}else{vars.abilities_speed=0;}
			if(settings["abilities/double_fruit"]||settings["100%"]){vars.abilities_double_fruit=1;vars.Log("Aktiv: Boon of Plenty!");}else{vars.abilities_double_fruit=0;}
			if(settings["abilities/slug_vaccum"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["wallet%"]||settings["any%boss"]){vars.abilities_slug_vaccum=1;vars.Log("Aktiv: Slug Vacuum");}else{vars.abilities_slug_vaccum=0;}
			if(settings["abilities/slug_upgrade"]||settings["100%"]){vars.abilities_slug_upgrade=1;vars.Log("Aktiv: Slug Vacuum Deluxe");}else{vars.abilities_slug_upgrade=0;}
			if(settings["abilities/kickback"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["wallet%"]||settings["any%nooob"]||settings["any%boss"]){vars.abilities_kickback=1;vars.Log("Aktiv: Kickback");}else{vars.abilities_kickback=0;}
			if(settings["abilities/kickback2"]||settings["double%"]||settings["100%"]){vars.abilities_kickback2=1;vars.kickback2=0;vars.Log("Aktiv: Kickback 2");}else{vars.abilities_kickback2=0;vars.kickback2=0;}
			if(settings["abilities/dive"]||settings["trueend"]||settings["100%"]||settings["any%nooob"]||settings["wallet%"]){vars.abilities_dive=1;vars.Log("Aktiv: Dive Fish");}else{vars.abilities_dive=0;}
			if(settings["abilities/dive_speed"]||settings["100%"]){vars.abilities_dive_speed=1;vars.Log("Aktiv: Fast Dive Fish");}else{vars.abilities_dive_speed=0;}
			if(settings["abilities/hook"] ||settings["trueend"]|| settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["wallet%"]||settings["any%boss"]){vars.abilities_hook=1;vars.Log("Aktiv: Sootling on a Leash");}else{vars.abilities_hook=0;}
			if(settings["sootling_leash"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["wallet%"]||settings["any%boss"]){vars.sootling_leash=1;vars.Log("Aktiv: Sootling Leash");}else{vars.sootling_leash=0;}
			if(settings["bucket_empty"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.bucket_empty=1;vars.Log("Aktiv: Empty Bucket");}else{vars.bucket_empty=0;}
			if(settings["bucket_full"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.bucket_full=1;vars.Log("Aktiv: Bucket of Spring Water");}else{vars.bucket_full=0;}
			if(settings["guano"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.guano=1;vars.Log("Aktiv: Guano");}else{vars.guano=0;}
			if(settings["seed_pod"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.seed_pod=1;vars.Log("Aktiv: Seed Pod");}else{vars.seed_pod=0;}
			if(settings["bluekey"]||settings["trueend"]||settings["100%"]){vars.bluekey=1;vars.Log("Aktiv: Blue Key");}else{vars.bluekey=0;}
			if(settings["greenkey"]||settings["100%"]){vars.greenkey=1;vars.Log("Aktiv: Green Key");}else{vars.greenkey=0;}
			if(settings["spring_key"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%boss"]){vars.spring_key=1;vars.Log("Aktiv: Key to the Underbelly");}else{vars.spring_key=0;}
			if(settings["nim_key"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]){vars.nim_key=1;vars.Log("Aktiv: Nims Key");}else{vars.nim_key=0;}
			if(settings["instrument_pile"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]){vars.instrument_pile=1;vars.Log("Aktiv: Ceremony Instruments");}else{vars.instrument_pile=0;}
			if(settings["toolbox"]){vars.toolbox=1;vars.Log("Aktiv: Toolbox");}else{vars.toolbox=0;}
			if(settings["sad_spider"]){vars.sad_spider=1;vars.Log("Aktiv: Sad Spiderling");}else{vars.sad_spider=0;}
			if(settings["postal_badge"]){vars.postal_badge=1;vars.Log("Aktiv: Old Postal Badge");}else{vars.postal_badge=0;}
			if(settings["treasure_map"]){vars.treasure_map=1;vars.Log("Aktiv: Treasure Map");}else{vars.treasure_map=0;}
			if(settings["mushroom_2"]){vars.mushroom_2=1;vars.Log("Aktiv: Juicy Cove Mushroom");}else{vars.mushroom_2=0;}
			if(settings["mushroom_3"]){vars.mushroom_3=1;vars.Log("Aktiv: Poison Toadstool");}else{vars.mushroom_3=0;}
			if(settings["powerups/skvader_1"]){vars.powerups_skvader_1=1;vars.Log("Aktiv: Skvader");}else{vars.powerups_skvader_1=0;}
			if(settings["powerups/skvader_2"]||settings["100%"]){vars.powerups_skvader_2=1;vars.Log("Aktiv: Fat Skvader");}else{vars.powerups_skvader_2=0;}
			if(settings["package_3"]||settings["100%"]||settings["wallet%"]){vars.package_3=1;vars.Log("Aktiv: Overdue Package for Quinbe");}else{vars.package_3=0;}
			if(settings["package_2"]||settings["100%"]){vars.package_2=1;vars.Log("Aktiv: Overdue Package for Sin");}else{vars.package_2=0;}
			if(settings["package_1"]||settings["100%"]){vars.package_1=1;vars.Log("Aktiv: Overdue Package for Treek");}else{vars.package_1=0;}
			if(settings["idol1"]||settings["100%"]){vars.idol1=1;vars.Log("Aktiv: Statue Chunk");}else{vars.idol1=0;}
			if(settings["idol2"]||settings["100%"]){vars.idol2=1;vars.Log("Aktiv: Statue Piece 2");}else{vars.idol2=0;}
			if(settings["idol3"]||settings["100%"]){vars.idol3=1;vars.Log("Aktiv: Statue Piece 3");}else{vars.idol3=0;}
			if(settings["idol4"]||settings["100%"]){vars.idol4=1;vars.Log("Aktiv: Statue Piece 4");}else{vars.idol4=0;}
			if(settings["spores_1"]||settings["100%"]){vars.spores_1=1;vars.Log("Aktiv: Light Spores");}else{vars.spores_1=0;}
			if(settings["spores_2"]||settings["100%"]){vars.spores_2=1;vars.Log("Aktiv: Dry Spores");}else{vars.spores_2=0;}
			if(settings["spores_3"]||settings["100%"]){vars.spores_3=1;vars.Log("Aktiv: Damp Spores");}else{vars.spores_3=0;}
			if(settings["spores_4"]||settings["100%"]){vars.spores_4=1;vars.Log("Aktiv: Annoyed Spores");}else{vars.spores_4=0;}
			if(settings["spores_5"]||settings["100%"]){vars.spores_5=1;vars.Log("Aktiv: Frosty Spores");}else{vars.spores_5=0;}
			if(settings["tracker_caves"]||settings["100%"]){vars.tracker_caves=1;vars.Log("Aktiv: Cave Tracker");}else{vars.tracker_caves=0;}
			if(settings["tracker_jungle"]||settings["100%"]){vars.tracker_jungle=1;vars.Log("Aktiv: Jungle Tracker");}else{vars.tracker_jungle=0;}
			if(settings["tracker_peak"]||settings["100%"]){vars.tracker_peak=1;vars.Log("Aktiv: Peak Tracker");}else{vars.tracker_peak=0;}
			if(settings["tracker_springs"]||settings["100%"]){vars.tracker_springs=1;vars.Log("Aktiv: Springs Tracker");}else{vars.tracker_springs=0;}
			if(settings["tracker_scarabs"]){vars.tracker_scarabs=1;vars.Log("Aktiv: Scarabs Tracker");}else{vars.tracker_scarabs=0;}
			if(settings["skins/skin_1"]){vars.skins_skin_1=1;vars.Log("Aktiv: Bling Sprinkles");}else{vars.skins_skin_1=0;}
			if(settings["skins/skin_2"]||settings["trueend"]||settings["100%"]||settings["wallet%"]){vars.skins_skin_2=1;vars.Log("Aktiv: Creepy Sprinkles");}else{vars.skins_skin_2=0;}
			if(settings["skins/skin_3"]){vars.skins_skin_3=1;vars.Log("Aktiv: Deadly Sprinkles");}else{vars.skins_skin_3=0;}
			if(settings["skins/skin_4"]){vars.skins_skin_4=1;vars.Log("Aktiv: Crimson Sprinkles");}else{vars.skins_skin_4=0;}
			if(settings["skins/skin_5"]||settings["trueend"]||settings["100%"]||settings["wallet%"]){vars.skins_skin_5=1;vars.Log("Aktiv: Sweet Sprinkles");}else{vars.skins_skin_5=0;}
//State
			if(settings["doorintr"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["wallet%"]||settings["any%true"]||settings["any%boss"]){vars.doorintr=1;vars.Log("Aktiv: Door Introduction");}else{vars.doorintr=0;}
			if(settings["endbossdead"]||settings["double%"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%nooob"]||settings["any%true"]||settings["any%boss"]){vars.endbossdead=1;vars.Log("Aktiv: Endboss dead");}else{vars.endbossdead=0;}
			if(settings["bossboon"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%boss"]||settings["any%nooob"]){vars.bossboon=1;vars.Log("Aktiv: Boss Boon");}else{vars.bossboon=0;}
			if(settings["ebontalk"]||settings["any%nims"]||settings["any%nooob"]){vars.ebontalk=1;vars.Log("Aktiv: BTalk to Ebon");}else{vars.ebontalk=0;}
			if(settings["bosssal"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%boss"]||settings["any%nooob"]){vars.bosssal=1;vars.Log("Aktiv: Boss Sal");}else{vars.bosssal=0;}
			if(settings["bossspina"]||settings["trueend"]||settings["100%"]||settings["any%nims"]||settings["any%boss"]||settings["any%nooob"]){vars.bossspina=1;vars.Log("Aktiv: Boss Spina");}else{vars.bossspina=0;}
			if(settings["totems"]){vars.totem=1;vars.Log("Aktiv: Totems");}else{vars.totem=0;}
			if(settings["fruit100"]||settings["fruit%"]){vars.fruit100=1;vars.Log("Aktiv: Fruit 100");}else{vars.fruit100=0;}
			if(settings["fruit600"]||settings["wallet%"]){vars.fruit600=1;vars.Log("Aktiv: Fruit 600");}else{vars.fruit600=0;}
			vars.Log("Started");return true;}}}      
}
