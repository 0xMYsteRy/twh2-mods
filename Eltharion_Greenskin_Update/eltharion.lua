local debug_mode = false;

local ELTHARION_FACTION_KEY = "wh2_main_hef_yvresse";
local GROM_FACTION_KEY = "wh2_dlc15_grn_broken_axe";
local INVASION_EFFECT_BUNDLE = "storm_of_derp_sea_invader";
local GREENSKIN_CAMP_EFFECT_BUNDLE = "storm_of_derp_region_stolen";
--shoutout to everyone who refuses to spellcheck their code!
local AUTORESOLVE_CAPTURE_CHANCE = 15;
local TREASURY_AMOUNT_STOLEN = 0.15;

--TODO use MCT to fiddle with these
local settings = {}
settings.first_invasion_turn = 7;
settings.next_invasion_turn = settings.first_invasion_turn;
settings.expected_invasion_life = 25;
settings.next_invasion_roll_min = 4;
settings.next_invasion_roll_max = 8;
settings.invasion_delay_roll_min = 11;
settings.invasion_delay_roll_max = 19;
--track if Grom gets confederated, because invasions will continue while he's alive
settings.grom_current_faction_key = GROM_FACTION_KEY;
settings.grom_in_new_faction_cqi = false;
--track which warnings have already been given
settings.new_faction_warning = false;
settings.grom_defeat_party = false;
settings.ladrielle_info = false;

local greenskin_camps = {
	["wh2_main_great_vortex"] = {
		"wh2_main_vor_southern_badlands_galbaraz",
		"wh2_main_vor_southlands_world_edge_mountains_karag_orrud",
		"wh2_main_vor_jungles_of_green_mist_spektazuma"
	},
	["main_warhammer"] = {
		"wh2_main_charnel_valley_karag_orrud",
		"wh_main_southern_badlands_galbaraz",
		"wh2_main_jungles_of_green_mists_spektazuma"
	}
};

local greenskin_camps_cheats = {
	"wh2_main_encounter_at_sea_combat_1",
	"wh2_main_encounter_at_sea_combat_2",
	"wh2_main_encounter_at_sea_combat_3"
};

local replenish_invasion = {
	["wh_main_grn_greenskins"] = {
		"wh2_dlc15_grn_mon_rogue_idol_0",
		"wh_main_grn_mon_arachnarok_spider_0",
		"wh2_dlc15_grn_mon_stone_trolls_0"
	},
	["wh2_main_skv_skaven"] = {
		"wh2_main_skv_mon_rat_ogres",
		"wh2_main_skv_mon_hell_pit_abomination",
		"wh2_main_skv_art_plagueclaw_catapult"
	}
};

local agent_subtypes_by_culture = {
	["wh_main_grn_greenskins"] = {
		{"champion", "wh2_pro09_grn_black_orc_big_boss"},
		{"runesmith", "wh2_dlc15_grn_river_troll_hag"},
		{"spy", "grn_goblin_big_boss"},
		{"wizard", "grn_night_goblin_shaman"},
	},
	["wh2_main_skv_skaven"] = {
		{"champion", "wh2_dlc16_skv_chieftain"},
		{"runesmith", "wh2_dlc16_skv_packmaster"},
		{"spy", "wh2_main_skv_cha_assassin"},
		{"wizard", "wh2_main_skv_cha_plague_priest"},
	}
};

local skaven_general_types = {
	"wh2_dlc12_skv_warlock_master",
	"wh2_dlc14_skv_master_assassin"
};

local skaven_forenames = {
	"names_name_1646163903",
	"names_name_1646163904",
	"names_name_1646163905",
	"names_name_1646163906",
};

local skaven_surnames = {
	"names_name_1646163907",
	"names_name_1646163908",
	"names_name_1646163909",
	"names_name_1646163910",
};

local cultures_to_invasion_settings = {
	["wh_main_grn_greenskins"] = {
		{army_key = "lizard_retaliate_low_grn", min = 9, max = 11},
		{army_key = "lizard_retaliate_mid_grn", min = 12, max = 15},
		{army_key = "lizard_retaliate_hig_grn", min = 16, max = 18},
	},
	["wh2_main_skv_skaven"] = {
		{army_key = "lizard_retaliate_low_skv", min = 8, max = 11},
		{army_key = "lizard_retaliate_mid_skv", min = 9, max = 17},
		{army_key = "lizard_retaliate_hig_skv", min = 10, max = 19},
	},
};

--Note Tor Yvresse is explicitly off limits until there's nowhere else to go.
local invasion_regions = {
	["main_warhammer"] = {
		"wh2_main_yvresse_elessaeli",
		"wh2_main_yvresse_shrine_of_loec",
		"wh2_main_yvresse_tralinia",
	},
	["wh2_main_great_vortex"] = {
		"wh2_main_vor_northern_yvresse_sardenath",
		"wh2_main_vor_northern_yvresse_tralinia",
		"wh2_main_vor_southern_yvresse_cairn_thel",
		"wh2_main_vor_southern_yvresse_elessaeli",
		"wh2_main_vor_southern_yvresse_shrine_of_loec"
	}
};


local invasions_targetting_regions = {};


--Either there isn't a straight sea route to Ulthuan or it would take too
--long for them to show.  Either way, let's not start an invasion from there.
local forbidden_ports = {
	["main_warhammer"] = {
		["wh2_main_land_of_the_dervishes_sudenburg"] = true,
		["wh2_main_land_of_the_dervishes_plain_of_tuskers"] = true,
		["wh2_main_kingdom_of_beasts_serpent_coast"] = true,
		["wh2_main_dragon_isles_dragon_fang_mount"] = true,
		["wh2_main_dragon_isles_shattered_stone_isle"] = true,
		["wh2_main_dragon_isles_dread_rock"] = true,
		["wh2_main_gnoblar_country_shattered_cove"] = true,
		["wh_main_goromandy_mountains_baersonlings_camp"] = true,
		["wh_main_goromandy_mountains_frozen_landing"] = true,
		["wh_main_gianthome_mountains_sjoktraken"] = true,
		["wh_main_mountains_of_hel_winter_pyre"] = true,
		["wh_main_mountains_of_hel_altar_of_spawns"] = true,
		["wh_main_mountains_of_naglfari_varg_camp"] = true,
	},
	["wh2_main_great_vortex"] = {
		["wh2_main_vor_ironfrost_glacier_bear_isle"] = true,
		["wh2_main_vor_red_desert_drackla_spire"] = true,
		["wh2_main_vor_plain_of_spiders_clarak_spire"] = true,
		["wh2_main_vor_grey_guardians_sulpharets"] = true,
		["wh2_main_vor_the_dragon_isles_isle_of_the_crimson_skull"] = true,
		["wh2_main_vor_the_dragon_isles_the_blood_hall"] = true,
		["wh2_main_vor_coast_of_squalls_monument_of_the_sun"] = true,
	}
}


--for Mortal Empires only!
local cursed_start = {
	["wh_main_western_border_princes_myrmidens"] = true,
	["wh_main_western_badlands_stonemine_tower"] = true,
	["wh_main_eastern_border_princes_matorca"] = true,
	["wh_main_blood_river_valley_barak_varr"] = true,
}


local ignore_these_stances = {
	["MILITARY_FORCE_ACTIVE_STANCE_TYPE_SETTLE"] = true,
	["MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER"] = true,
	["MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP"] = true
};


--for capturing fools via autoresolve.
local pending_battle_family_members = {};


