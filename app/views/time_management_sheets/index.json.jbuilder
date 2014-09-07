json.array!(@time_management_sheets) do |time_management_sheet|
  json.extract! time_management_sheet, :id, :year, :month, :employee_num, :company_name, :department_code, :instruction_id, :team_code, :work_task_id, :work_process_id, :man_hour
  json.url time_management_sheet_url(time_management_sheet, format: :json)
end
