
flam_hef_begindifevent = 0;

function flam_hef_begindifeventevent()	
if cm:model():campaign_name("main_warhammer") then	

if flam_hef_begindifevent == 0 then

core:add_listener(
						"flam_hef_begindifevent_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 5 end,
						function() flam_hef_begindifevent_spawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_begindifevent_spawn()
	
		local current_faction = cm:model():world():whose_turn_is_it():name();		

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" 
		and cm:get_faction(current_faction):is_human() then	
		
		cm:create_force(
								"wh2_main_def_cult_of_excess",
								"wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_shades_2,wh2_dlc10_def_mon_feral_manticore_0,wh2_dlc10_def_mon_feral_manticore_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_cav_cold_one_knights_1,wh2_main_def_cav_cold_one_knights_0,wh2_main_def_cav_cold_one_chariot,wh2_main_def_inf_witch_elves_0,wh2_main_def_inf_witch_elves_0,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_harpies",
								"wh_main_peak_pass_karak_kadrin",
								219,
								306,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);		
		cm:create_force(
								"wh2_main_def_scourge_of_khaine",
								"wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_shades_2,wh2_dlc10_def_mon_feral_manticore_0,wh2_dlc10_def_mon_feral_manticore_0,wh2_main_def_inf_bleakswords_0,wh2_main_def_cav_cold_one_knights_1,wh2_main_def_cav_cold_one_knights_0,wh2_main_def_cav_cold_one_chariot,wh2_main_def_inf_witch_elves_0,wh2_main_def_inf_witch_elves_0,wh2_main_def_inf_witch_elves_0,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_dlc10_def_inf_sisters_of_slaughter,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_darkshards_1,wh2_main_def_inf_bleakswords_0,wh2_main_def_inf_harpies",
								"wh_main_peak_pass_karak_kadrin",
								209,
								430,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								

		cm:transfer_region_to_faction("wh2_main_eataine_shrine_of_asuryan", "wh2_main_def_cult_of_excess");		
				
		flam_hef_begindifeventmes();	
		flam_hef_begindifevent = 1;
		core:remove_listener("flam_hef_begindifevent_listener");		
															
		end;
	end

function flam_hef_begindifeventmes()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_beginningdif_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_beginningdif_secondary_detail",
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
		cm:save_named_value("flam_hef_begindifevent", flam_hef_begindifevent, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_begindifevent = cm:load_named_value("flam_hef_begindifevent", 0, context);
	end
);