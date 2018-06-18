
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


explore: avg_agent_count_per_day_month  {
  }



# - explore: agent_all_fields

# - explore: db_cra_rt_csqssummary