local ulthuan_regions = {
	["wh2_main_caledor_vauls_anvil"] = true,
	["wh2_main_caledor_tor_sethai"] = true,
	["wh2_main_tiranoc_whitepeak"] = true,
	["wh2_main_tiranoc_tor_anroc"] = true,
	["wh2_main_nagarythe_tor_dranil"] = true,
	["wh2_main_nagarythe_tor_anlec"] = true,
	["wh2_main_nagarythe_shrine_of_khaine"] = true,
	["wh2_main_chrace_tor_achare"] = true,
	["wh2_main_chrace_elisia"] = true,
	["wh2_main_cothique_mistnar"] = true,
	["wh2_main_cothique_tor_koruali"] = true,
	["wh2_main_yvresse_tor_yvresse"] = true,
	["wh2_main_yvresse_elessaeli"] = true,
	["wh2_main_yvresse_tralinia"] = true,
	["wh2_main_yvresse_shrine_of_loec"] = true,
	["wh2_main_eataine_lothern"] = true,
	["wh2_main_eataine_tower_of_lysean"] = true,
	["wh2_main_ellyrion_tor_elyr"] = true,
	["wh2_main_eagle_gate"] = true,
	["wh2_main_ellyrion_whitefire_tor"] = true,
	["wh2_main_griffon_gate"] = true,
	["wh2_main_avelorn_evershale"] = true,
	["wh2_main_unicorn_gate"] = true,
	["wh2_main_phoenix_gate"] = true,
	["wh2_main_avelorn_tor_saroir"] = true,
	["wh2_main_avelorn_gaean_vale"] = true,
	["wh2_main_saphery_tor_finu"] = true,
	["wh2_main_saphery_tower_of_hoeth"] = true,
	["wh2_main_saphery_port_elistor"] = true,
	["wh2_main_eataine_angerrial"] = true,
	["wh2_main_eataine_shrine_of_asuryan"] = true,
	["wh2_main_vor_straits_of_lothern_glittering_tower"] = true,
	["wh2_main_vor_caledor_vauls_anvil"] = true,
	["wh2_main_vor_caledor_caledors_repose"] = true,
	["wh2_main_vor_caledor_tor_sethai"] = true,
	["wh2_main_vor_tiranoc_whitepeak"] = true,
	["wh2_main_vor_tiranoc_tor_anroc"] = true,
	["wh2_main_vor_tiranoc_the_high_vale"] = true,
	["wh2_main_vor_tiranoc_salvation_isle"] = true,
	["wh2_main_vor_nagarythe_tor_dranil"] = true,
	["wh2_main_vor_nagarythe_tor_anlec"] = true,
	["wh2_main_vor_nagarythe_shrine_of_khaine"] = true,
	["wh2_main_vor_chrace_tor_gard"] = true,
	["wh2_main_vor_chrace_tor_achare"] = true,
	["wh2_main_vor_chrace_elisia"] = true,
	["wh2_main_vor_cothique_tor_koruali"] = true,
	["wh2_main_vor_cothique_mistnar"] = true,
	["wh2_main_vor_northern_yvresse_sardenath"] = true,
	["wh2_main_vor_northern_yvresse_tor_yvresse"] = true,
	["wh2_main_vor_northern_yvresse_tralinia"] = true,
	["wh2_main_vor_southern_yvresse_elessaeli"] = true,
	["wh2_main_vor_southern_yvresse_shrine_of_loec"] = true,
	["wh2_main_vor_southern_yvresse_cairn_thel"] = true,
	["wh2_main_vor_straits_of_lothern_lothern"] = true,
	["wh2_main_vor_straits_of_lothern_tower_of_lysean"] = true,
	["wh2_main_vor_ellyrion_the_arc_span"] = true,
	["wh2_main_vor_eagle_gate"] = true,
	["wh2_main_vor_ellyrion_tor_elyr"] = true,
	["wh2_main_vor_griffon_gate"] = true,
	["wh2_main_vor_ellyrion_reavers_mark"] = true,
	["wh2_main_vor_unicorn_gate"] = true,
	["wh2_main_vor_avelorn_evershale"] = true,
	["wh2_main_vor_phoenix_gate"] = true,
	["wh2_main_vor_avelorn_tor_saroir"] = true,
	["wh2_main_vor_avelorn_gaean_vale"] = true,
	["wh2_main_vor_saphery_tor_finu"] = true,
	["wh2_main_vor_saphery_shadow_peak"] = true,
	["wh2_main_vor_saphery_tower_of_hoeth"] = true,
	["wh2_main_vor_saphery_port_elistor"] = true,
	["wh2_main_vor_eataine_angerrial"] = true,
	["wh2_main_vor_eataine_shrine_of_asuryan"] = true,
};


if debug_mode then
	settings.first_invasion_turn = 2;
	settings.next_invasion_roll_min = 3;
	settings.next_invasion_roll_max = 5;
end


local FLANK_SPEED_STANCE = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_DOUBLE_TIME";
local function evg_enforce_flank_speed (char_obj)
	local mf = char_obj:military_force();
	if mf:active_stance() ~= FLANK_SPEED_STANCE and mf:can_activate_stance (FLANK_SPEED_STANCE) then
		cm:force_character_force_into_stance (cm:char_lookup_str (char_obj), FLANK_SPEED_STANCE);
	end
end


local function evg_grant_greenskin_camp_bonus_to_military_force (military_force, num_bonuses)
	local cqi = military_force:command_queue_index();
	for k = 1, num_bonuses do
		if not military_force:has_effect_bundle (greenskin_camps_cheats[k]) then
			out ("STORMOFDERP Military force with CQI " .. tostring (cqi) .. " gets " .. greenskin_camps_cheats[k]);
			cm:apply_effect_bundle_to_force (greenskin_camps_cheats[k], cqi, -1);
		end
	end
	for k = num_bonuses + 1, #greenskin_camps_cheats do
		if military_force:has_effect_bundle (greenskin_camps_cheats[k]) then
			out ("STORMOFDERP Military force with CQI " .. tostring (cqi) .. " should not have " .. greenskin_camps_cheats[k]);
			cm:remove_effect_bundle_from_force (greenskin_camps_cheats[k], cqi);
		end
	end

end

--assumes both invasion AND region_key are valid!
local function evg_save_invasion_metadata (invasion, region_key)
	local found_invasion = false;
	for i = 1, #invasions_targetting_regions do
		if invasions_targetting_regions[i].force_cqi == invasion.force_cqi then
			--out ("STORMOFDERP DEBUG evg_save_invasion_metadata " .. tostring (invasion.key) .. " has force with CQI " .. tostring (invasion.force_cqi) .. " updating record of target to " .. region_key);
			invasions_targetting_regions[i].target_region_key = region_key;
			found_invasion = true;
			break;
		end
	end

	if not found_invasion then
		--out ("STORMOFDERP DEBUG evg_save_invasion_metadata " .. tostring (invasion.key) .. " is new, recording that it has force with CQI " .. tostring (invasion.force_cqi) .. " and target " .. region_key);
		table.insert (invasions_targetting_regions, {force_cqi = invasion.force_cqi, target_region_key = region_key});
	end
end


--assumes force_cqi is valid!
local function evg_delete_invasion_metadata_by_cqi (force_cqi)
	for j = 1, #invasions_targetting_regions do
		if invasions_targetting_regions[j].force_cqi == force_cqi then
			table.remove (invasions_targetting_regions, j);
			return;
		end
	end
end


local function is_invasion_borked (invasion)
	local general = invasion:get_general();
	local general_has_good_reason_to_not_move = false;

	local current_x = -1;
	local current_y = -1;
	if general and not general:is_null_interface() then
		current_x = general:logical_position_x();
		current_y = general:logical_position_y();
		
		--out ("STORMOFDERP DEBUG general in stance " .. general:military_force():active_stance());
		--out ("STORMOFDERP DEBUG general besieging " .. tostring (general:is_besieging()));
		general_has_good_reason_to_not_move = (not not ignore_these_stances[general:military_force():active_stance()]) or general:is_besieging();
		out ("STORMOFDERP DEBUG general has good reason to not move: " .. tostring (general_has_good_reason_to_not_move));
	end
	out ("STORMOFDERP is_invasion_borked " .. invasion.key .. " currently positioned at (" .. tostring (current_x) .. ", " .. tostring (current_y) .. ")");
	out ("STORMOFDERP is_invasion_borked state [" .. tostring (invasion.turns_without_moving) .. ", " .. tostring (invasion.old_x) .. ", " .. tostring (invasion.old_y) .. "]");

	if not invasion.turns_without_moving then
		--out ("STORMOFDERP DEBUG is_invasion_borked TURNS_WITHOUT_MOVING unset, setting for first time.");
		invasion.turns_without_moving = 0;
		invasion.old_x = current_x;
		invasion.old_y = current_y;
	else
		if (invasion.old_x == current_x) and (invasion.old_y == current_y) then
			--out ("STORMOFDERP DEBUG is_invasion_borked general hasn't moved, incrementing TURNS_WITHOUT_MOVING");
			invasion.turns_without_moving = invasion.turns_without_moving + 1;
		else
			--out ("STORMOFDERP DEBUG is_invasion_borked general did move, resetting TURNS_WITHOUT_MOVING");
			invasion.turns_without_moving = 0;
			invasion.old_x = current_x;
			invasion.old_y = current_y;
		end
	end

	--out ("STORMOFDERP DEBUG is_invasion_borked " .. invasion.key .. " hasn't moved for " .. tostring (invasion.turns_without_moving) .. " turns.");
	--local fmg = invasion_manager:get_invasion (invasion.key);
	--out ("STORMOFDERP DEBUG is_invasion_borked does this work " .. tostring (fmg.turns_without_moving));

	return (invasion.turns_without_moving > 0 and not general_has_good_reason_to_not_move) or
	       (invasion.turns_without_moving > 5);
end


--1 = early game
--2 = mid game
--3 = late game
local function evg_get_difficulty()
	local difficulty = 1;
	if cm:turn_number() >= 30 and cm:turn_number() < 60 then
		difficulty = 2;
	elseif cm:turn_number() >= 60 then
		difficulty = 3;
	end

	return difficulty;
end


local function evg_get_invasion_rank()
	local eltharion_rank = cm:get_faction (ELTHARION_FACTION_KEY):faction_leader():rank();
	local difficulty = evg_get_difficulty()

	if 1 == difficulty then
		return math.min (39, eltharion_rank + 1);
	elseif 2 == difficulty then
		return cm:random_number (math.min (39, eltharion_rank+2), math.max (1, eltharion_rank-2));
	else
		return cm:random_number (math.min (39, eltharion_rank+10), math.max (1, eltharion_rank-1));
	end
end


--If it's not mentioned in cultures_to_invasion_settings then it's not supported
--as an invasion culture, full stop.
--TODO this will likely screw us when we try to add Arkhan!
local function evg_culture_is_supported (culture_key)
	return not not cultures_to_invasion_settings[culture_key];
