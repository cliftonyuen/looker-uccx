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


explore: csq_agent_summary {
  join: csq_interval {
    sql_on:
      ON ${csq_agent_summary.Call_date} = ${csq_interval.Call_date}
      AND ${csq_agent_summary.Date_month} = ${csq_interval.Date_month}
      AND ${csq_agent_summary.Date_year} = ${csq_interval.Date_year}
      AND ${csq_agent_summary.hour} = ${csq_interval.hour}
      AND ${csq_agent_summary.csq_name} = ${csq_interval.csq_name};;
      relationship: many_to_one
  }
}

# - explore: agent_all_fields

# - explore: db_cra_rt_csqssummary
