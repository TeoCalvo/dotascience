drop table if exists tb_abt_oracle;
create table tb_abt_oracle as

with tb_match as (
    select t1.match_id,
           t1.dt_match, 
            t1.radiant_win,
            t1.win,
            t1.account_id,
            t1.isRadiant

    from tb_match_player as t1

    where dt_match >= '{date_start}' and dt_match <= '{date_end}'
),

tb_join_group as (

    select
            t1.match_id,
            t1.dt_match, 
            t1.radiant_win,

            avg( case when isRadiant = 1 then t2.recencia end ) as recencia_r,
            avg( case when isRadiant = 1 then t2.freq end ) as freq_r,
            avg( case when isRadiant = 1 then t2.win_pct end ) as win_pct_r,
            avg( case when isRadiant = 1 then t2.duration_avg_win end ) as duration_avg_win_r,
            avg( case when isRadiant = 1 then t2.duration_avg_lose end ) as duration_avg_lose_r,
            avg( case when isRadiant = 1 then t2.actions_per_min_avg end ) as actions_per_min_avg_r,
            avg( case when isRadiant = 1 then t2.ancient_kills_avg end ) as ancient_kills_avg_r,
            avg( case when isRadiant = 1 then t2.assists_avg end ) as assists_avg_r,
            avg( case when isRadiant = 1 then t2.buyback_count_avg end ) as buyback_count_avg_r,
            avg( case when isRadiant = 1 then t2.courier_kills_avg end ) as courier_kills_avg_r,
            avg( case when isRadiant = 1 then t2.deaths_avg end ) as deaths_avg_r,
            avg( case when isRadiant = 1 then t2.denies_avg end ) as denies_avg_r,
            avg( case when isRadiant = 1 then t2.firstblood_claimed_avg end ) as firstblood_claimed_avg_r,
            avg( case when isRadiant = 1 then t2.gold_avg end ) as gold_avg_r,
            avg( case when isRadiant = 1 then t2.gold_per_min_avg end ) as gold_per_min_avg_r,
            avg( case when isRadiant = 1 then t2.gold_spent_avg end ) as gold_spent_avg_r,
            avg( case when isRadiant = 1 then t2.hero_damage_avg end ) as hero_damage_avg_r,
            avg( case when isRadiant = 1 then t2.hero_healing_avg end ) as hero_healing_avg_r,
            avg( case when isRadiant = 1 then t2.hero_kills_avg end ) as hero_kills_avg_r,
            avg( case when isRadiant = 1 then t2.isRadiant_avg end ) as isRadiant_avg_r,
            avg( case when isRadiant = 1 then t2.kda_avg end ) as kda_avg_r,
            avg( case when isRadiant = 1 then t2.kills_per_min_avg end ) as kills_per_min_avg_r,
            avg( case when isRadiant = 1 then t2.lane_efficiency_avg end ) as lane_efficiency_avg_r,
            avg( case when isRadiant = 1 then t2.lane_kills_avg end ) as lane_kills_avg_r,
            avg( case when isRadiant = 1 then t2.last_hits_avg end ) as last_hits_avg_r,
            avg( case when isRadiant = 1 then t2.level_avg end ) as level_avg_r,
            avg( case when isRadiant = 1 then t2.necronomicon_kills_avg end ) as necronomicon_kills_avg_r,
            avg( case when isRadiant = 1 then t2.neutral_kills_avg end ) as neutral_kills_avg_r,
            avg( case when isRadiant = 1 then t2.observer_kills_avg end ) as observer_kills_avg_r,
            avg( case when isRadiant = 1 then t2.observer_uses_avg end ) as observer_uses_avg_r,
            avg( case when isRadiant = 1 then t2.purchase_tpscroll_avg end ) as purchase_tpscroll_avg_r,
            avg( case when isRadiant = 1 then t2.roshan_kills_avg end ) as roshan_kills_avg_r,
            avg( case when isRadiant = 1 then t2.sentry_kills_avg end ) as sentry_kills_avg_r,
            avg( case when isRadiant = 1 then t2.sentry_uses_avg end ) as sentry_uses_avg_r,
            avg( case when isRadiant = 1 then t2.total_gold_avg end ) as total_gold_avg_r,
            avg( case when isRadiant = 1 then t2.total_xp_avg end ) as total_xp_avg_r,
            avg( case when isRadiant = 1 then t2.tower_damage_avg end ) as tower_damage_avg_r,
            avg( case when isRadiant = 1 then t2.tower_kills_avg end ) as tower_kills_avg_r,
            avg( case when isRadiant = 1 then t2.xp_per_min_avg end ) as xp_per_min_avg_r,
            avg( case when isRadiant = 1 then t2.hero_1_avg end ) as hero_1_avg_r,
            avg( case when isRadiant = 1 then t2.hero_2_avg end ) as hero_2_avg_r,
            avg( case when isRadiant = 1 then t2.hero_3_avg end ) as hero_3_avg_r,
            avg( case when isRadiant = 1 then t2.hero_4_avg end ) as hero_4_avg_r,
            avg( case when isRadiant = 1 then t2.hero_5_avg end ) as hero_5_avg_r,
            avg( case when isRadiant = 1 then t2.hero_6_avg end ) as hero_6_avg_r,
            avg( case when isRadiant = 1 then t2.hero_7_avg end ) as hero_7_avg_r,
            avg( case when isRadiant = 1 then t2.hero_8_avg end ) as hero_8_avg_r,
            avg( case when isRadiant = 1 then t2.hero_9_avg end ) as hero_9_avg_r,
            avg( case when isRadiant = 1 then t2.hero_10_avg end ) as hero_10_avg_r,
            avg( case when isRadiant = 1 then t2.hero_11_avg end ) as hero_11_avg_r,
            avg( case when isRadiant = 1 then t2.hero_12_avg end ) as hero_12_avg_r,
            avg( case when isRadiant = 1 then t2.hero_13_avg end ) as hero_13_avg_r,
            avg( case when isRadiant = 1 then t2.hero_14_avg end ) as hero_14_avg_r,
            avg( case when isRadiant = 1 then t2.hero_15_avg end ) as hero_15_avg_r,
            avg( case when isRadiant = 1 then t2.hero_16_avg end ) as hero_16_avg_r,
            avg( case when isRadiant = 1 then t2.hero_17_avg end ) as hero_17_avg_r,
            avg( case when isRadiant = 1 then t2.hero_18_avg end ) as hero_18_avg_r,
            avg( case when isRadiant = 1 then t2.hero_19_avg end ) as hero_19_avg_r,
            avg( case when isRadiant = 1 then t2.hero_20_avg end ) as hero_20_avg_r,
            avg( case when isRadiant = 1 then t2.hero_21_avg end ) as hero_21_avg_r,
            avg( case when isRadiant = 1 then t2.hero_22_avg end ) as hero_22_avg_r,
            avg( case when isRadiant = 1 then t2.hero_23_avg end ) as hero_23_avg_r,
            avg( case when isRadiant = 1 then t2.hero_25_avg end ) as hero_25_avg_r,
            avg( case when isRadiant = 1 then t2.hero_26_avg end ) as hero_26_avg_r,
            avg( case when isRadiant = 1 then t2.hero_27_avg end ) as hero_27_avg_r,
            avg( case when isRadiant = 1 then t2.hero_28_avg end ) as hero_28_avg_r,
            avg( case when isRadiant = 1 then t2.hero_29_avg end ) as hero_29_avg_r,
            avg( case when isRadiant = 1 then t2.hero_30_avg end ) as hero_30_avg_r,
            avg( case when isRadiant = 1 then t2.hero_31_avg end ) as hero_31_avg_r,
            avg( case when isRadiant = 1 then t2.hero_32_avg end ) as hero_32_avg_r,
            avg( case when isRadiant = 1 then t2.hero_33_avg end ) as hero_33_avg_r,
            avg( case when isRadiant = 1 then t2.hero_34_avg end ) as hero_34_avg_r,
            avg( case when isRadiant = 1 then t2.hero_35_avg end ) as hero_35_avg_r,
            avg( case when isRadiant = 1 then t2.hero_36_avg end ) as hero_36_avg_r,
            avg( case when isRadiant = 1 then t2.hero_37_avg end ) as hero_37_avg_r,
            avg( case when isRadiant = 1 then t2.hero_38_avg end ) as hero_38_avg_r,
            avg( case when isRadiant = 1 then t2.hero_39_avg end ) as hero_39_avg_r,
            avg( case when isRadiant = 1 then t2.hero_40_avg end ) as hero_40_avg_r,
            avg( case when isRadiant = 1 then t2.hero_41_avg end ) as hero_41_avg_r,
            avg( case when isRadiant = 1 then t2.hero_42_avg end ) as hero_42_avg_r,
            avg( case when isRadiant = 1 then t2.hero_43_avg end ) as hero_43_avg_r,
            avg( case when isRadiant = 1 then t2.hero_44_avg end ) as hero_44_avg_r,
            avg( case when isRadiant = 1 then t2.hero_45_avg end ) as hero_45_avg_r,
            avg( case when isRadiant = 1 then t2.hero_46_avg end ) as hero_46_avg_r,
            avg( case when isRadiant = 1 then t2.hero_47_avg end ) as hero_47_avg_r,
            avg( case when isRadiant = 1 then t2.hero_48_avg end ) as hero_48_avg_r,
            avg( case when isRadiant = 1 then t2.hero_49_avg end ) as hero_49_avg_r,
            avg( case when isRadiant = 1 then t2.hero_50_avg end ) as hero_50_avg_r,
            avg( case when isRadiant = 1 then t2.hero_51_avg end ) as hero_51_avg_r,
            avg( case when isRadiant = 1 then t2.hero_52_avg end ) as hero_52_avg_r,
            avg( case when isRadiant = 1 then t2.hero_53_avg end ) as hero_53_avg_r,
            avg( case when isRadiant = 1 then t2.hero_54_avg end ) as hero_54_avg_r,
            avg( case when isRadiant = 1 then t2.hero_55_avg end ) as hero_55_avg_r,
            avg( case when isRadiant = 1 then t2.hero_56_avg end ) as hero_56_avg_r,
            avg( case when isRadiant = 1 then t2.hero_57_avg end ) as hero_57_avg_r,
            avg( case when isRadiant = 1 then t2.hero_58_avg end ) as hero_58_avg_r,
            avg( case when isRadiant = 1 then t2.hero_59_avg end ) as hero_59_avg_r,
            avg( case when isRadiant = 1 then t2.hero_60_avg end ) as hero_60_avg_r,
            avg( case when isRadiant = 1 then t2.hero_61_avg end ) as hero_61_avg_r,
            avg( case when isRadiant = 1 then t2.hero_62_avg end ) as hero_62_avg_r,
            avg( case when isRadiant = 1 then t2.hero_63_avg end ) as hero_63_avg_r,
            avg( case when isRadiant = 1 then t2.hero_64_avg end ) as hero_64_avg_r,
            avg( case when isRadiant = 1 then t2.hero_65_avg end ) as hero_65_avg_r,
            avg( case when isRadiant = 1 then t2.hero_66_avg end ) as hero_66_avg_r,
            avg( case when isRadiant = 1 then t2.hero_67_avg end ) as hero_67_avg_r,
            avg( case when isRadiant = 1 then t2.hero_68_avg end ) as hero_68_avg_r,
            avg( case when isRadiant = 1 then t2.hero_69_avg end ) as hero_69_avg_r,
            avg( case when isRadiant = 1 then t2.hero_70_avg end ) as hero_70_avg_r,
            avg( case when isRadiant = 1 then t2.hero_71_avg end ) as hero_71_avg_r,
            avg( case when isRadiant = 1 then t2.hero_72_avg end ) as hero_72_avg_r,
            avg( case when isRadiant = 1 then t2.hero_73_avg end ) as hero_73_avg_r,
            avg( case when isRadiant = 1 then t2.hero_74_avg end ) as hero_74_avg_r,
            avg( case when isRadiant = 1 then t2.hero_75_avg end ) as hero_75_avg_r,
            avg( case when isRadiant = 1 then t2.hero_76_avg end ) as hero_76_avg_r,
            avg( case when isRadiant = 1 then t2.hero_77_avg end ) as hero_77_avg_r,
            avg( case when isRadiant = 1 then t2.hero_78_avg end ) as hero_78_avg_r,
            avg( case when isRadiant = 1 then t2.hero_79_avg end ) as hero_79_avg_r,
            avg( case when isRadiant = 1 then t2.hero_80_avg end ) as hero_80_avg_r,
            avg( case when isRadiant = 1 then t2.hero_81_avg end ) as hero_81_avg_r,
            avg( case when isRadiant = 1 then t2.hero_82_avg end ) as hero_82_avg_r,
            avg( case when isRadiant = 1 then t2.hero_83_avg end ) as hero_83_avg_r,
            avg( case when isRadiant = 1 then t2.hero_84_avg end ) as hero_84_avg_r,
            avg( case when isRadiant = 1 then t2.hero_85_avg end ) as hero_85_avg_r,
            avg( case when isRadiant = 1 then t2.hero_86_avg end ) as hero_86_avg_r,
            avg( case when isRadiant = 1 then t2.hero_87_avg end ) as hero_87_avg_r,
            avg( case when isRadiant = 1 then t2.hero_88_avg end ) as hero_88_avg_r,
            avg( case when isRadiant = 1 then t2.hero_89_avg end ) as hero_89_avg_r,
            avg( case when isRadiant = 1 then t2.hero_90_avg end ) as hero_90_avg_r,
            avg( case when isRadiant = 1 then t2.hero_91_avg end ) as hero_91_avg_r,
            avg( case when isRadiant = 1 then t2.hero_92_avg end ) as hero_92_avg_r,
            avg( case when isRadiant = 1 then t2.hero_93_avg end ) as hero_93_avg_r,
            avg( case when isRadiant = 1 then t2.hero_94_avg end ) as hero_94_avg_r,
            avg( case when isRadiant = 1 then t2.hero_95_avg end ) as hero_95_avg_r,
            avg( case when isRadiant = 1 then t2.hero_96_avg end ) as hero_96_avg_r,
            avg( case when isRadiant = 1 then t2.hero_97_avg end ) as hero_97_avg_r,
            avg( case when isRadiant = 1 then t2.hero_98_avg end ) as hero_98_avg_r,
            avg( case when isRadiant = 1 then t2.hero_99_avg end ) as hero_99_avg_r,
            avg( case when isRadiant = 1 then t2.hero_100_avg end ) as hero_100_avg_r,
            avg( case when isRadiant = 1 then t2.hero_101_avg end ) as hero_101_avg_r,
            avg( case when isRadiant = 1 then t2.hero_102_avg end ) as hero_102_avg_r,
            avg( case when isRadiant = 1 then t2.hero_103_avg end ) as hero_103_avg_r,
            avg( case when isRadiant = 1 then t2.hero_104_avg end ) as hero_104_avg_r,
            avg( case when isRadiant = 1 then t2.hero_105_avg end ) as hero_105_avg_r,
            avg( case when isRadiant = 1 then t2.hero_106_avg end ) as hero_106_avg_r,
            avg( case when isRadiant = 1 then t2.hero_107_avg end ) as hero_107_avg_r,
            avg( case when isRadiant = 1 then t2.hero_108_avg end ) as hero_108_avg_r,
            avg( case when isRadiant = 1 then t2.hero_109_avg end ) as hero_109_avg_r,
            avg( case when isRadiant = 1 then t2.hero_110_avg end ) as hero_110_avg_r,
            avg( case when isRadiant = 1 then t2.hero_111_avg end ) as hero_111_avg_r,
            avg( case when isRadiant = 1 then t2.hero_112_avg end ) as hero_112_avg_r,
            avg( case when isRadiant = 1 then t2.hero_113_avg end ) as hero_113_avg_r,
            avg( case when isRadiant = 1 then t2.hero_114_avg end ) as hero_114_avg_r,
            avg( case when isRadiant = 1 then t2.hero_119_avg end ) as hero_119_avg_r,
            avg( case when isRadiant = 1 then t2.hero_120_avg end ) as hero_120_avg_r,
            avg( case when isRadiant = 1 then t2.hero_126_avg end ) as hero_126_avg_r,
            avg( case when isRadiant = 1 then t2.hero_128_avg end ) as hero_128_avg_r,
            avg( case when isRadiant = 1 then t2.hero_129_avg end ) as hero_129_avg_r,

            avg( case when isRadiant = 0 then t2.recencia end ) as recencia_d,
            avg( case when isRadiant = 0 then t2.freq end ) as freq_d,
            avg( case when isRadiant = 0 then t2.win_pct end ) as win_pct_d,
            avg( case when isRadiant = 0 then t2.duration_avg_win end ) as duration_avg_win_d,
            avg( case when isRadiant = 0 then t2.duration_avg_lose end ) as duration_avg_lose_d,
            avg( case when isRadiant = 0 then t2.actions_per_min_avg end ) as actions_per_min_avg_d,
            avg( case when isRadiant = 0 then t2.ancient_kills_avg end ) as ancient_kills_avg_d,
            avg( case when isRadiant = 0 then t2.assists_avg end ) as assists_avg_d,
            avg( case when isRadiant = 0 then t2.buyback_count_avg end ) as buyback_count_avg_d,
            avg( case when isRadiant = 0 then t2.courier_kills_avg end ) as courier_kills_avg_d,
            avg( case when isRadiant = 0 then t2.deaths_avg end ) as deaths_avg_d,
            avg( case when isRadiant = 0 then t2.denies_avg end ) as denies_avg_d,
            avg( case when isRadiant = 0 then t2.firstblood_claimed_avg end ) as firstblood_claimed_avg_d,
            avg( case when isRadiant = 0 then t2.gold_avg end ) as gold_avg_d,
            avg( case when isRadiant = 0 then t2.gold_per_min_avg end ) as gold_per_min_avg_d,
            avg( case when isRadiant = 0 then t2.gold_spent_avg end ) as gold_spent_avg_d,
            avg( case when isRadiant = 0 then t2.hero_damage_avg end ) as hero_damage_avg_d,
            avg( case when isRadiant = 0 then t2.hero_healing_avg end ) as hero_healing_avg_d,
            avg( case when isRadiant = 0 then t2.hero_kills_avg end ) as hero_kills_avg_d,
            avg( case when isRadiant = 0 then t2.isRadiant_avg end ) as isRadiant_avg_d,
            avg( case when isRadiant = 0 then t2.kda_avg end ) as kda_avg_d,
            avg( case when isRadiant = 0 then t2.kills_per_min_avg end ) as kills_per_min_avg_d,
            avg( case when isRadiant = 0 then t2.lane_efficiency_avg end ) as lane_efficiency_avg_d,
            avg( case when isRadiant = 0 then t2.lane_kills_avg end ) as lane_kills_avg_d,
            avg( case when isRadiant = 0 then t2.last_hits_avg end ) as last_hits_avg_d,
            avg( case when isRadiant = 0 then t2.level_avg end ) as level_avg_d,
            avg( case when isRadiant = 0 then t2.necronomicon_kills_avg end ) as necronomicon_kills_avg_d,
            avg( case when isRadiant = 0 then t2.neutral_kills_avg end ) as neutral_kills_avg_d,
            avg( case when isRadiant = 0 then t2.observer_kills_avg end ) as observer_kills_avg_d,
            avg( case when isRadiant = 0 then t2.observer_uses_avg end ) as observer_uses_avg_d,
            avg( case when isRadiant = 0 then t2.purchase_tpscroll_avg end ) as purchase_tpscroll_avg_d,
            avg( case when isRadiant = 0 then t2.roshan_kills_avg end ) as roshan_kills_avg_d,
            avg( case when isRadiant = 0 then t2.sentry_kills_avg end ) as sentry_kills_avg_d,
            avg( case when isRadiant = 0 then t2.sentry_uses_avg end ) as sentry_uses_avg_d,
            avg( case when isRadiant = 0 then t2.total_gold_avg end ) as total_gold_avg_d,
            avg( case when isRadiant = 0 then t2.total_xp_avg end ) as total_xp_avg_d,
            avg( case when isRadiant = 0 then t2.tower_damage_avg end ) as tower_damage_avg_d,
            avg( case when isRadiant = 0 then t2.tower_kills_avg end ) as tower_kills_avg_d,
            avg( case when isRadiant = 0 then t2.xp_per_min_avg end ) as xp_per_min_avg_d,
            avg( case when isRadiant = 0 then t2.hero_1_avg end ) as hero_1_avg_d,
            avg( case when isRadiant = 0 then t2.hero_2_avg end ) as hero_2_avg_d,
            avg( case when isRadiant = 0 then t2.hero_3_avg end ) as hero_3_avg_d,
            avg( case when isRadiant = 0 then t2.hero_4_avg end ) as hero_4_avg_d,
            avg( case when isRadiant = 0 then t2.hero_5_avg end ) as hero_5_avg_d,
            avg( case when isRadiant = 0 then t2.hero_6_avg end ) as hero_6_avg_d,
            avg( case when isRadiant = 0 then t2.hero_7_avg end ) as hero_7_avg_d,
            avg( case when isRadiant = 0 then t2.hero_8_avg end ) as hero_8_avg_d,
            avg( case when isRadiant = 0 then t2.hero_9_avg end ) as hero_9_avg_d,
            avg( case when isRadiant = 0 then t2.hero_10_avg end ) as hero_10_avg_d,
            avg( case when isRadiant = 0 then t2.hero_11_avg end ) as hero_11_avg_d,
            avg( case when isRadiant = 0 then t2.hero_12_avg end ) as hero_12_avg_d,
            avg( case when isRadiant = 0 then t2.hero_13_avg end ) as hero_13_avg_d,
            avg( case when isRadiant = 0 then t2.hero_14_avg end ) as hero_14_avg_d,
            avg( case when isRadiant = 0 then t2.hero_15_avg end ) as hero_15_avg_d,
            avg( case when isRadiant = 0 then t2.hero_16_avg end ) as hero_16_avg_d,
            avg( case when isRadiant = 0 then t2.hero_17_avg end ) as hero_17_avg_d,
            avg( case when isRadiant = 0 then t2.hero_18_avg end ) as hero_18_avg_d,
            avg( case when isRadiant = 0 then t2.hero_19_avg end ) as hero_19_avg_d,
            avg( case when isRadiant = 0 then t2.hero_20_avg end ) as hero_20_avg_d,
            avg( case when isRadiant = 0 then t2.hero_21_avg end ) as hero_21_avg_d,
            avg( case when isRadiant = 0 then t2.hero_22_avg end ) as hero_22_avg_d,
            avg( case when isRadiant = 0 then t2.hero_23_avg end ) as hero_23_avg_d,
            avg( case when isRadiant = 0 then t2.hero_25_avg end ) as hero_25_avg_d,
            avg( case when isRadiant = 0 then t2.hero_26_avg end ) as hero_26_avg_d,
            avg( case when isRadiant = 0 then t2.hero_27_avg end ) as hero_27_avg_d,
            avg( case when isRadiant = 0 then t2.hero_28_avg end ) as hero_28_avg_d,
            avg( case when isRadiant = 0 then t2.hero_29_avg end ) as hero_29_avg_d,
            avg( case when isRadiant = 0 then t2.hero_30_avg end ) as hero_30_avg_d,
            avg( case when isRadiant = 0 then t2.hero_31_avg end ) as hero_31_avg_d,
            avg( case when isRadiant = 0 then t2.hero_32_avg end ) as hero_32_avg_d,
            avg( case when isRadiant = 0 then t2.hero_33_avg end ) as hero_33_avg_d,
            avg( case when isRadiant = 0 then t2.hero_34_avg end ) as hero_34_avg_d,
            avg( case when isRadiant = 0 then t2.hero_35_avg end ) as hero_35_avg_d,
            avg( case when isRadiant = 0 then t2.hero_36_avg end ) as hero_36_avg_d,
            avg( case when isRadiant = 0 then t2.hero_37_avg end ) as hero_37_avg_d,
            avg( case when isRadiant = 0 then t2.hero_38_avg end ) as hero_38_avg_d,
            avg( case when isRadiant = 0 then t2.hero_39_avg end ) as hero_39_avg_d,
            avg( case when isRadiant = 0 then t2.hero_40_avg end ) as hero_40_avg_d,
            avg( case when isRadiant = 0 then t2.hero_41_avg end ) as hero_41_avg_d,
            avg( case when isRadiant = 0 then t2.hero_42_avg end ) as hero_42_avg_d,
            avg( case when isRadiant = 0 then t2.hero_43_avg end ) as hero_43_avg_d,
            avg( case when isRadiant = 0 then t2.hero_44_avg end ) as hero_44_avg_d,
            avg( case when isRadiant = 0 then t2.hero_45_avg end ) as hero_45_avg_d,
            avg( case when isRadiant = 0 then t2.hero_46_avg end ) as hero_46_avg_d,
            avg( case when isRadiant = 0 then t2.hero_47_avg end ) as hero_47_avg_d,
            avg( case when isRadiant = 0 then t2.hero_48_avg end ) as hero_48_avg_d,
            avg( case when isRadiant = 0 then t2.hero_49_avg end ) as hero_49_avg_d,
            avg( case when isRadiant = 0 then t2.hero_50_avg end ) as hero_50_avg_d,
            avg( case when isRadiant = 0 then t2.hero_51_avg end ) as hero_51_avg_d,
            avg( case when isRadiant = 0 then t2.hero_52_avg end ) as hero_52_avg_d,
            avg( case when isRadiant = 0 then t2.hero_53_avg end ) as hero_53_avg_d,
            avg( case when isRadiant = 0 then t2.hero_54_avg end ) as hero_54_avg_d,
            avg( case when isRadiant = 0 then t2.hero_55_avg end ) as hero_55_avg_d,
            avg( case when isRadiant = 0 then t2.hero_56_avg end ) as hero_56_avg_d,
            avg( case when isRadiant = 0 then t2.hero_57_avg end ) as hero_57_avg_d,
            avg( case when isRadiant = 0 then t2.hero_58_avg end ) as hero_58_avg_d,
            avg( case when isRadiant = 0 then t2.hero_59_avg end ) as hero_59_avg_d,
            avg( case when isRadiant = 0 then t2.hero_60_avg end ) as hero_60_avg_d,
            avg( case when isRadiant = 0 then t2.hero_61_avg end ) as hero_61_avg_d,
            avg( case when isRadiant = 0 then t2.hero_62_avg end ) as hero_62_avg_d,
            avg( case when isRadiant = 0 then t2.hero_63_avg end ) as hero_63_avg_d,
            avg( case when isRadiant = 0 then t2.hero_64_avg end ) as hero_64_avg_d,
            avg( case when isRadiant = 0 then t2.hero_65_avg end ) as hero_65_avg_d,
            avg( case when isRadiant = 0 then t2.hero_66_avg end ) as hero_66_avg_d,
            avg( case when isRadiant = 0 then t2.hero_67_avg end ) as hero_67_avg_d,
            avg( case when isRadiant = 0 then t2.hero_68_avg end ) as hero_68_avg_d,
            avg( case when isRadiant = 0 then t2.hero_69_avg end ) as hero_69_avg_d,
            avg( case when isRadiant = 0 then t2.hero_70_avg end ) as hero_70_avg_d,
            avg( case when isRadiant = 0 then t2.hero_71_avg end ) as hero_71_avg_d,
            avg( case when isRadiant = 0 then t2.hero_72_avg end ) as hero_72_avg_d,
            avg( case when isRadiant = 0 then t2.hero_73_avg end ) as hero_73_avg_d,
            avg( case when isRadiant = 0 then t2.hero_74_avg end ) as hero_74_avg_d,
            avg( case when isRadiant = 0 then t2.hero_75_avg end ) as hero_75_avg_d,
            avg( case when isRadiant = 0 then t2.hero_76_avg end ) as hero_76_avg_d,
            avg( case when isRadiant = 0 then t2.hero_77_avg end ) as hero_77_avg_d,
            avg( case when isRadiant = 0 then t2.hero_78_avg end ) as hero_78_avg_d,
            avg( case when isRadiant = 0 then t2.hero_79_avg end ) as hero_79_avg_d,
            avg( case when isRadiant = 0 then t2.hero_80_avg end ) as hero_80_avg_d,
            avg( case when isRadiant = 0 then t2.hero_81_avg end ) as hero_81_avg_d,
            avg( case when isRadiant = 0 then t2.hero_82_avg end ) as hero_82_avg_d,
            avg( case when isRadiant = 0 then t2.hero_83_avg end ) as hero_83_avg_d,
            avg( case when isRadiant = 0 then t2.hero_84_avg end ) as hero_84_avg_d,
            avg( case when isRadiant = 0 then t2.hero_85_avg end ) as hero_85_avg_d,
            avg( case when isRadiant = 0 then t2.hero_86_avg end ) as hero_86_avg_d,
            avg( case when isRadiant = 0 then t2.hero_87_avg end ) as hero_87_avg_d,
            avg( case when isRadiant = 0 then t2.hero_88_avg end ) as hero_88_avg_d,
            avg( case when isRadiant = 0 then t2.hero_89_avg end ) as hero_89_avg_d,
            avg( case when isRadiant = 0 then t2.hero_90_avg end ) as hero_90_avg_d,
            avg( case when isRadiant = 0 then t2.hero_91_avg end ) as hero_91_avg_d,
            avg( case when isRadiant = 0 then t2.hero_92_avg end ) as hero_92_avg_d,
            avg( case when isRadiant = 0 then t2.hero_93_avg end ) as hero_93_avg_d,
            avg( case when isRadiant = 0 then t2.hero_94_avg end ) as hero_94_avg_d,
            avg( case when isRadiant = 0 then t2.hero_95_avg end ) as hero_95_avg_d,
            avg( case when isRadiant = 0 then t2.hero_96_avg end ) as hero_96_avg_d,
            avg( case when isRadiant = 0 then t2.hero_97_avg end ) as hero_97_avg_d,
            avg( case when isRadiant = 0 then t2.hero_98_avg end ) as hero_98_avg_d,
            avg( case when isRadiant = 0 then t2.hero_99_avg end ) as hero_99_avg_d,
            avg( case when isRadiant = 0 then t2.hero_100_avg end ) as hero_100_avg_d,
            avg( case when isRadiant = 0 then t2.hero_101_avg end ) as hero_101_avg_d,
            avg( case when isRadiant = 0 then t2.hero_102_avg end ) as hero_102_avg_d,
            avg( case when isRadiant = 0 then t2.hero_103_avg end ) as hero_103_avg_d,
            avg( case when isRadiant = 0 then t2.hero_104_avg end ) as hero_104_avg_d,
            avg( case when isRadiant = 0 then t2.hero_105_avg end ) as hero_105_avg_d,
            avg( case when isRadiant = 0 then t2.hero_106_avg end ) as hero_106_avg_d,
            avg( case when isRadiant = 0 then t2.hero_107_avg end ) as hero_107_avg_d,
            avg( case when isRadiant = 0 then t2.hero_108_avg end ) as hero_108_avg_d,
            avg( case when isRadiant = 0 then t2.hero_109_avg end ) as hero_109_avg_d,
            avg( case when isRadiant = 0 then t2.hero_110_avg end ) as hero_110_avg_d,
            avg( case when isRadiant = 0 then t2.hero_111_avg end ) as hero_111_avg_d,
            avg( case when isRadiant = 0 then t2.hero_112_avg end ) as hero_112_avg_d,
            avg( case when isRadiant = 0 then t2.hero_113_avg end ) as hero_113_avg_d,
            avg( case when isRadiant = 0 then t2.hero_114_avg end ) as hero_114_avg_d,
            avg( case when isRadiant = 0 then t2.hero_119_avg end ) as hero_119_avg_d,
            avg( case when isRadiant = 0 then t2.hero_120_avg end ) as hero_120_avg_d,
            avg( case when isRadiant = 0 then t2.hero_126_avg end ) as hero_126_avg_d,
            avg( case when isRadiant = 0 then t2.hero_128_avg end ) as hero_128_avg_d,
            avg( case when isRadiant = 0 then t2.hero_129_avg end ) as hero_129_avg_d

    from tb_match as t1

    left join tb_vuc_safras as t2
    on t1.account_id = t2.account_id
    and date(t1.dt_match) = t2.dt_ref

    group by t1.match_id,
             t1.dt_match, 
             t1.radiant_win

)

select * from tb_join_group;