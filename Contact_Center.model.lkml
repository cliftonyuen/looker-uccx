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

explore: csq_agent_summary {}

explore: csq_agent_summary_2 {
from:  csq_agent_summary
label: "csq_agent_summary_2"
view_label: "csq_agent_summary_2"
}

# - explore: agent_all_fields

# - explore: db_cra_rt_csqssummary
