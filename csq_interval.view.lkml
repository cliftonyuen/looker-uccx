view: csq_interval {
  sql_table_name: dbo.csq_interval ;;

  dimension_group: Date {
    type: time
    timeframes: [year, quarter, month, date]
    sql: ${TABLE}.archive_date ;;
    datatype: yyyymmdd
  }

  dimension: Call_date {
    type: date
    sql: ${TABLE}.archive_date ;;
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

  dimension: calls_handled {
    type: number
    sql: ${TABLE}.calls_handled ;;
  }

  dimension: calls_presented {
    type: number
    sql: ${TABLE}.calls_presented ;;
    drill_fields: [Call_date, hour_format, csq_name]
  }

  dimension: calls_abandoned {
    type: number
    sql: ${TABLE}.calls_abandoned ;;
  }

  dimension: calls_dequeued {
    type: number
    sql: ${TABLE}.calls_dequeued ;;
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
  }

  dimension: csq_name {
    description: "Contact Service Queue"
    label: "CSQ"
    type: string
    sql: ${TABLE}.csq_name ;;
  }

  measure: Total_Calls_Presented {
    type: sum
    sql: ${calls_presented} ;;
  }

  measure: Total_Calls_Abandoned {
    type: sum
    sql: ${calls_abandoned} ;;
  }


  measure: Total_Calls_Dequeued {
    type: sum
    sql: ${calls_dequeued} ;;
  }

  measure: Total_Calls_Handled {
    type: sum
    sql: ${calls_handled} ;;
  }

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${Call_date},'  ',${hour},'  ',${csq_name}) ;;
  }

}
