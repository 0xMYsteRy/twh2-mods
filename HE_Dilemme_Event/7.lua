
flam_hef_dilemma = 0;

function flam_hef_dilemmaevent()	
if cm:model():campaign_name("main_warhammer") then	

	out("FLAM_HEFNDILEMMAA")

if flam_hef_dilemma == 0 then

core:add_listener(
						"flam_hef_dilemma_listener", 
						"FactionRoundStart", 
						function(context) return context:faction():is_human() and cm:model():turn_number() == 72 end,
						function() flam_hef_dilemmaspawn() end,
						true 
						);	
				
	end;
	end;
		end

function flam_hef_dilemmaspawn()

		if cm:get_faction(current_faction):subculture() == "wh2_main_sc_hef_high_elves" then

		cm:trigger_dilemma(current_faction, "flam_hef_dilemma_ulthuaninv_cho");
					
		flam_hef_dilemma = 1;
		core:remove_listener("flam_hef_dilemma_listener");		
															
		end;
	end		

core:add_listener(
		"flam_hef_dilemma_choice_listener", 
		"DilemmaChoiceMadeEvent", 
		function(context) return context:dilemma():starts_with("flam_hef_dilemma_ulthuaninv_cho") end, 
		function(context)

		local current_faction = cm:model():world():whose_turn_is_it():name();
 
		if context:choice() == 0 then
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								332,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								346,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								357,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								150,
								382,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								153,
								386,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								146,
								316,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_inf_thunderers_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								271,
								290,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								280,
								301,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								292,
								326,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								294,
								353,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								287,
								297,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
		cm:force_declare_war("wh2_main_grn_blue_vipers", current_faction, false, false);
		cm:force_declare_war("wh_main_dwf_barak_varr", current_faction, false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", current_faction, false, false);	
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_caledor", false, false);	
		cm:force_declare_war("wh_main_dwf_barak_varr", "wh2_main_hef_yvresse", false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", "wh2_main_hef_yvresse", false, false);		
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_tiranoc", false, false);
		core:remove_listener("flam_hef_dilemma_choice_listener");				
		flam_hef_dilemmames1();
		flam_hef_dilemmames2();				

		elseif context:choice() == 1 then
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_dlc13_lzd_mon_dread_saurian_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								250,
								300,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_main_lzd_mon_stegadon_blessed_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								254,
								311,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_mon_carnosaur_0,wh2_main_lzd_mon_carnosaur_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								266,
								344,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								262,
								342,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);																	
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								332,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								346,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								357,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								150,
								382,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								153,
								386,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								146,
								316,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
								
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", current_faction, false, false);
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", "wh2_main_hef_saphery", false, false);
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_caledor", false, false);	
		cm:force_declare_war("wh_main_dwf_barak_varr", "wh2_main_hef_yvresse", false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", "wh2_main_hef_yvresse", false, false);		
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_tiranoc", false, false);
		core:remove_listener("flam_hef_dilemma_choice_listener");				
		flam_hef_dilemmames3();
		flam_hef_dilemmames2();				
		
		elseif context:choice() == 2 then
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_inf_thunderers_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								271,
								290,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								280,
								301,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								292,
								326,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								294,
								353,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								287,
								297,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_dlc13_lzd_mon_dread_saurian_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								250,
								300,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_main_lzd_mon_stegadon_blessed_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								254,
								311,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_mon_carnosaur_0,wh2_main_lzd_mon_carnosaur_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								266,
								344,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								262,
								342,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);									
		cm:force_declare_war("wh_main_dwf_barak_varr", current_faction, false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", current_faction, false, false);
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", current_faction, false, false);
		cm:force_declare_war("wh_main_dwf_barak_varr", "wh2_main_hef_yvresse", false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", "wh2_main_hef_yvresse", false, false);			
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", "wh2_main_hef_saphery", false, false);	
		core:remove_listener("flam_hef_dilemma_choice_listener");				
		flam_hef_dilemmames3();		
		flam_hef_dilemmames1();	

		elseif context:choice() == 3 then
		
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								332,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								346,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								143,
								357,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								150,
								382,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								153,
								386,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh2_main_grn_blue_vipers",
								"wh_main_grn_inf_savage_orcs,wh_main_grn_mon_giant,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boyz,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_cav_savage_orc_boar_boy_big_uns,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orcs,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_big_uns,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz,wh_main_grn_inf_savage_orc_arrer_boyz",
								"wh_main_peak_pass_karak_kadrin",
								146,
								316,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);			
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_inf_thunderers_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								271,
								290,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								280,
								301,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_zhufbar",
								"wh_main_dwf_inf_longbeards,wh_main_dwf_veh_gyrocopter_0,wh_main_dwf_veh_gyrobomber,wh_main_dwf_veh_gyrocopter_1,wh_main_dwf_veh_gyrobomber,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_flame_cannon,wh_main_dwf_art_organ_gun,wh_main_dwf_inf_thunderers_0,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_hammerers,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards_1,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,wh_main_dwf_inf_longbeards,",
								"wh_main_peak_pass_karak_kadrin",
								292,
								326,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								294,
								353,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);	
		cm:create_force(
								"wh_main_dwf_barak_varr",
								"wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_0,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_quarrellers_1,wh_main_dwf_inf_ironbreakers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_slayers,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh_main_dwf_inf_dwarf_warrior_0,wh2_dlc10_dwf_inf_giant_slayers,wh2_dlc10_dwf_inf_giant_slayers,wh_dlc06_dwf_inf_rangers_1,wh_dlc06_dwf_inf_rangers_0,wh_dlc06_dwf_inf_rangers_0,wh_main_dwf_art_cannon",
								"wh_main_peak_pass_karak_kadrin",
								287,
								297,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);								
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_dlc13_lzd_mon_dread_saurian_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								250,
								300,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_salamander_pack_0,wh2_main_lzd_mon_stegadon_blessed_1,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								254,
								311,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_mon_carnosaur_0,wh2_main_lzd_mon_carnosaur_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								266,
								344,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);
		cm:create_force(
								"wh2_main_lzd_sentinels_of_xeti",
								"wh2_main_lzd_inf_saurus_warriors_0,wh2_dlc12_lzd_mon_ancient_salamander_0,wh2_main_lzd_mon_stegadon_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_dlc13_lzd_mon_sacred_kroxigors_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_mon_bastiladon_0,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_cav_cold_ones_1,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards_blessed,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_temple_guards,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_1,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0,wh2_main_lzd_inf_saurus_warriors_0",
								"wh_main_peak_pass_karak_kadrin",
								262,
								342,                                                                                                                                                                     
								true,
								function(cqi)
								cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, -1, true);
								end
							);									
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", current_faction, false, false);
		cm:force_declare_war("wh2_main_grn_blue_vipers", current_faction, false, false);
		cm:force_declare_war("wh_main_dwf_barak_varr", current_faction, false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", current_faction, false, false);
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_caledor", false, false);	
		cm:force_declare_war("wh_main_dwf_barak_varr", "wh2_main_hef_yvresse", false, false);	
		cm:force_declare_war("wh_main_dwf_zhufbar", "wh2_main_hef_yvresse", false, false);		
		cm:force_declare_war("wh2_main_grn_blue_vipers", "wh2_main_hef_tiranoc", false, false);	
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", current_faction, false, false);
		cm:force_declare_war("wh2_main_lzd_sentinels_of_xeti", "wh2_main_hef_saphery", false, false);	
		core:remove_listener("flam_hef_dilemma_choice_listener");		
		flam_hef_dilemmames3();		
		flam_hef_dilemmames2();
		flam_hef_dilemmames1();			
		
        end
		end,
		true
		)
					
function flam_hef_dilemmames1()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice1_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice1_secondary_detail",
						true,
						860
					);
					end;
					
					end

function flam_hef_dilemmames2()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice2_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice2_secondary_detail",
						true,
						860
					);
					end;
					
					end

function flam_hef_dilemmames3()

local human_factions = cm:get_human_factions();	
		
			for i = 1, #human_factions do
			
					cm:show_message_event(
						human_factions[i],
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice3_primary_detail",
						"",
						"event_feed_strings_text_wh_event_feed_string_scripted_event_flam_hef_ulthuan_invasion_choice3_secondary_detail",
						true,
						860
					);
					end;
					
					end					
					
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("flam_hef_dilemma", flam_hef_dilemma, context);
	end
);

cm:add_loading_game_callback(
	function(context)
		flam_hef_dilemma = cm:load_named_value("flam_hef_dilemma", 0, context);
	end
);