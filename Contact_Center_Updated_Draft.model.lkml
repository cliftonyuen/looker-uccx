connection: "uccx_agents_details"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: contact_center_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: contact_center_default_datagroup


explore: csq_interval  {
  join: csq_agent_summary {
  sql_on: ${csq_interval.Date_date} = ${csq_agent_summary.Date_date}
  and ${csq_interval.hour} = ${csq_agent_summary.hour}
  and ${csq_interval.csq_name} = ${csq_agent_summary.csq_name};;
  relationship:  one_to_many
  }
  join: agent_count {
    sql_on: ${csq_agent_summary.Date_month} = ${agent_count.Date_month} ;;
    relationship:  one_to_one
  }
}


# - explore: agent_all_fields

# - explore: db_cra_rt_csqssummary
