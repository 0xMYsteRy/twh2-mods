
flam_hef_dilemma_bretonnia_drowned = 0;

function flam_hef_dilemma_bretonnia_drowneddef_event()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_VMPCSTMARI")

if flam_hef_dilemma_bretonnia_drowned == 0 then

core:add_listener(
						"flam_hef_dilemma__bret_drown_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 46 end,
						function() flam_hef_dilemma_ulthuan_bret_defdron_chospawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_dilemma_ulthuan_bret_defdron_chospawn()

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" then

		cm:trigger_dilemma(current_faction, "flam_hef_dilemma_ulthuan_bret_drown_cho");
					
		flam_hef_dilemma_bretonnia_drowned = 1;
		core:remove_listener("flam_hef_dilemma__bret_drown_listener");		
															
		end;
	end		

core:add_listener(
		"flam_hef_dilemma_marienburg_choice_listener", 
		"DilemmaChoiceMadeEvent", 
		function(context) return context:dilemma():starts_with("flam_hef_dilemma_ulthuan_bret_drown_cho") end, 
		function(context)
 
		if context:choice() == 0 then

		flam_hef_dilemma_bretonnia_drownedmes();	
		core:remove_listener("flam_hef_dilemma_marienburg_choice_listener");			

		elseif context:choice() == 1 then																
		cm:create_force(
								"wh2_dlc11_cst_vampire_coast_rebels",
								"wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_zombie_gunnery_mob_0,wh2_dlc11_cst_mon_scurvy_dogs,wh2_dlc11_cst_inf_zombie_gunnery_mob_1,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_mon_rotting_leviathan_0,wh2_dlc11_cst_mon_terrorgheist,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_1,wh2_dlc11_cst_inf_depth_guard_1,",
								"wh_main_peak_pass_karak_kadrin",
								410,
								476,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
		cm:create_force(
								"wh2_dlc11_cst_vampire_coast_rebels",
								"wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_mon_animated_hulks_0,wh2_dlc11_cst_inf_zombie_gunnery_mob_0,wh2_dlc11_cst_mon_animated_hulks_0,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_mon_terrorgheist,wh2_dlc11_cst_mon_necrofex_colossus_0,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_1,wh2_dlc11_cst_inf_depth_guard_1,",
								"wh_main_peak_pass_karak_kadrin",
								418,
								466,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_dlc11_cst_vampire_coast_rebels",
								"wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_mon_fell_bats,wh2_dlc11_cst_inf_zombie_gunnery_mob_0,wh2_dlc11_cst_inf_zombie_gunnery_mob_1,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_mon_terrorgheist,wh2_dlc11_cst_mon_terrorgheist,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_1,wh2_dlc11_cst_inf_depth_guard_1,",
								"wh_main_peak_pass_karak_kadrin",
								424,
								475,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_dlc11_cst_vampire_coast_rebels",
								"wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_mon_fell_bats,wh2_dlc11_cst_inf_zombie_gunnery_mob_0,wh2_dlc11_cst_inf_zombie_gunnery_mob_1,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_art_carronade,wh2_dlc11_cst_mon_rotting_prometheans_0,wh2_dlc11_cst_mon_rotting_prometheans_0,wh2_dlc11_cst_mon_rotting_prometheans_0,wh2_dlc11_cst_mon_fell_bats,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_1,wh2_dlc11_cst_inf_zombie_deckhands_mob_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_0,wh2_dlc11_cst_inf_depth_guard_1,wh2_dlc11_cst_inf_depth_guard_1,",
								"wh_main_peak_pass_karak_kadrin",
								429,
								465,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	  						
		cm:force_declare_war("wh2_dlc11_cst_vampire_coast_rebels", "wh_main_emp_empire", false, false);		
		cm:force_declare_war("wh2_dlc11_cst_vampire_coast_rebels", "wh_main_emp_marienburg", false, false);			
		flam_hef_dilemma_bretonnia_drownedmes1();
		core:remove_listener("flam_hef_dilemma_marienburg_choice_listener");			
		
        end
		end,
		true
		)

function flam_hef_dilemma_bretonnia_drownedmes()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_mutin_marien_choice1_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_mutin_marien_choice1_secondary_detail",
						true,
						870
					);
					end;
					
					end
					
function flam_hef_dilemma_bretonnia_drownedmes1()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_mutin_marien_choice2_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_mutin_marien_choice2_secondary_detail",
						true,
						904
					);
					end;
					
					end			
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_dilemma_bretonnia_drowned", flam_hef_dilemma_bretonnia_drowned, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_dilemma_bretonnia_drowned = cm:load_named_value("flam_hef_dilemma_bretonnia_drowned", 0, context);
	end
);