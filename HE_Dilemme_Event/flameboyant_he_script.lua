
flam_hef_asraii = 0;

function flam_hef_asraiievent()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_HEFSWORDINV")

if flam_hef_asraii == 0 then

core:add_listener(
						"flam_hef_asraiilistener", 
						"BuildingCompleted", 
						function(context)
							return 
							context:building():name() == "wh2_main_special_shrine_of_khaine_hef_1" end,
						function() flam_hef_asraiispawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_asraiispawn()
	
		local current_faction = cm:model():world():whose_turn_is_it():name();

		local fl_hef_sword_region = cm:get_region("wh2_main_nagarythe_shrine_of_khaine")				

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" 
		and cm:get_faction(current_faction):is_human()
		and fl_hef_sword_region:owning_faction():name() == current_faction then	
		
		cm:create_force(
								"wh_dlc05_wef_wydrioth",
								"wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_mon_treekin_0,wh_dlc05_wef_mon_treekin_0,wh_dlc05_wef_cav_wild_riders_1,wh_dlc05_wef_inf_wardancers_0,wh_dlc05_wef_inf_wardancers_1,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_1,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0",
								"wh_main_peak_pass_karak_kadrin",
								214,
								379,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_dlc05_wef_wydrioth",
								"wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_cav_hawk_riders_0,wh_dlc05_wef_cav_hawk_riders_0,wh_dlc05_wef_mon_treeman_0,wh_dlc05_wef_cav_wild_riders_1,wh_dlc05_wef_inf_wardancers_0,wh_dlc05_wef_inf_wardancers_1,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_1,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0",
								"wh_main_peak_pass_karak_kadrin",
								215,
								382,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);							
		cm:create_force(
								"wh_dlc05_wef_wydrioth",
								"wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_mon_treeman_0,wh_dlc05_wef_cav_hawk_riders_0,wh_dlc05_wef_mon_treekin_0,wh_dlc05_wef_cav_wild_riders_1,wh_dlc05_wef_inf_wardancers_0,wh_dlc05_wef_inf_wardancers_1,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_1,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0",
								"wh_main_peak_pass_karak_kadrin",
								210,
								416,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_dlc05_wef_wydrioth",
								"wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_inf_eternal_guard_1,wh_dlc05_wef_cav_hawk_riders_0,wh_dlc05_wef_cav_hawk_riders_0,wh_dlc05_wef_mon_treekin_0,wh_dlc05_wef_cav_wild_riders_1,wh_dlc05_wef_inf_wardancers_0,wh_dlc05_wef_inf_wardancers_1,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_cav_wild_riders_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_eternal_guard_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_0,wh_dlc05_wef_inf_deepwood_scouts_1,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0,wh_dlc05_wef_inf_dryads_0",
								"wh_main_peak_pass_karak_kadrin",
								212,
								415,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);							
		cm:force_declare_war(current_faction, "wh_dlc05_wef_wydrioth", false, false);		
		flam_hef_asraiimes();	
		flam_hef_asraii = 1;
		core:remove_listener("flam_hef_asraiilistener");		
						
					end;									
		end

function flam_hef_asraiimes()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_swordwef_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_swordwef_secondary_detail",
						true,
						605
					);
					end;
					
					end
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_asraii", flam_hef_asraii, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_asraii = cm:load_named_value("flam_hef_asraii", 0, context);
	end
);