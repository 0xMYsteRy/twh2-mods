
flam_hef_norsca = 0;

function flam_hef_norscaevent()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_HEFNPORINV")

if flam_hef_norsca == 0 then

core:add_listener(
						"flam_hef_norsca_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 31 end,
						function() flam_hef_norscaspawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_norscaspawn()
		
		cm:create_force(
								"wh2_main_nor_skeggi",
								"wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_mon_skinwolves_1,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_mon_skinwolves_0,wh_main_nor_inf_chaos_marauders_0,wh_main_nor_inf_chaos_marauders_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,",
								"wh_main_peak_pass_karak_kadrin",
								273,
								406,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_nor_skeggi",
								"wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_mon_skinwolves_1,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_inf_marauder_champions_0,wh_main_nor_inf_chaos_marauders_0,wh_main_nor_inf_chaos_marauders_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,",
								"wh_main_peak_pass_karak_kadrin",
								245,
								419,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);							
		cm:create_force(
								"wh2_main_nor_skeggi",
								"wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_mon_skinwolves_1,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_inf_marauder_champions_0,wh_main_nor_inf_chaos_marauders_0,wh_main_nor_inf_chaos_marauders_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,",
								"wh_main_peak_pass_karak_kadrin",
								283,
								497,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_nor_skeggi",
								"wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_mon_skinwolves_1,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_mon_skinwolves_0,wh_main_nor_inf_chaos_marauders_0,wh_main_nor_inf_chaos_marauders_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,",
								"wh_main_peak_pass_karak_kadrin",
								218,
								428,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_nor_skeggi",
								"wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_mon_skinwolves_1,wh_dlc08_nor_mon_skinwolves_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_mon_skinwolves_0,wh_main_nor_inf_chaos_marauders_0,wh_main_nor_inf_chaos_marauders_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_champions_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_spearman_0,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_1,wh_dlc08_nor_inf_marauder_hunters_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,wh_dlc08_nor_inf_marauder_berserkers_0,",
								"wh_main_peak_pass_karak_kadrin",
								221,
								422,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);							
		cm:force_declare_war("wh2_main_nor_skeggi", "wh2_main_hef_avelorn", false, false);	
		cm:force_declare_war("wh2_main_nor_skeggi", "wh2_dlc15_grn_broken_axe", false, false);	
		cm:force_declare_war("wh2_main_nor_skeggi", "wh2_main_hef_eataine", false, false);	        
		cm:force_declare_war("wh2_main_nor_skeggi", "wh2_main_hef_chrace", false, false);					
		flam_hef_norscames();	
		flam_hef_norsca = 1;
		core:remove_listener("flam_hef_norsca_listener");		
															
		end

function flam_hef_norscames()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_norscainv_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_norscainv_secondary_detail",
						true,
						800
					);
					end;
					
					end
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_norsca", flam_hef_norsca, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_norsca = cm:load_named_value("flam_hef_norsca", 0, context);
	end
);