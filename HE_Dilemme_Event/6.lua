
flam_hef_dilemma__lzd = 0;

function flam_hef_dilemma_lzd_event()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_VMPCSTMARI")

if flam_hef_dilemma__lzd == 0 then

core:add_listener(
						"flam_hef_dilemma__lzdspawn_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 60 end,
						function() flam_hef_dilemma__lzdspawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_dilemma__lzdspawn()

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" then

		cm:trigger_dilemma(current_faction, "flam_hef_dilemma__lzdspawn_listener_choice");
					
		flam_hef_dilemma__lzd = 1;
		core:remove_listener("flam_hef_dilemma__lzdspawn_listener");		
															
		end;
	end		

core:add_listener(
		"flam_hef_dilemma__lzdspawn_listener_choicelistener", 
		"DilemmaChoiceMadeEvent", 
		function(context) return context:dilemma():starts_with("flam_hef_dilemma__lzdspawn_listener_choice") end, 
		function(context)
 
		if context:choice() == 0 then

		flam_hef_dilemma__lzdmes();	
		core:remove_listener("flam_hef_dilemma__lzdspawn_listener_choicelistener");			

		elseif context:choice() == 1 then																
		cm:create_force(
								"wh2_main_lzd_tlaxtlan",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								508,
								125,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_lzd_tlaxtlan",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								505,
								154,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_lzd_tlaxtlan",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								503,
								140,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_lzd_tlaxtlan",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								516,
								135,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
		cm:force_declare_war("wh2_main_lzd_tlaxtlan", "wh2_dlc09_tmb_tomb_kings", false, false);			
		flam_hef_dilemma__lzdmes1();
		core:remove_listener("flam_hef_dilemma__lzdspawn_listener_choicelistener");			
		
        end
		end,
		true
		)

function flam_hef_dilemma__lzdmes()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_lzdi_choice1_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_lzdi_choice1_secondary_detail",
						true,
						870
					);
					end;
					
					end
					
function flam_hef_dilemma__lzdmes1()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_lzdi_choice2_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_lzdi_choice2_secondary_detail",
						true,
						872
					);
					end;
					
					end			
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_dilemma__lzd", flam_hef_dilemma__lzd, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_dilemma__lzd = cm:load_named_value("flam_hef_dilemma__lzd", 0, context);
	end
);