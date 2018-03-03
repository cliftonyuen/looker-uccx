view: csq_agent_summary {
  sql_table_name: dbo.csq_agent_summary ;;

  dimension: agent_name {
    type: string
    sql: ${TABLE}.agent_name ;;
  }

  dimension_group: Date {
    type: time
    timeframes: [year, quarter, month, date]
    sql: ${TABLE}.archive_date ;;
    datatype: yyyymmdd
    drill_fields: [ csq_name, agent_name]
  }

  dimension: avg_hold_time {
    type: number
    sql: ${TABLE}.avg_hold_time ;;
  }

  dimension: avg_talk_time {
    type: number
    sql: ${TABLE}.avg_talk_time ;;
  }

  dimension: avg_work_time {
    type: number
    sql: ${TABLE}.avg_work_time ;;
  }

  dimension: calls_handled {
    type: number
    sql: ${TABLE}.calls_handled ;;
  }

  dimension: calls_on_hold {
    type: number
    sql: ${TABLE}.calls_on_hold ;;
  }

  dimension: team {
    case: {
      when: {
        sql: LEFT(${csq_name}, 2) = 'CC' ;;
        label: "Call Center"
      }
      when: {
        sql: LEFT(${csq_name}, 2) = 'MS';;
        label: "Member Services"
      }
      when: {
        sql: LEFT(${csq_name}, 2) = 'BL';;
        label: "Billing General"
      }
    }
    drill_fields: [my_drill_set*]
  }

  dimension: csq_name {
    description: "Contact Service Queue"
    label: "CSQ"
    type: string
    sql: ${TABLE}.csq_name ;;
    drill_fields: [my_drill_set*]
  }

  dimension: extension {
    type: number
    sql: ${TABLE}.extension ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  dimension: hour_format {
    type: date_time
    sql: ${TABLE}.hour ;;
  }

  dimension: idfield {
    type: number
    sql: ${TABLE}.idfield ;;
  }

  dimension_group: latestsynchtime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.latestsynchtime ;;
  }

  dimension: rna {
    type: number
    sql: ${TABLE}.rna ;;
  }

  dimension: Call_date {
    type: date
    sql: ${TABLE}.archive_date ;;
  }

  dimension: total_hold_time {
    type: number
    sql: ${TABLE}.total_hold_time ;;
  }

  dimension: total_ring_time {
    type: number
    sql: ${TABLE}.total_ring_time ;;
  }

  dimension: total_talk_time {
    type: number
    sql: ${TABLE}.total_talk_time ;;
  }

  dimension: total_work_time {
    type: number
    sql: ${TABLE}.total_work_time ;;
  }

  measure: count {
    type: count
    drill_fields: [my_drill_set*]
  }

  measure: ACD_Calls_Handled {
    type: sum
    sql: ${calls_handled} ;;
  }


  measure: ACD_Calls_Abandoned {
    type: sum
    sql: ${rna} ;;
  }


  measure: Total_ACD_Calls {
    type: number
    sql:  ${ACD_Calls_Handled} + ${ACD_Calls_Abandoned} ;;
  }

  measure: ACD_Total_Talk_Time {
    type: sum
    sql: ${total_work_time} ;;
  }

  measure: ACD_Total_Ring_Time {
    type: sum
    sql: ${total_ring_time} ;;
  }

  measure: ACD_Total_Call_On_Hold {
    type: sum
    sql: ${calls_on_hold} ;;
  }

  measure: ACD_Total_Hold_Time {
    type: sum
    sql: ${total_hold_time} ;;
  }

  set: my_drill_set {
    fields: [
      Date_year,
      Date_month,
      csq_name,
      agent_name
    ]

  }

}
