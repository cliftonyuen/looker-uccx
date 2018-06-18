view: avg_agent_count_per_day_month {
  derived_table: {
    sql:
    select archive_date, count(distinct agent_name) as total_agent_count
    from csq_agent_summary
    group by archive_date;;
  }
  dimension: archive_date {
    type: number
    primary_key: yes
    sql: ${TABLE}.archive_date ;;
  }

  dimension: agent_count  {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.total_agent_count ;;
  }
}