end


local function evg_determine_faction_weight (faction_obj)
	if (not faction_obj) or faction_obj:is_null_interface() or (not evg_culture_is_supported (faction_obj:culture())) then
		return -1;
	end

	local name = faction_obj:name();
	if name:ends_with ("_waaagh") or
	   name:ends_with ("_invasion") or
	   name:ends_with ("_rebels") or
	   name:ends_with ("_separatists") or
	   name:starts_with ("wh2_main_skv_unknown_clan") or
	   string.match (name, "_qb")
	then
		return -1;
	elseif faction_obj:is_vassal() or faction_obj:is_human() then
		return -1;	--nope
	elseif faction_obj:culture() == "wh2_main_skv_skaven" then
		if faction_obj:is_dead() then
			return -1;
		else
			return 1;
		end
	elseif faction_obj:is_dead() then
		return 8;
	elseif faction_obj:at_war_with (cm:get_faction ("wh2_main_hef_yvresse")) then
		return 160;
	else
		return 40 + faction_obj:region_list():num_items();
	end
end


local function evg_new_invasion_key()
	return "sodevg_invasion_" .. tostring (cm:turn_number()) .. "_" .. tostring (cm:random_number (1000));
end


local function evg_is_region_in_ulthuan (region_key)
	return not not ulthuan_regions[region_key];
end


