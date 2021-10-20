local yvresse_faction_str = "wh2_main_hef_yvresse";
-- set up the junction between the skills and the character art sets that will be applied
-- local skillz = {
-- 	["wh2_main_skill_hef_eltharion_blind"] = "wh2_main_hef_cha_eltharion_7",
-- }

function soa_yvresse()
    if cm:is_new_game() then

        if cm:model():campaign_name("main_warhammer") then

-- This is for the ME campaign

			local region = cm:get_region("wh2_main_yvresse_tor_yvresse")
			local settlement = region:settlement()
			local toryvresse_region = cm:model():world():region_manager():region_by_key("wh2_main_yvresse_tor_yvresse")
				
			--Replace Yvresse starting buildings 
-- 			cm:region_slot_instantly_dismantle_building(toryvresse_region:settlement():active_secondary_slots():item_at(0))
-- 			cm:region_slot_instantly_dismantle_building(toryvresse_region:settlement():active_secondary_slots():item_at(1))
-- 			cm:region_slot_instantly_upgrade_building(settlement:active_secondary_slots():item_at(0), "yvresse_hef_copper_1")
--             cm:region_slot_instantly_upgrade_building(settlement:active_secondary_slots():item_at(1), "yvresse_hef_barracks_all_1")
--             cm:transfer_region_to_faction("wh2_main_yvresse_tor_yvresse", "wh2_main_hef_caledor")
--             cm:transfer_region_to_faction("wh2_main_yvresse_tor_yvresse", "wh2_main_hef_yvresse")
            
--             local region_gronti = cm:get_region("wh_main_southern_badlands_gronti_mingol")
-- 			local settlement_gronti = region_gronti:settlement()
-- 			local gronti_region = cm:model():world():region_manager():region_by_key("wh_main_southern_badlands_gronti_mingol")
			
-- 			cm:region_slot_instantly_dismantle_building(gronti_region:settlement():primary_slot())
-- 			cm:region_slot_instantly_upgrade_building(gronti_region:settlement():primary_slot(), "yvr_special_settlement_colony_minor_hef_1")
--             cm:transfer_region_to_faction("wh_main_southern_badlands_gronti_mingol", "wh2_main_hef_caledor")
--             cm:transfer_region_to_faction("wh_main_southern_badlands_gronti_mingol", "wh2_main_hef_yvresse")
            
            --Replacing Eltharion starting army
			local eltharion_faction_obj = cm:get_faction("wh2_main_hef_yvresse");
			local eltharion_faction_leader_cqi = eltharion_faction_obj:faction_leader():command_queue_index();
			
			cm:remove_unit_from_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_inf_archers_0")
            
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_spireguard_0")
			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_spireguard_0")
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_spireguard_0")
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_spireguard_0")
			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_cav_dragon_princes")
			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_mon_sun_dragon")
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_silverin_guard_0")
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_griffon_knights_0")
            cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_dlc15_hef_inf_mistwalkers_griffon_knights_0")
            
            
-- 			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "yvr_hef_inf_archers_0")
-- wh2_dlc15_hef_inf_silverin_guard_0, wh2_dlc15_hef_inf_mistwalkers_spireguard_0, wh2_dlc15_hef_inf_mistwalkers_griffon_knights_0, wh2_dlc15_hef_cha_imrik_0
            
-- This is for Vortex campaign
        else

-- 			Replace Yvresse starting buildings 
-- 			local region = cm:get_region("wh2_main_vor_northern_yvresse_tor_yvresse")
-- 			local settlement = region:settlement()
-- 			local toryvresse_region = cm:model():world():region_manager():region_by_key("wh2_main_vor_northern_yvresse_tor_yvresse")
-- 	
-- 			cm:region_slot_instantly_dismantle_building(toryvresse_region:settlement():active_secondary_slots():item_at(0))
-- 			cm:region_slot_instantly_dismantle_building(toryvresse_region:settlement():active_secondary_slots():item_at(1))
-- 			cm:region_slot_instantly_upgrade_building(settlement:active_secondary_slots():item_at(0), "yvresse_hef_copper_1")
--             cm:region_slot_instantly_upgrade_building(settlement:active_secondary_slots():item_at(1), "yvresse_hef_barracks_all_1")
--             cm:transfer_region_to_faction("wh2_main_vor_northern_yvresse_tor_yvresse", "wh2_main_hef_caledor")
--             cm:transfer_region_to_faction("wh2_main_vor_northern_yvresse_tor_yvresse", "wh2_main_hef_yvresse")
-- 			
-- 			local region_sardenath = cm:get_region("wh2_main_vor_northern_yvresse_sardenath")
-- 			local settlement_sardenath = region_sardenath:settlement()
-- 			local sardenath_region = cm:model():world():region_manager():region_by_key("wh2_main_vor_northern_yvresse_sardenath")
-- 			
-- 			cm:region_slot_instantly_dismantle_building(sardenath_region:settlement():primary_slot())
-- 			cm:region_slot_instantly_upgrade_building(sardenath_region:settlement():primary_slot(), "yvr_settlement_minor_1_coast")
--             cm:transfer_region_to_faction("wh2_main_vor_northern_yvresse_sardenath", "wh2_main_hef_caledor")
--             cm:transfer_region_to_faction("wh2_main_vor_northern_yvresse_sardenath", "wh2_main_hef_yvresse")
-- 			
--             Replacing Eltharion starting army
-- 			local eltharion_faction_obj = cm:get_faction("wh2_main_hef_yvresse");
-- 			local eltharion_faction_leader_cqi = eltharion_faction_obj:faction_leader():command_queue_index();
-- 			
-- 			cm:remove_unit_from_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_inf_spearmen_0")
-- 			cm:remove_unit_from_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_inf_archers_0")
-- 			cm:remove_unit_from_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "wh2_main_hef_inf_archers_0")
-- 			
-- 			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "hef_yvr_inf_spears_yvresse")
-- 			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "yvr_hef_inf_archers_0")
-- 			cm:grant_unit_to_character(cm:char_lookup_str(eltharion_faction_leader_cqi), "yvr_hef_inf_archers_0")
	
        end
    end
end

