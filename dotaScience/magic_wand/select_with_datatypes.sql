SELECT
    cast(match_id as long) as match_id,
    cast(player_slot as int) as player_slot,
    cast(account_id as int) as account_id,
    cast(assists as int) as assists,
    cast(deaths as int) as deaths,
    cast(denies as int) as denies,
    cast(firstblood_claimed as int) as firstblood_claimed,
    cast(gold as int) as gold,
    cast(gold_per_min as int) as gold_per_min,
    cast(gold_spent as int) as gold_spent,
    cast(hero_damage as int) as hero_damage,
    cast(hero_healing as int) as hero_healing,
    cast(hero_id as int) as hero_id,
    cast(last_hits as int) as last_hits,
    cast(level as int) as level,
    cast(pred_vict as int) as pred_vict,
    cast(roshans_killed as int) as roshans_killed,
    cast(tower_damage as int) as tower_damage,
    cast(towers_killed as int) as towers_killed,
    cast(xp_per_min as int) as xp_per_min,
    cast(personaname as string) as personaname,
    cast(name as string) as name,
    case when radiant_win = 'True' then 1 else 0 end as radiant_win,
    cast(start_time as bigint) as start_time,
    from_unixtime( cast(start_time as bigint) ) as dt_start_time,
    cast(duration as bigint) as duration,
    cast(game_mode as int) game_mode,
    cast(patch as int) as patch,
    cast(region as int) as region,
    case when isRadiant = 'True' then 1 else 0 end as isRadiant,
    cast(win as int) as win,
    cast(total_gold as int) as total_gold,
    cast(total_xp as int) as total_xp,
    cast(kills_per_min as int) as kills_per_min,
    cast(kda as int) as kda,
    cast(neutral_kills as int) as neutral_kills,
    cast(tower_kills as int) as tower_kills,
    cast(courier_kills as int) as courier_kills,
    cast(lane_kills as int) as lane_kills,
    cast(hero_kills as int) as hero_kills,
    cast(observer_kills as int) as observer_kills,
    cast(sentry_kills as int) as sentry_kills,
    cast(roshan_kills as int) as roshan_kills,
    cast(necronomicon_kills as int) as necronomicon_kills,
    cast(ancient_kills as int) as ancient_kills,
    cast(buyback_count as int) as buyback_count,
    cast(observer_uses as int) as observer_uses,
    cast(sentry_uses as int) as sentry_uses,
    cast(lane_efficiency as double) as lane_efficiency,
    cast(lane_efficiency_pct as int) as lane_efficiency_pct,
    cast(lane as int) as lane,
    cast(lane_role as int) as lane_role,
    cast(purchase_tpscroll as int) as purchase_tpscroll,
    cast(actions_per_min as int) as actions_per_min,
    cast(rank_tier as int) as rank_tier,

    year(from_unixtime( cast(start_time as bigint) )) as partition_year,
    month(from_unixtime( cast(start_time as bigint) )) as partition_month

from raw_match_player