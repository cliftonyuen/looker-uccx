view: test_top10_agent_name {
  derived_table: {
    sql: select top 10 *
      from agent_all_fields
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: archive_date {
    type: string
    sql: ${TABLE}.archive_date ;;
  }

  dimension: agent_group {
    type: string
    sql: ${TABLE}.agent_group ;;
  }

  dimension: agent_name {
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension: agent_login_id {
    type: string
    sql: ${TABLE}.agent_login_id ;;
  }

  dimension: agent_extension {
    type: number
    sql: ${TABLE}.agent_extension ;;
  }

  dimension: avg_logon_time {
    type: number
    sql: ${TABLE}.avg_logon_time ;;
  }

  dimension: calls_handled {
    type: number
    sql: ${TABLE}.calls_handled ;;
  }

  dimension: calls_presented {
    type: number
    sql: ${TABLE}.calls_presented ;;
  }

  dimension: calls_abandoned {
    type: number
    sql: ${TABLE}.calls_abandoned ;;
  }

  dimension: handle_ratio {
    type: string
    sql: ${TABLE}.handle_ratio ;;
  }

  dimension: avg_handle_time {
    type: number
    sql: ${TABLE}.avg_handle_time ;;
  }

  dimension: max_handle_time {
    type: number
    sql: ${TABLE}.max_handle_time ;;
  }

  dimension: avg_talk_time {
    type: number
    sql: ${TABLE}.avg_talk_time ;;
  }

  dimension: max_talk_time {
    type: number
    sql: ${TABLE}.max_talk_time ;;
  }

  dimension: avg_hold_time {
    type: number
    sql: ${TABLE}.avg_hold_time ;;
  }

  dimension: max_hold_time {
    type: number
    sql: ${TABLE}.max_hold_time ;;
  }

  dimension: avg_wrapup_time {
    type: number
    sql: ${TABLE}.avg_wrapup_time ;;
  }

  dimension: max_wrapup_time {
    type: number
    sql: ${TABLE}.max_wrapup_time ;;
  }

  dimension: avg_idle_time {
    type: number
    sql: ${TABLE}.avg_idle_time ;;
  }

  dimension: max_idle_time {
    type: number
    sql: ${TABLE}.max_idle_time ;;
  }

  dimension: total_logged_in_time {
    type: number
    sql: ${TABLE}.total_logged_in_time ;;
  }

  dimension: total_not_ready {
    type: number
    sql: ${TABLE}.total_not_ready ;;
  }

  dimension: percent_not_ready {
    type: string
    sql: ${TABLE}.percent_not_ready ;;
  }

  dimension: total_ready {
    type: number
    sql: ${TABLE}.total_ready ;;
  }

  dimension: percent_ready {
    type: string
    sql: ${TABLE}.percent_ready ;;
  }

  dimension: total_reserved {
    type: number
    sql: ${TABLE}.total_reserved ;;
  }

  dimension: percent_reserved {
    type: string
    sql: ${TABLE}.percent_reserved ;;
  }

  dimension: total_talking {
    type: number
    sql: ${TABLE}.total_talking ;;
  }

  dimension: percent_talking {
    type: string
    sql: ${TABLE}.percent_talking ;;
  }

  dimension: total_work {
    type: number
    sql: ${TABLE}.total_work ;;
  }

  dimension: percent_work {
    type: string
    sql: ${TABLE}.percent_work ;;
  }

  dimension: total_inbound {
    type: number
    sql: ${TABLE}.total_inbound ;;
  }

  dimension: total_inbound_icd {
    type: number
    sql: ${TABLE}.total_inbound_icd ;;
  }

  dimension: avg_icd_talk_time {
    type: number
    sql: ${TABLE}.avg_icd_talk_time ;;
  }

  dimension: avg_icd_hold_time {
    type: number
    sql: ${TABLE}.avg_icd_hold_time ;;
  }

  dimension: avg_icd_work_time {
    type: number
    sql: ${TABLE}.avg_icd_work_time ;;
  }

  dimension: total_inbound_nonicd_ipcc {
    type: number
    sql: ${TABLE}.total_inbound_nonicd_ipcc ;;
  }

  dimension: avg_nonicd_ipcc_talktime {
    type: number
    sql: ${TABLE}.avg_nonicd_ipcc_talktime ;;
  }

  dimension: max_nonicd_ipcc_talktime {
    type: number
    sql: ${TABLE}.max_nonicd_ipcc_talktime ;;
  }

  dimension: total_inbound_nonicd_nonipcc {
    type: number
    sql: ${TABLE}.total_inbound_nonicd_nonipcc ;;
  }

  dimension: avg_nonicd_nonipcc_talktime {
    type: number
    sql: ${TABLE}.avg_nonicd_nonipcc_talktime ;;
  }

  dimension: max_nonicd_nonipcc_talktime {
    type: number
    sql: ${TABLE}.max_nonicd_nonipcc_talktime ;;
  }

  dimension: total_outbound_ipcc {
    type: number
    sql: ${TABLE}.total_outbound_ipcc ;;
  }

  dimension: avg_outbound_ipcc_calltime {
    type: number
    sql: ${TABLE}.avg_outbound_ipcc_calltime ;;
  }

  dimension: max_outbound_ipcc_calltime {
    type: number
    sql: ${TABLE}.max_outbound_ipcc_calltime ;;
  }

  dimension: total_outbound_nonipcc {
    type: number
    sql: ${TABLE}.total_outbound_nonipcc ;;
  }

  dimension: avg_outbound_nonipcc_calltime {
    type: number
    sql: ${TABLE}.avg_outbound_nonipcc_calltime ;;
  }

  dimension: max_outbound_nonipcc_calltime {
    type: number
    sql: ${TABLE}.max_outbound_nonipcc_calltime ;;
  }

  dimension: total_xfer_in_icd {
    type: number
    sql: ${TABLE}.total_xfer_in_icd ;;
  }

  dimension: total_xfer_in_non_icd {
    type: number
    sql: ${TABLE}.total_xfer_in_non_icd ;;
  }

  dimension: total_xfer_out_icd {
    type: number
    sql: ${TABLE}.total_xfer_out_icd ;;
  }

  dimension: total_xfer_out_non_icd {
    type: number
    sql: ${TABLE}.total_xfer_out_non_icd ;;
  }

  dimension: total_conf_icd {
    type: number
    sql: ${TABLE}.total_conf_icd ;;
  }

  dimension: total_conf_non_icd {
    type: number
    sql: ${TABLE}.total_conf_non_icd ;;
  }

  dimension_group: latestsynchedtime {
    type: time
    sql: ${TABLE}.latestsynchedtime ;;
  }

  set: detail {
    fields: [
      archive_date,
      agent_group,
      agent_name,
      agent_login_id,
      agent_extension,
      avg_logon_time,
      calls_handled,
      calls_presented,
      calls_abandoned,
      handle_ratio,
      avg_handle_time,
      max_handle_time,
      avg_talk_time,
      max_talk_time,
      avg_hold_time,
      max_hold_time,
      avg_wrapup_time,
      max_wrapup_time,
      avg_idle_time,
      max_idle_time,
      total_logged_in_time,
      total_not_ready,
      percent_not_ready,
      total_ready,
      percent_ready,
      total_reserved,
      percent_reserved,
      total_talking,
      percent_talking,
      total_work,
      percent_work,
      total_inbound,
      total_inbound_icd,
      avg_icd_talk_time,
      avg_icd_hold_time,
      avg_icd_work_time,
      total_inbound_nonicd_ipcc,
      avg_nonicd_ipcc_talktime,
      max_nonicd_ipcc_talktime,
      total_inbound_nonicd_nonipcc,
      avg_nonicd_nonipcc_talktime,
      max_nonicd_nonipcc_talktime,
      total_outbound_ipcc,
      avg_outbound_ipcc_calltime,
      max_outbound_ipcc_calltime,
      total_outbound_nonipcc,
      avg_outbound_nonipcc_calltime,
      max_outbound_nonipcc_calltime,
      total_xfer_in_icd,
      total_xfer_in_non_icd,
      total_xfer_out_icd,
      total_xfer_out_non_icd,
      total_conf_icd,
      total_conf_non_icd,
      latestsynchedtime_time
    ]
  }
}
