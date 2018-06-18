


view: agent_count {
  derived_table: {
    sql: select distinct archive_date, count(distinct agent_name) as total_agent_count
      from csq_agent_summary
      group by archive_date ;;
  }

  dimension_group: Date {
    type: time
    timeframes: [year, quarter, month, date]
    sql: ${TABLE}.archive_date ;;
    datatype: yyyymmdd
  }

  measure: daily_average {
    type: average
    sql: ${TABLE}.total_agent_count ;;
  }

}