local function evg_find_yvresse_target()
	status, details = xpcall (
	  function()

	local yvresse_regions = invasion_regions[cm:get_campaign_name()];
	local region_candidates = weighted_list:new();
	for i = 1, #yvresse_regions do
		local region_obj = cm:get_region (yvresse_regions[i]);
		if region_obj and not region_obj:is_abandoned() then
			local region_owner = region_obj:owning_faction();
			out ("STORMOFDERP looking at " .. region_obj:name() .. " owned by " .. region_owner:name());
			if ELTHARION_FACTION_KEY == region_owner:name() then
				if (not region_obj:garrison_residence():is_null_interface()) and region_obj:garrison_residence():is_under_siege() then
					out ("STORMOFDERP rejecting because it's under siege.");
				else
					region_candidates:add_item (region_obj:name(), 1);
				end
			elseif not (region_owner:at_war_with (cm:get_faction (ELTHARION_FACTION_KEY)) or region_owner:name() == "rebels") then
				if (not region_obj:garrison_residence():is_null_interface()) and region_obj:garrison_residence():has_army() then
					out ("STORMOFDERP rejecting because it's got an army literally right next to it.");
				else
					region_candidates:add_item (region_obj:name(), 5);
				end
			end
		end
	end

	if #region_candidates.items > 0 then
		return region_candidates:weighted_select();
	end

	local yvresse_faction = cm:get_faction (ELTHARION_FACTION_KEY);
	if (not yvresse_faction:is_dead()) and yvresse_faction:has_home_region() then
		out ("STORMOFDERP no valid targets left, go after " .. yvresse_faction:name() .. " home region next.");
		return yvresse_faction:home_region():name();
	end

	return false;

	  end,
	  function (err)
	    out ("STORMOFDERP evg_find_yvresse_target ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


local function evg_is_valid_port (region_obj)
	return (not region_obj:is_abandoned()) and region_obj:settlement():is_port() and (not forbidden_ports[cm:get_campaign_name()][region_obj:name()])
end


local function evg_find_yvresse_invasion_origin()
	if debug_mode then
		return "wh2_main_vor_southern_yvresse_elessaeli";
	end

	local region_candidates = weighted_list:new();

	local region_list = cm:model():world():region_manager():region_list();
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i);

		-- Region must not be abandoned and must be coastal
		if evg_is_valid_port (region) then
			if region:owning_faction():culture() == "wh_main_grn_greenskins" then
				region_candidates:add_item (region:name(), 50);
			elseif region:owning_faction():culture() == "wh2_main_skv_skaven" then
				region_candidates:add_item (region:name(), 10);
			elseif region:owning_faction():culture() ~= "wh2_main_hef_high_elves" then
				region_candidates:add_item (region:name(), 1);
			end
		end
	end

	if 0 == #region_candidates.items then
		return false;
	end
	
	return region_candidates:weighted_select();
end


--we are NOT using invasion:set_target ("REGION" ...
--because that ends with cm:attack_region, which bypasses walls, which means
--the player has no chance to run back and defend.
local function evg_set_target_to_region (invasion, region_key, fuckit)
	local target_faction_key = cm:get_region (region_key):owning_faction():name();
	local yvresse_faction = cm:get_faction (ELTHARION_FACTION_KEY);

	if yvresse_faction:has_home_region() and yvresse_faction:home_region():name() == region_key then
		out ("STORMOFDERP attacking Tor Yvresse directly and ignoring walls.");
		invasion:set_target ("REGION", region_key, target_faction_key);
		invasion.evg_target_region_key = region_key;
	elseif target_faction_key ~= ELTHARION_FACTION_KEY or fuckit then
		out ("STORMOFDERP targetting " .. region_key .. " directly and ignoring walls.");
		if fuckit then
			out ("STORMOFDERP this is a forced retarget.");
		end
		
		invasion:set_target ("REGION", region_key, target_faction_key);
		invasion.evg_target_region_key = region_key;
	else
		local dest_x, dest_y = cm:find_valid_spawn_location_for_character_from_settlement (invasion.faction, region_key, false, true, 6);
		if dest_x == -1 then
			out ("STORMOFDERP DEBUG evg_set_target_to_region couldn't find spawn point 6 units away, going to try 14.");
			dest_x, dest_y = cm:find_valid_spawn_location_for_character_from_settlement (invasion.faction, region_key, false, true, 14);
		end
		if dest_x == -1 then
			out ("STORMOFDERP DEBUG evg_set_target_to_region couldn't find spawn point 14 units away, going to try 24 and not necessarily in same region.");
			dest_x, dest_y = cm:find_valid_spawn_location_for_character_from_settlement (invasion.faction, region_key, false, false, 24);
		end

		if dest_x ~= -1 then
			out ("STORMOFDERP found spawn coordinates near " .. region_key .. ": (" .. tostring (dest_x) .. ", " .. tostring (dest_y) .. ")");
			local target = {x = dest_x, y = dest_y};
			invasion:set_target ("LOCATION", target, target_faction_key);
			invasion.evg_target_region_key = region_key;
		else
			out ("STORMOFDERP couldn't find spawn coordinates for " .. region_key .. ", targetting region directly.");
			invasion:set_target ("REGION", region_key, target_faction_key);
			invasion.evg_target_region_key = region_key;
		end
	end

	evg_save_invasion_metadata (invasion, region_key);
end


local function evg_invasion_needs_new_target (invasion)
	local needs_new_target = false;

	if invasion:has_target() then
		if "REGION" == invasion.target_type then
			out ("STORMOFDERP " .. invasion.key .. " already has an official target: " .. invasion.target .. " and unofficial target: " .. tostring (invasion.evg_target_region_key));
		elseif "LOCATION" == invasion.target_type then
			out ("STORMOFDERP " .. invasion.key .. " already has a target: (" .. tostring (invasion.target.x) .. ", " .. tostring (invasion.target.y) .. ")");
		else
			out ("STORMOFDERP " .. invasion.key .. " has unplanned invasion type: " .. tostring (invasion.target_type));
		end

		local test_region = cm:get_region (invasion.evg_target_region_key);

		if test_region and (not test_region:is_null_interface()) then
			if test_region:is_abandoned() then
				out ("STORMOFDERP but that target doesn't exist anymore!");
				needs_new_target = true;
			elseif test_region:owning_faction():name() == invasion.faction then
				out ("STORMOFDERP invasion captured target!");
				needs_new_target = true;
			elseif test_region:owning_faction():at_war_with (cm:get_faction (ELTHARION_FACTION_KEY)) then
				out ("STORMOFDERP another enemy of Yvresse captured target, good enough for me!");
				needs_new_target = true;
			end
		else
			out ("STORMOFDERP DEBUG evg_invasion_needs_new_target couldn't find region " .. tostring (invasion.evg_target_region_key));
		end

	else
		needs_new_target = true;
	end
	
	return needs_new_target;
end


local function evg_retarget_invasion (force)
	status, details = xpcall (
	  function()

	local new_target_key = evg_find_yvresse_target();
	local yvresse_faction = cm:get_faction (ELTHARION_FACTION_KEY);

	if new_target_key then
		local new_target_faction_key = cm:get_region (new_target_key):owning_faction():name();
		if new_target_faction_key ~= force:faction():name() then
			out ("STORMOFDERP selecting new target: " .. new_target_key);

			local invasion2 = invasion_manager:new_invasion_from_existing_force (evg_new_invasion_key(), force);
			evg_set_target_to_region (invasion2, new_target_key, true);
			invasion2:should_maintain_army (true, 0.75);

			invasion2:start_invasion (function (invasion) end, true, false, true);

			if cm:turn_number() >= settings.next_invasion_turn then
				settings.next_invasion_turn = cm:turn_number() + 1;
			end
		else
			out ("STORMOFDERP no new target selected this turn.");
		end
	end

	  end,
	  function (err)
	    out ("STORMOFDERP evg_retarget_invasion ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end
end


local function evg_cleanup_old_invasions()
	status, details = xpcall (
	  function()

	local remove_me = {};
	local release_me = {};
	for k,v in pairs (invasion_manager.invasions) do
		if k:starts_with ("sodevg") then
			local general_borked = false;
			local force_borked = false;
			out ("STORMOFDERP found invasion " .. k);
			local invasion = invasion_manager:get_invasion (k);
			out ("STORMOFDERP DEBUG retrieved invasion " .. tostring (invasion.key));
			out ("STORMOFDERP DEBUG invasion faction " .. tostring (invasion.faction_key));
			out ("STORMOFDERP DEBUG looking for character with CQI " .. tostring (invasion.general_cqi));
			out ("STORMOFDERP DEBUG looking for force with CQI " .. tostring (invasion.force_cqi));
			local general = cm:get_character_by_cqi (invasion.general_cqi);
			if (not general) or (general:is_null_interface()) or not cm:char_is_mobile_general_with_army (general) then
				general_borked = true;
				out ("STORMOFDERP invalid general");
				local military_force = cm:model():military_force_for_command_queue_index (invasion.force_cqi);
				if military_force and (not military_force:is_null_interface()) and military_force:has_general() then
					general = military_force:general_character();
					if general and (not general:is_null_interface()) and general:command_queue_index() ~= invasion.general_cqi then
						out ("STORMOFDERP found replacement general, resetting metadata");
						invasion.general_cqi = general:command_queue_index();
						general_borked = false;
					end
				else
					out ("STORMOFDERP invalid force");
					force_borked = true;
				end
				if general_borked or force_borked then
					out ("STORMOFDERP assuming invasion is borked and tagging for hard removal.");
					table.insert (remove_me, k);
				end
				if general_borked and general then
					out ("STORMOFDERP DEBUG general: " .. tostring (general));
					cm:output_campaign_obj (general, 0);
					out ("STORMOFDERP DEBUG general:is_null_interface(): " .. tostring (general:is_null_interface()));
					if not general:is_null_interface() then
						out ("STORMOFDERP DEBUG general is literal general? " .. tostring (cm:char_is_general_with_army (general)));
						if general:has_military_force() then
							out ("STORMOFDERP debug general is militia? " .. tostring (general:military_force():is_armed_citizenry()));
						else
							out ("STORMOFDERP debug general has no military force??");
						end
					end
				end
			end

			--re-testing because the first failed test could be reset.
			if general and not general_borked then
				out ("STORMOFDERP invasion general is " .. cm:char_lookup_str (general) .. " from " .. general:faction():name());
				if is_invasion_borked (invasion) then
					table.insert (release_me, k);
				end
			end
		end
	end

	for i = 1, #remove_me do
		out ("STORMOFDERP removing old invasion " .. remove_me[i]);
		local invasion = invasion_manager:get_invasion (release_me[i]);
		if invasion and invasion.force_cqi then
			evg_delete_invasion_metadata_by_cqi (invasion.force_cqi);
		end
		invasion_manager:remove_invasion (remove_me[i]);
	end

	for i = 1, #release_me do
		out ("STORMOFDERP invasion is stuck! Releasing " .. release_me[i]);
		local invasion = invasion_manager:get_invasion (release_me[i]);
		local old_force = invasion:get_force();
		invasion:release();
		
		if not old_force:is_null_interface() then
			evg_retarget_invasion (old_force);
		end
	end

	  end,
	  function (err)
	    out ("STORMOFDERP evg_cleanup_old_invasions ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


local function evg_advance_existing_invasions_against (faction_obj)
	status, details = xpcall (
	  function()

	--build key list first so we're not modifying something that we're iterating over.
	local invasion_keys = {};
	for k,v in pairs (invasion_manager.invasions) do
		if k:starts_with ("sodevg") then
			out ("STORMOFDERP found invasion " .. k);
			table.insert (invasion_keys, k);
		end
	end

	for i = 1, #invasion_keys do			
		local invasion = invasion_manager:get_invasion (invasion_keys[i]);
		local general = invasion:get_general();
		local invasion_faction = general:faction();

		if general:military_force():unit_list():num_items() < 17 then
			local has_besieger = false;
			local replenish_units = replenish_invasion[invasion_faction:culture()];
			for q = 1, #replenish_units do
				if general:military_force():unit_list():has_unit (replenish_units[q]) then
					has_besieger = true;
					break;
				end
			end

			local replenishment_chance;
			if debug_mode then
				replenishment_chance = 50;
			elseif has_besieger then
				replenishment_chance = 10;
			else
				replenishment_chance = 20;
			end

			for q = 1, #replenish_units do
				if cm:model():random_percent (replenishment_chance) then
					cm:grant_unit_to_character (cm:char_lookup_str (general), replenish_units[q]);
				end
			end
		end

		if general:military_force():has_effect_bundle (INVASION_EFFECT_BUNDLE) then
			local hf = cm:get_human_factions()
			if general:is_at_sea() then
				if general:faction():losing_money() and general:faction():treasury() < 1 then
					--a bankrupt invasion is not very scary, so try to stop that from happening.
					cm:treasury_mod (general:faction():name(), general:military_force():upkeep() * 4);
				end

				evg_enforce_flank_speed (general);

				for ii = 1, #hf do
					if (not settings["invasion_seen_by_" .. hf[ii]]) and general:is_visible_to_faction (hf[ii]) then
						settings["invasion_seen_by_" .. hf[ii]] = true;

						local cqi = general:command_queue_index();
						cm:callback (function()
							cm:scroll_camera_with_cutscene_to_character (2, nil, cqi);
						end, 1);

						cm:show_message_event_located(
							hf[ii],
							"wh_event_feed_storm_of_derp_invasion_soon_primary_detail",
							"wh_event_feed_storm_of_derp_invasion_soon_secondary_detail",
							"wh_event_feed_storm_of_derp_invasion_soon_flavour_text",
							general:logical_position_x(), 
							general:logical_position_y(),
							true,
							31329
						);
					end
				end				
			elseif general:has_region() then
				local general_region_key = general:region():name();

				if evg_is_region_in_ulthuan (general_region_key) then
					--landfall in Ulthuan!
					local force_cqi = general:military_force():command_queue_index();
					cm:remove_effect_bundle_from_force (INVASION_EFFECT_BUNDLE, force_cqi);

					local cheats_needed = evg_get_difficulty();

					--These bonuses could be removed later if the general is from
					--Grom's tribe and Grom doesn't have the camps. Alternately
					--Grom could already have all 3 camps in which case this
					--general should already have the effect bundles!
					evg_grant_greenskin_camp_bonus_to_military_force (general:military_force(), 3);

					for ii = 1, #hf do
						if hf[ii] ~= ELTHARION_FACTION_KEY then
							local human_faction = cm:get_faction (hf[ii]);
							if human_faction:allied_with (cm:get_faction (ELTHARION_FACTION_KEY)) then
								cm:show_message_event_located(
									hf[ii],
									"wh_event_feed_storm_of_derp_somehow_greenskin_primary_detail",
									"wh_event_feed_storm_of_derp_somehow_greenskin_secondary_detail",
									"wh_event_feed_storm_of_derp_somehow_greenskin_flavour_text",
									general:logical_position_x(), 
									general:logical_position_y(),
									true,
									31328
								);
							else
								out ("STORMOFDERP " .. hf[ii] .. " is not allied with Eltharion, so they don't get a popup.");
							end
						else
							if cm:get_local_faction_name (true) == ELTHARION_FACTION_KEY then
								local cqi = general:command_queue_index();
								cm:callback (function()
									cm:scroll_camera_with_cutscene_to_character (2, nil, cqi);
								end, 0.5);
								cm:callback (function()
									cm:show_advice ("wh2_dlc15.camp.vortex.eltharion.intro.001", true);
								end, 1);
							end
						end
					end


					--give invasion a random hero!
					local agents_table = agent_subtypes_by_culture[invasion_faction:culture()];

					local new_agent_type = agents_table[cm:random_number (#agents_table)];
					local pos_x, pos_y = cm:find_valid_spawn_location_for_character_from_character (invasion_faction:name(), cm:char_lookup_str (general), true, 3);
					local new_agent_cqi = cm:create_agent (invasion_faction:name(), new_agent_type[1], new_agent_type[2], pos_x, pos_y, false,
						function(cqi)
							cm:callback (function()
								--we don't try to remove a unit if there isn't room
								--specifically because we launch invasions small
								--enough to *have* room!
								local cc = cm:get_character_by_cqi (cqi);
								cm:embed_agent_in_force (cc, general:military_force());

								local invasion_rank = evg_get_invasion_rank();
								cm:add_agent_experience (cm:char_lookup_str (cc), invasion_rank, true);
							end, 1);
						end
					);

					out ("STORMOFDERP landfall handler complete.");
				else
					out ("STORMOFDERP invasion is in " .. general_region_key .. " which is not in Ulthuan! Skipping");
				end
			else
				out ("STORMOFDERP general isn't at sea and doesn't have a region.  How does this happen?");
			end
		end

		if evg_invasion_needs_new_target (invasion) then
			invasion:release();

			evg_retarget_invasion (general:military_force());
		end
	end

	  end,
	  function (err)
	    out ("STORMOFDERP evg_advance_existing_invasions_against ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


local function evg_invade_ulthuan()
	status, details = xpcall (
	  function()

	out ("STORMOFDERP it's time for an invasion!");

	local target_region_key = evg_find_yvresse_target();
	if not target_region_key then
		out ("STORMOFDERP no invasion targets found, better luck next turn.");
		return;
	end

	local target_region = cm:get_region (target_region_key);
	local region_owner_key = target_region:owning_faction():name();

	local starting_location;
	if region_owner_key ~= ELTHARION_FACTION_KEY then
		--target isn't Yvresse, so fair play to start them in the same region.
		starting_location = target_region_key;
		out ("STORMOFDERP Invasion will start next door @ " .. starting_location);
	else
		starting_location = evg_find_yvresse_invasion_origin();
		if not starting_location then
			out ("STORMOFDERP no valid starting regions found, better luck next turn.");
			return;
		end
		out ("STORMOFDERP Invasion will start in the distance @ " .. starting_location);
	end

	if cursed_start[starting_location] then
		out ("STORMOFDERP Invasion is suspiciously close to Eltharion, let's target him instead.");
		target_region_key = "wh_main_southern_badlands_gronti_mingol";
		target_region = cm:get_region (target_region_key);
	end

	local invasion_candidates = weighted_list:new();
	local faction_list = cm:model():world():faction_list();
	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i);
		local weight = evg_determine_faction_weight (faction);
		if weight > 0 then
			invasion_candidates:add_item (faction:name(), weight);
		end
	end

	if #invasion_candidates.items == 0 then
		out ("STORMOFDERP no invasion candidates found, better luck next turn.");
		return;
	end

	local invasion_faction_key = invasion_candidates:weighted_select();
	local invasion_faction = cm:get_faction (invasion_faction_key);
	out ("STORMOFDERP " .. invasion_faction_key .. " will invade " .. target_region_key .. " currently owned by " .. region_owner_key);

	local spawn_x, spawn_y = cm:find_valid_spawn_location_for_character_from_settlement (invasion_faction_key, starting_location, true, false, 5);
	if spawn_x == -1 then
		spawn_x, spawn_y = cm:find_valid_spawn_location_for_character_from_settlement (invasion_faction_key, starting_location, false, false, 10);
		if spawn_x == -1 then
			out ("STORMOFDERP invasion is cursed, rescheduling.");
			return;
		end
	end

	settings.next_invasion_turn = cm:random_number (settings.next_invasion_roll_max, settings.next_invasion_roll_min) + cm:turn_number();
	out ("STORMOFDERP next invasion will happen at turn " .. tostring (settings.next_invasion_turn));

	local invasion_index = evg_get_difficulty();

	local settings_for_this_invasion = cultures_to_invasion_settings[invasion_faction:culture()][invasion_index];
	local unit_list = random_army_manager:generate_force (settings_for_this_invasion.army_key, cm:random_number (settings_for_this_invasion.max, settings_for_this_invasion.min), false);

	local yvresse_invasion = invasion_manager:new_invasion (evg_new_invasion_key(), invasion_faction_key, unit_list, {spawn_x, spawn_y});

	--I believe 25 turns should be sufficient to traverse the map in Mortal
	--Empires, but might need to be revisited in Immortal Empires.
	yvresse_invasion:apply_effect ("wh2_dlc16_bundle_military_upkeep_free_force_immune_to_regionless_attrition", settings.expected_invasion_life);
	if region_owner_key == ELTHARION_FACTION_KEY then
		--target *is* Yvresse, so make sure invasion can actually reach!
		yvresse_invasion:apply_effect (INVASION_EFFECT_BUNDLE, -1);
	end
	yvresse_invasion:should_maintain_army (true, 0.5);

	if "wh2_main_skv_skaven" == invasion_faction:culture() then
		yvresse_invasion:create_general (
			false,
			skaven_general_types[cm:random_number (#skaven_general_types)],
			skaven_forenames[cm:random_number (#skaven_forenames)],
			"",
			skaven_surnames[cm:random_number (#skaven_surnames)],
			""
		);
	end		

	yvresse_invasion:start_invasion (
		function (invasion)
			evg_set_target_to_region (invasion, target_region_key);

			local general = invasion:get_general();
			if general:command_queue_index() ~= invasion.general_cqi then
				out ("STORMOFDERP we're starting with invasion CQI messed up already, resetting to " .. tostring (general:command_queue_index()));
				invasion.general_cqi = general:command_queue_index();
			else
				out ("STORMOFDERP starting with general CQI " .. tostring (general:command_queue_index()));
			end

			local invasion_rank = evg_get_invasion_rank();
			local general_cls = cm:char_lookup_str (general);
			cm:add_agent_experience (general_cls, invasion_rank, true);

			local invasion_faction_key = general:faction():name();
			local mf = general:military_force();

			evg_enforce_flank_speed (general);

			if not general:faction():at_war_with (cm:get_faction (ELTHARION_FACTION_KEY)) then
				cm:force_declare_war (invasion_faction_key, ELTHARION_FACTION_KEY, false, false, false);
			end

			--a revived faction will probably suffer attrition due to
			--lack of home region, so give these pirate bastards a leg
			--up by stealing another faction's settlements!
			local check_these_regions = greenskin_camps[cm:get_campaign_name()];
			local hf = cm:get_human_factions();
			out ("STORMOFDERP checking if any greenskin camps should be transferred to invasion.");
			for j = 1, #check_these_regions do
				local region = cm:get_region (check_these_regions[j]);
				if region and not (region:is_abandoned() or region:owning_faction():is_faction (general:faction())) then
					local owner = region:owning_faction();
					if not (owner:is_human() or region:has_effect_bundle (GREENSKIN_CAMP_EFFECT_BUNDLE)) then
						if owner:culture() == general:faction():culture() then
							if owner:name() ~= invasion_faction_key then
								--this should cover the trespassing
								cm:apply_dilemma_diplomatic_bonus (invasion_faction_key, owner:name(), 1);
							end
						else
							local belongs_to_human_vassal = false;
							for k = 1, #hf do
								if region:owning_faction():is_vassal_of (cm:get_faction (hf[k])) then
									belongs_to_human_vassal = true;
								end
							end

							if not belongs_to_human_vassal then
								out ("STORMOFDERP " .. invasion_faction_key .. " gets " .. region:name());
								cm:transfer_region_to_faction (region:name(), invasion_faction_key);
								--mark the region as stolen so no one else can steal it
								cm:apply_effect_bundle_to_region (GREENSKIN_CAMP_EFFECT_BUNDLE, region:name(), settings.expected_invasion_life);
							end
						end
					end
				end
			end

			out ("STORMOFDERP yvresse_invasion:start_invasion callback complete. This is where the fun begins.");
		end,
		true,
		false,
		true
	);

	  end,
	  function (err)
	    out ("STORMOFDERP evg_invade_ulthuan ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


local function evg_find_grom_in_another_faction()
	if settings.grom_current_faction_key ~= GROM_FACTION_KEY then
		local greenskin_faction = cm:get_faction (settings.grom_current_faction_key);
		if greenskin_faction and not greenskin_faction:is_dead() then
			local grom = cm:get_character_by_cqi (settings.grom_in_new_faction_cqi);
			if grom and grom:faction():name() == settings.grom_current_faction_key then
				return grom;
			end
		end
	end
	return false;
end


local function evg_attempt_to_reattach_invasions()
	local known_forces = {};
	local remove_invasions = {};
	for k,v in pairs (invasion_manager.invasions) do
		if k:starts_with ("sodevg") then
			local invasion = invasion_manager:get_invasion (k);
			--out ("STORMOFDERP DEBUG recording invasion " .. k .. " has force CQI " .. tostring (invasion.force_cqi));
			known_forces[invasion.force_cqi] = true;
		end
	end

	for i = 1, #invasions_targetting_regions do
		--out ("STORMOFDERP DEBUG looking at invasions_targetting_regions # " .. tostring (i));
		if invasions_targetting_regions[i].force_cqi then
			if known_forces[invasions_targetting_regions[i].force_cqi] then
				out ("STORMOFDERP DEBUG force with CQI " .. tostring (invasions_targetting_regions[i].force_cqi) .. " is known to us.  Skipping");
			else
				local military_force = cm:model():military_force_for_command_queue_index (invasions_targetting_regions[i].force_cqi);
				if (not military_force) or military_force:is_null_interface() then
					out ("STORMOFDERP force with CQI " .. tostring (invasions_targetting_regions[i].force_cqi) .. " does not exist.");
					table.insert (remove_invasions, invasions_targetting_regions[i].force_cqi);
				else
					--We tracked this invasion at one point, but we couldn't find it in the list of active invasions.
					--Does this mean the invasion reached its target?
					out ("STORMOFDERP force CQI " .. tostring (invasions_targetting_regions[i].force_cqi) .. " was targetting " .. invasions_targetting_regions[i].target_region_key);
					local region = cm:get_region (invasions_targetting_regions[i].target_region_key);
					if region and (region:is_null_interface() or region:is_abandoned() or region:owning_faction():name() ~= ELTHARION_FACTION_KEY) then
						out ("STORMOFDERP someone already took care of " .. invasions_targetting_regions[i].target_region_key);
						if (not not ignore_these_stances[military_force:active_stance()]) or (military_force:has_general() and military_force:general_character():is_besieging()) then
							out ("STORMOFDERP force with CQI " .. tostring (military_force:command_queue_index()) .. " is busy, maybe retarget later?");
						else
							out ("STORMOFDERP we'll retarget force with CQI " .. tostring (military_force:command_queue_index()));
							evg_retarget_invasion (military_force);
						end
					end
				end
			end
		else
			out ("STORMOFDERP DEBUG invasions_targetting_regions # " .. tostring (i) .. " is busted, deleting and exiting early.");
			table.remove (invasions_targetting_regions, i);
			break;
		end
	end

	for i = 1, #remove_invasions do
		evg_delete_invasion_metadata_by_cqi (remove_invasions[i]);
	end
end


local function storm_of_derp_yvresse_invasion_check (context)
	status, details = xpcall (
	  function()

	local yvresse_faction = context:faction();
	local grom_faction = cm:get_faction (GROM_FACTION_KEY);

	if grom_faction:is_dead() and (not settings.grom_defeat_party) and (not evg_find_grom_in_another_faction()) then

		if yvresse_faction:has_home_region() then
			cm:show_message_event_located (
				ELTHARION_FACTION_KEY,
				"wh_event_feed_storm_of_derp_grom_defeated_primary_detail",
				"wh_event_feed_storm_of_derp_grom_defeated_secondary_detail",
				"wh_event_feed_storm_of_derp_grom_defeated_flavour_text",
				yvresse_faction:home_region():settlement():logical_position_x(), 
				yvresse_faction:home_region():settlement():logical_position_y(),
				true,
				31331
			);

			settings.grom_defeat_party = true;
		end
	end

	evg_cleanup_old_invasions();

	evg_attempt_to_reattach_invasions();

	evg_advance_existing_invasions_against (yvresse_faction);

	out ("STORMOFDERP next invasion at turn " .. tostring (settings.next_invasion_turn) .. " it is currently turn " .. tostring (cm:turn_number()));
	if cm:turn_number() >= settings.next_invasion_turn then
		if not grom_faction:is_dead() then
			evg_invade_ulthuan();
		else
			local grom = evg_find_grom_in_another_faction();
			if grom then
				evg_invade_ulthuan();

				if (not settings.new_faction_warning) and grom:is_visible_to_faction (ELTHARION_FACTION_KEY) then
					local cqi = grom:command_queue_index();
					cm:callback (function()
						cm:scroll_camera_with_cutscene_to_character (2, nil, cqi);
					end, 1);

					cm:show_message_event_located (
						ELTHARION_FACTION_KEY,
						"wh_event_feed_storm_of_derp_grom_back_primary_detail",
						"wh_event_feed_storm_of_derp_grom_back_secondary_detail",
						"wh_event_feed_storm_of_derp_grom_back_flavour_text",
						grom:logical_position_x(), 
						grom:logical_position_y(),
						true,
						31330
					);
					
					settings.new_faction_warning = true;
				end
			end
		end
	end

	  end,
	  function (err)
	    out ("STORMOFDERP storm_of_derp_yvresse_invasion_check ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


local function storm_of_derp_greenskin_camp_nerf (context)
	status, details = xpcall (
	  function()

	local yvresse = context:faction();

	local camps_owned = 0;
	local greenskin_camps_vortex = greenskin_camps["wh2_main_great_vortex"];
	for i = 1, #greenskin_camps_vortex do
		if yvresse:has_effect_bundle ("wh2_dlc15_bundle_eltharion_greenskin_camp_reward_" .. tostring (i)) then
			camps_owned = camps_owned + 1
		end
	end

	local nerf = 0;
	if camps_owned == 1 then
		nerf = -1;
	elseif camps_owned == 2 or camps_owned == 3 then
		nerf = -2;
	end

	if nerf ~= 0 then
		--out ("STORMOFDERP DEBUG # camps owned: " .. tostring (camps_owned) .. " nerf amount: " .. tostring (nerf));
		cm:faction_add_pooled_resource (ELTHARION_FACTION_KEY, "wardens_supply", "storm_of_derp_greenskin_camp_nerf", nerf);
	end

	  end,
	  function (err)
	    out ("STORMOFDERP storm_of_derp_greenskin_camp_nerf ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


--keeping this here as a monument to my own stupidity.
local function storm_of_derp_action_taken_nerf (context)

	local action = context:action_key();

	if action == "wh2_dlc15_prison_action_indoctrinate" then
		cm:faction_add_pooled_resource (ELTHARION_FACTION_KEY, "wardens_supply", "storm_of_derp_greenskin_camp_nerf", -2);
	elseif action == "wh2_dlc15_prison_action_execute" then
		cm:faction_add_pooled_resource (ELTHARION_FACTION_KEY, "wardens_supply", "storm_of_derp_greenskin_camp_nerf", -1);
	end

end


local function storm_of_derp_greenskin_faction_dead (context)
	local pending_battle = cm:model():pending_battle();
	if not pending_battle:has_been_fought() then
		--out ("STORMOFDERP DEBUG storm_of_derp_greenskin_faction_dead pending battle hasn't been fought yet!");
		return;
	end

	local factions_destroyed = {};

	if cm:pending_battle_cache_faction_is_attacker (ELTHARION_FACTION_KEY) then
		out ("STORMOFDERP Yvresse was an attacker.");
		local num_defenders = cm:pending_battle_cache_num_defenders()
		for i = 1, num_defenders do
			local defender_cqi, defender_force_cqi, defender_name = cm:pending_battle_cache_get_defender(i);
			local defender_faction = cm:get_faction (defender_name);
			if defender_faction and defender_faction:is_dead() and defender_faction:culture() == "wh_main_grn_greenskins" then
				out ("STORMOFDERP wow you killed " .. defender_name);
				factions_destroyed[defender_name] = true;
			end
		end
	elseif cm:pending_battle_cache_faction_is_defender (ELTHARION_FACTION_KEY) then
		out ("STORMOFDERP Yvresse was a defender.");
		local num_attackers = cm:pending_battle_cache_num_attackers()
		for i = 1, num_attackers do
			local attacker_cqi, attacker_force_cqi, attacker_name = cm:pending_battle_cache_get_attacker(i);
			local attacker_faction = cm:get_faction (attacker_name);
			if attacker_faction and attacker_faction:is_dead() and attacker_faction:culture() == "wh_main_grn_greenskins" then
				out ("STORMOFDERP wow you killed " .. attacker_name);
				factions_destroyed[attacker_name] = true;
			end
		end
	else
		--out ("STORMOFDERP DEBUG storm_of_derp_greenskin_faction_dead did not involve Yvresse.");
	end
	
	for k,v in pairs (factions_destroyed) do
		cm:faction_add_pooled_resource (ELTHARION_FACTION_KEY, "wardens_supply", "storm_of_derp_greenskin_faction_rekt", 3);
	end
	
	--out ("STORMOFDERP DEBUG storm_of_derp_greenskin_faction_dead complete.");
end


local function storm_of_derp_handle_ladrielle_invocation (context)
	status, details = xpcall (
	  function()

	if settings.next_invasion_turn - cm:turn_number() < 11 then
		settings.next_invasion_turn = cm:turn_number() + cm:random_number (settings.invasion_delay_roll_max, settings.invasion_delay_roll_min);
	end
	out ("STORMOFDERP Ladrielle invoked, next invasion scheduled for turn # " .. tostring (settings.next_invasion_turn));

	local invasion_keys = {};
	for k,v in pairs (invasion_manager.invasions) do
		if k:starts_with ("sodevg") then
			--out ("STORMOFDERP found invasion " .. k);
			table.insert (invasion_keys, k);
		end
	end

	for i = 1, #invasion_keys do			
		local invasion = invasion_manager:get_invasion (invasion_keys[i]);
		--out ("STORMOFDERP DEBUG looking at " .. invasion_keys[i]);
		if invasion then
			--out ("STORMOFDERP DEBUG deleting metadata for " .. invasion_keys[i]);
			evg_delete_invasion_metadata_by_cqi (invasion.force_cqi);
			--out ("STORMOFDERP DEBUG releasing invasion " .. invasion_keys[i]);
			invasion:release();
		else
			out ("STORMOFDERP DEBUG invasion not found??");
		end
	end

	if not settings.ladrielle_info then
		if context:performing_faction():has_home_region() then
			cm:show_message_event_located (
				ELTHARION_FACTION_KEY,
				"wh_event_feed_storm_of_derp_rite_of_ladrielle_primary_detail",
				"wh_event_feed_storm_of_derp_rite_of_ladrielle_secondary_detail",
				"wh_event_feed_storm_of_derp_rite_of_ladrielle_flavour_text",
				context:performing_faction():home_region():settlement():logical_position_x(), 
				context:performing_faction():home_region():settlement():logical_position_y(),
				true,
				31328
			);

			settings.ladrielle_info = true;
		else
			out ("STORMOFDERP DEBUG apparently " .. context:performing_faction():name() .. " doesn't have a home region yet??");
		end
	else
		--out ("STORMOFDERP DEBUG Ladrielle explanation already shown, skipping.");
	end

	  end,
	  function (err)
	    out ("STORMOFDERP storm_of_derp_greenskin_camp_nerf ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end
end


local function evg_greenskin_camps_owned_by_greenskins()
	local camps_owned = 0;

	out ("STORMOFDERP checking which greenskin camps are owned by greenskins.");
	local camps_to_check = greenskin_camps[cm:get_campaign_name()];
	for j = 1, #camps_to_check do
		local region = cm:get_region (camps_to_check[j]);
		if region and not region:is_abandoned() then
			local owner = region:owning_faction();
			if "wh_main_grn_greenskins" == owner:culture() then
				out ("STORMOFDERP " .. region:name() .. " is owned by " .. owner:name() .. ", that counts!");
				camps_owned = camps_owned + 1;
			end
		end
	end

	return camps_owned;
end

--make sure all of Grom's armies are buffed based on which Greenskin camps
--are controlled by *any* greenskin, not just Grom!
local function storm_of_derp_grom_buff (context)
	local camps_owned = evg_greenskin_camps_owned_by_greenskins();

	for i = 0, context:faction():military_force_list():num_items() - 1 do
		local mf = context:faction():military_force_list():item_at (i);
		if not mf:is_armed_citizenry() then
			evg_grant_greenskin_camp_bonus_to_military_force (mf, camps_owned);
		end
	end
end


local function storm_of_derp_grom_faction_check (context)
	local greenskin_faction = context:faction();
	if greenskin_faction:name() == GROM_FACTION_KEY then
		return;
	end

	local character_list = greenskin_faction:character_list();
	for ii = 0, character_list:num_items() - 1 do
		if character_list:item_at (ii):character_subtype ("wh2_dlc15_grn_grom_the_paunch") then
			if greenskin_faction:name() ~= settings.grom_current_faction_key then
				settings.grom_current_faction_key = greenskin_faction:name();
				settings.grom_in_new_faction_cqi = character_list:item_at (ii):command_queue_index();
				out ("STORMOFDERP Grom is with a different faction: " .. settings.grom_current_faction_key);
				break;
			end
		end
	end
end


local function storm_of_derp_greenskin_camp_warning (context)
	status, details = xpcall (
	  function()

	local human_faction_key = context:faction():name();
	local yvresse_faction = cm:get_faction (ELTHARION_FACTION_KEY);
	if not (context:faction():is_faction (yvresse_faction) or context:faction():is_allied_with (yvresse_faction)) then
		--doesn't deserve warning
		return;
	end
	
	if settings["camp_warn_" .. human_faction_key] then
		--already got warning
		return;
	end

	local provinces_needed = {"wh2_main_yvresse"};
	if cm:get_campaign_name() == "wh2_main_great_vortex" then
		provinces_needed = {"wh2_main_vor_northern_yvresse", "wh2_main_vor_southern_yvresse"};
	end

	for i = 1, #provinces_needed do
		--out ("STORMOFDERP DEBUG Yvresse holds " .. provinces_needed[i] .. "? : " .. tostring (yvresse_faction:holds_entire_province (provinces_needed[i], true)));
		if not yvresse_faction:holds_entire_province (provinces_needed[i], true) then
			out ("STORMOFDERP Yvresse doesn't hold " .. provinces_needed[i] .. " yet, no warning needed.");
			return;
		end
	end

	if not cm:char_is_mobile_general_with_army (yvresse_faction:faction_leader()) then
		out ("STORMOFDERP Eltharion isn't alive atm.  Let's not warn anyone.");
		return;
	end

	out ("STORMOFDERP Eltharion holds all of Yvresse, let's show the Greenskin camp warning!");
	cm:trigger_transient_intervention (
		"storm_of_derp_greenskin_camp_warning" .. human_faction_key,
		function (intervention)
			local settlements = greenskin_camps[cm:get_campaign_name()];

			cm:take_shroud_snapshot()

			for i = 1, #settlements do
				cm:make_region_seen_in_shroud (human_faction_key, settlements[i]);

				cm:callback (function()
					cm:scroll_camera_with_cutscene_to_settlement (0.5, nil, settlements[i]);
				end, 2 * i);
			end

			cm:callback (function()
				local eltharion = cm:get_faction ("wh2_main_hef_yvresse"):faction_leader();
				cm:scroll_camera_with_cutscene_to_character (0.5, nil, eltharion:command_queue_index());
				cm:restore_shroud_from_snapshot();
				intervention:complete();

				cm:show_message_event_located (
					human_faction_key,
					"wh_event_feed_storm_of_derp_greenskin_camp_warning_primary_detail",
					"wh_event_feed_storm_of_derp_greenskin_camp_warning_secondary_detail",
					"wh_event_feed_storm_of_derp_greenskin_camp_warning_flavour_text",
					eltharion:logical_position_x(), 
					eltharion:logical_position_y(),
					true,
					31330
				);

			end, 8);
		end,
		BOOL_INTERVENTION_DEBUG,	--??
		function(intervention)
			-- allow transient located scripted event to be shown while intervention is active
			intervention:whitelist_events ("scripted_transient_located_eventevent_feed_target_faction");
		end
	);

	settings["camp_warn_" .. human_faction_key] = true;
	cm:remove_faction_turn_start_listener_by_name ("storm_of_derp_greenskin_camp_warning_fts_" .. human_faction_key);

	  end,
	  function (err)
	    out ("STORMOFDERP ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end
end


function ewthawion_vs_gwom()
	local eltharion_faction = cm:get_faction (ELTHARION_FACTION_KEY);
	local hf = cm:get_human_factions();

	if cm:is_new_game() then
		if cm:model():campaign_name ("main_warhammer") then
			--Give Grom Massif Orcal and make sure it's at least as developed as Tor Yvresse.
			cm:transfer_region_to_faction ("wh_main_massif_orcal_massif_orcal", GROM_FACTION_KEY);

			local yvresse_region = eltharion_faction:home_region();
			local tier = yvresse_region:settlement():primary_slot():building():building_level();

			local massif_orcal = cm:get_region ("wh_main_massif_orcal_massif_orcal");
			if massif_orcal:settlement():primary_slot():building():building_level() < tier then
				cm:instantly_set_settlement_primary_slot_level (massif_orcal:settlement(), tier);
				out ("STORMOFDERP Upgraded Massif Orcal so Grom will be more likely to hold onto it.");
			end
		end

		if debug_mode then
			local region = cm:get_region ("wh2_main_vor_northern_yvresse_sardenath");
			cm:instantly_set_settlement_primary_slot_level (region:settlement(), 3);
			cm:callback (function()
				cm:add_building_to_settlement ("wh2_main_vor_northern_yvresse_sardenath", "wh2_main_hef_defence_minor_2");
			end, 1);
		end

		for z = 1, #hf do
			local human_faction_key = hf[z];
			settings["camp_warn_" .. human_faction_key] = false;
			settings["invasion_seen_by_" .. human_faction_key] = false;
		end
	end

	if eltharion_faction:is_human() then
		if cm:model():campaign_name ("wh2_main_great_vortex") then
			cm:add_faction_turn_start_listener_by_name (
				"storm_of_derp_greenskin_camp_nerf_fts",
				ELTHARION_FACTION_KEY,
				storm_of_derp_greenskin_camp_nerf,
				true
			);

			-- did you think the Greenskin camp warning was a joke??
			core:add_listener(
				"storm_of_derp_final_battle_greenskin_camp_buffs",
				"PendingBattle",
				function()
					local pb = cm:model():pending_battle();
					return pb:set_piece_battle_key():starts_with ("wh2_dlc15_qb_hef_final_battle_eltharion");
				end,
				function()
					local pb = cm:model():pending_battle();

					local attackers = {};

					attackers[pb:attacker():military_force():command_queue_index()] = true;
					for i = 0, pb:secondary_attackers():num_items() - 1 do
						local reinforcement = pb:secondary_attackers():item_at (i);
						attackers[reinforcement:military_force():command_queue_index()] = true;
					end

					local camps_owned = evg_greenskin_camps_owned_by_greenskins();

					for cqi, v in pairs (attackers) do
						local mf = cm:model():military_force_for_command_queue_index (cqi);
						evg_grant_greenskin_camp_bonus_to_military_force (mf, camps_owned);
					end
				end,
				true
			);
		end

		for ii = 1, #hf do
			if not settings["camp_warn_" .. hf[ii]] then
				cm:add_faction_turn_start_listener_by_name (
					"storm_of_derp_greenskin_camp_warning_fts_" .. hf[ii],
					hf[ii],
					storm_of_derp_greenskin_camp_warning,
					true
				);
			end
		end
			

		cm:add_faction_turn_start_listener_by_name (
			"storm_of_derp_grom_buff_fts",
			GROM_FACTION_KEY,
			storm_of_derp_grom_buff,
			true
		);

		cm:add_faction_turn_start_listener_by_culture (
			  "storm_of_derp_grom_faction_check_fts",
			  "wh_main_grn_greenskins",
			  storm_of_derp_grom_faction_check,
			  true
		);

		cm:add_faction_turn_start_listener_by_name (
			"storm_of_derp_yvresse_invasion_check_fts",
			ELTHARION_FACTION_KEY,
			storm_of_derp_yvresse_invasion_check,
			true
		);

		core:add_listener (
			"storm_of_derp_greenskin_faction_dead_BattleCompleted",
			"BattleCompleted",
			true,
			storm_of_derp_greenskin_faction_dead,
			true
		);

		core:add_listener(
			"storm_of_derp_ladrielle_rce",
			"RitualCompletedEvent",
			function(context) 
				--out ("STORMOFDERP DEBUG RitualCompletedEvent context ritual valid: " .. tostring (not context:ritual():is_null_interface()));
				--out ("STORMOFDERP DEBUG RitualCompletedEvent context ritual valid: " .. tostring (context:ritual():ritual_key()));
				--out ("STORMOFDERP DEBUG done with RitualCompletedEvent, returning answer");
				return "wh2_dlc15_ritual_hef_ladrielle" == context:ritual():ritual_key();
			end,
			storm_of_derp_handle_ladrielle_invocation,
			true
		);

		--Executing insignificant prisoners should not grant warden's supplies, F that.
		core:add_listener (
			"storm_of_derp_insignificant_prisoner_nerf",
			"IncidentOccured",
			function (context)
				return context:dilemma() == "wh2_dlc15_incident_hef_prisoner_failed_capture"
			end,
			function (context)
				if context:faction():is_human() and ELTHARION_FACTION_KEY == context:faction():name() then
					cm:faction_add_pooled_resource (ELTHARION_FACTION_KEY, "wardens_supply", "storm_of_derp_greenskin_camp_nerf", -2);
				end
			end,
			true
		);


		--this one's new
		core:add_listener(
			"lair_PendingBattle",
			"ScriptEventPendingBattle",
			true,
			function(context)
				if cm:pending_battle_cache_faction_is_attacker (ELTHARION_FACTION_KEY) then
					pending_battle_family_members = {};
					local num_defenders = cm:pending_battle_cache_num_defenders()
					for i = 1, num_defenders do
						--out ("STORMOFDERP DEBUG lair_PendingBattle looking at defender #" .. tostring (i));
						local defender_cqi, defender_force_cqi, defender_name = cm:pending_battle_cache_get_defender(i);
						local cc = cm:get_character_by_cqi (defender_cqi);
						if cc then
							local fm = {
								cqi = defender_cqi,
								fmcqi = cc:family_member():command_queue_index(),
								faction_key = defender_name
							};
							--out ("STORMOFDERP DEBUG cqi = " .. tostring (defender_cqi) .. ", fmcqi = " .. tostring (cc:family_member():command_queue_index()) .. ", faction_key = " .. defender_name);
							table.insert (pending_battle_family_members, fm);
						end
					end
				else
					--out ("STORMOFDERP lair_PendingBattle Yvresse was not an attacker, so we don't care.");
				end	
			end,
			true
		);

		core:add_listener(
			"lair_PrisonActionTakenEvent",
			"PrisonActionTakenEvent",
			true,
			storm_of_derp_action_taken_nerf,
			true
		);


	end
end


--explicit override
function lair_BattleCompleted(context)
	status, details = xpcall (
	  function()

	local warden = cm:model():world():faction_by_key (ELTHARION_FACTION_KEY);

	if warden:is_human() and cm:pending_battle_cache_faction_is_attacker (ELTHARION_FACTION_KEY) then
		--out ("STORMOFDERP lair_BattleCompleted Yvresse is human and Yvresse was attacking");
		local pending_battle = cm:model():pending_battle();
		if pending_battle:is_auto_resolved() == true then

			--out ("STORMOFDERP lair_BattleCompleted battle was autoresolved");
			local prison_system = cm:model():prison_system();
			local prisoners = prison_system:get_faction_prisoners (warden);

			local lair_max_prisoners = 1;
			if warden:rituals():ritual_status ("wh2_dlc15_athel_tamarha_prison_2"):already_completed_in_chain() then
				lair_max_prisoners = 2;
			end

			--out ("STORMOFDERP DEBUG prisoners:num_items(): " .. tostring (prisoners:num_items()));
			--out ("STORMOFDERP DEBUG lair_max_prisoners: " .. tostring (lair_max_prisoners));
			
			if prisoners:num_items() < lair_max_prisoners then
				out ("STORMOFDERP lair_BattleCompleted there's a prison slot open");
				local fought = pending_battle:has_been_fought();
				local attacker_battle_result = pending_battle:attacker_battle_result();
				local defender_battle_result = pending_battle:defender_battle_result();
				local retreat = attacker_battle_result == defender_battle_result;

				if fought == true and retreat == false then
					out ("STORMOFDERP lair_BattleCompleted the battle was fought and the enemy did not retreat");
					local autoresolve_chance = AUTORESOLVE_CAPTURE_CHANCE;
					if 2 == lair_max_prisoners and 0 == prisoners:num_items() then
						autoresolve_chance = 3 * AUTORESOLVE_CAPTURE_CHANCE;
					end
					if debug_mode then
						autoresolve_chance = 99
					end

					if cm:model():random_percent (autoresolve_chance) or cm:turn_number() == 1 then
						out ("STORMOFDERP lair_BattleCompleted autoresolve roll completed, let's do this");
						local num_defenders = cm:pending_battle_cache_num_defenders()
						if pending_battle:night_battle() == true then 
							num_defenders = 1
						end
						for i = 1, num_defenders do
							out ("STORMOFDERP lair_BattleCompleted looking at defender #" .. tostring (i));
							local defender_cqi, defender_force_cqi, defender_name = cm:pending_battle_cache_get_defender(i);
							--out ("STORMOFDERP DEBUG defender_cqi: " .. tostring (defender_cqi) .. " defender_force_cqi: " .. tostring (defender_force_cqi) .. " defender_name: " .. tostring (defender_name));

							local defender_faction = cm:get_faction (defender_name);
							if defender_faction then
								for j = 0, defender_faction:character_list():num_items() - 1 do
									local cc = defender_faction:character_list():item_at (j);
									if cc and (not cc:is_null_interface()) then
										for k = 1, #pending_battle_family_members do
											--out ("STORMOFDERP DEBUG checking pending_battle_family_members #" .. tostring (k));
											local fm = pending_battle_family_members[k];
											--out ("STORMOFDERP DEBUG cqi = " .. tostring (fm.cqi) .. ", fmcqi = " .. tostring (fm.fmcqi) .. ", faction_key = " .. fm.faction_key);
											--out ("STORMOFDERP DEBUG this character has fmcqi = " .. cc:family_member():command_queue_index());
											if defender_name == fm.faction_key and fm.fmcqi == cc:family_member():command_queue_index() then
												defender_cqi = cc:command_queue_index();
												out ("STORMOFDERP ACTUALLY defender_cqi should be " .. tostring (defender_cqi));
												break;
											end
										end
									end										
								end

								local enemy = cm:model():character_for_command_queue_index (defender_cqi);

								--note we're not checking whether they have a milary force!
								if enemy and not enemy:is_null_interface() then
									out ("STORMOFDERP lair_BattleCompleted all checks cleared, let's imprison this mfer");
									cm:faction_imprison_character (warden, enemy);
								else
									out ("STORMOFDERP looks like the character is too dead to imprison.  Whomp whomp");
								end
							else
								out ("STORMOFDERP DEBUG couldn't find faction " .. defender_name);
							end
						end
					else
						out ("STORMOFDERP lair_BattleCompleted autoresolve roll failed");
					end
				end
			end
		end
		
		-- checking to see if faction has been wiped out, resulting in lost prisoners 
		cm:callback(function()
			lair_CheckDeadPrisoners(warden)
			lair_UpdatePrisonAbility(warden)
			lair_UpdatePrisonerEffects(warden)
		end, 0.5)

		pending_battle_family_members = {};
	end

	  end,
	  function (err)
	    out ("STORMOFDERP ERROR: " .. tostring (err));
	  end
	);
	if not status then
	  return false;
	else
	  return details;
	end

end


--explicit override
--double the default lair_income_stolen
function lair_StealIncomeFromCharactersFaction(character)
	local faction = character:faction();
	local treasury = faction:treasury();
	local stolen = treasury * TREASURY_AMOUNT_STOLEN;
	--out ("STORMOFDERP DEBUG stealing " .. tostring (stolen) .. " from " .. faction:name());
	cm:treasury_mod (ELTHARION_FACTION_KEY, stolen);
	--we *are* stealing money, right??
	cm:treasury_mod (faction:name(), -stolen);
end


cm:add_saving_game_callback(
	function(context)
		cm:save_named_value ("lair_pending_battle_family_members", pending_battle_family_members, context);
		cm:save_named_value ("sodrog_invasions_targetting_regions", invasions_targetting_regions, context);
		cm:save_named_value ("sodrog_settings", settings, context);
	end
);
cm:add_loading_game_callback(
	function(context)
		if not cm:is_new_game() then
			pending_battle_family_members = cm:load_named_value ("lair_pending_battle_family_members", pending_battle_family_members, context);
			invasions_targetting_regions = cm:load_named_value ("sodrog_invasions_targetting_regions", invasions_targetting_regions, context);
			settings = cm:load_named_value ("sodrog_settings", settings, context);
		end
	end
);
