json.array!(@work_tasks) do |work_task|
  json.extract! work_task, :id, :id, :task_code, :status_type, :name
  json.url work_task_url(work_task, format: :json)
end
