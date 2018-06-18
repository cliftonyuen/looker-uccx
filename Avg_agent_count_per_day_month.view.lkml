


view: my_pdt {
  derived_table: {
    sql: select distinct archive_date, count(distinct agent_name) as total_agent_count
      from csq_agent_summary
      group by archive_date ;;
  }

  measure: daily_average {
    type: average
    sql: ${TABLE}.total_agent_count ;;
  }

}
