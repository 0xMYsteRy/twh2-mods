
flam_hef_dilemma__def = 0;

function flam_hef_dilemma_def_event()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_VMPCSTMARI")

if flam_hef_dilemma__def == 0 then

core:add_listener(
						"flam_hef_dilemma_def_event_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 55 end,
						function() flam_hef_dilemma_def_event_listener_spawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_dilemma_def_event_listener_spawn()

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" then

		cm:trigger_dilemma(current_faction, "flam_hef_dilemma_ulthuan_def_cho");
					
		flam_hef_dilemma__def = 1;
		core:remove_listener("flam_hef_dilemma_def_event_listener");		
															
		end;
	end		

core:add_listener(
		"flam_hef_dilemma_ulthuan_def_choice_listener", 
		"DilemmaChoiceMadeEvent", 
		function(context) return context:dilemma():starts_with("flam_hef_dilemma_ulthuan_def_cho") end, 
		function(context)
 
		if context:choice() == 0 then

		flam_hef_dilemma__defmes();	
		core:remove_listener("flam_hef_dilemma_ulthuan_def_choice_listener");			

		elseif context:choice() == 1 then																
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc10_def_mon_kharibdyss_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								362,
								496,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc10_def_mon_kharibdyss_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								368,
								489,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc10_def_mon_kharibdyss_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								362,
								400,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc10_def_mon_kharibdyss_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								369,
								409,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc14_def_mon_bloodwrack_medusa_0,wh2_dlc14_def_mon_bloodwrack_medusa_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								390,
								350,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_the_forgebound",
								"wh2_main_def_inf_bleakswords_0,wh2_dlc14_def_mon_bloodwrack_medusa_ror_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_harpies,wh2_main_def_inf_harpies,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_1,wh2_main_def_cav_dark_riders_2,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_0,wh2_main_def_inf_black_ark_corsairs_1,wh2_main_def_inf_black_ark_corsairs_1",
								"wh_main_peak_pass_karak_kadrin",
								384,
								356,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);									
		cm:force_declare_war("wh2_main_def_the_forgebound", "wh_main_brt_bordeleaux", false, false);		
		cm:force_declare_war("wh2_main_def_the_forgebound", "wh_main_brt_bretonnia", false, false);	
		cm:force_declare_war("wh2_main_def_the_forgebound", "wh_main_brt_carcassonne", false, false);			
		flam_hef_dilemma__defmes1();
		core:remove_listener("flam_hef_dilemma_ulthuan_def_choice_listener");			
		
        end
		end,
		true
		)

function flam_hef_dilemma__defmes()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_def_bret_choice1_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_def_bret_choice1_secondary_detail",
						true,
						870
					);
					end;
					
					end
					
function flam_hef_dilemma__defmes1()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_def_bret_choice2_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_def_bret_choice2_secondary_detail",
						true,
						871
					);
					end;
					
					end			
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_dilemma__def", flam_hef_dilemma__def, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_dilemma__def = cm:load_named_value("flam_hef_dilemma__def", 0, context);
	end
);