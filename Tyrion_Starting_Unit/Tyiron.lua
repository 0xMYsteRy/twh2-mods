function tyrion()
    if cm:is_new_game() then
        if cm:model():campaign_name("main_warhammer") then

			local tyrion_faction_obj = cm:get_faction("wh2_main_hef_eataine");
			local tyrion_faction_leader_cqi = tyrion_faction_obj:faction_leader():command_queue_index();
			
			cm:grant_unit_to_character(cm:char_lookup_str(tyrion_faction_leader_cqi), "wh2_main_hef_cav_dragon_princes")
			cm:grant_unit_to_character(cm:char_lookup_str(tyrion_faction_leader_cqi), "wh2_main_hef_mon_sun_dragon")
            cm:grant_unit_to_character(cm:char_lookup_str(tyrion_faction_leader_cqi), "wh2_dlc15_hef_inf_silverin_guard_0")
        end
    end
end

