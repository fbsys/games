json.array!(@work_processes) do |work_process|
  json.extract! work_process, :id, :id, :process_code, :status_type, :name
  json.url work_process_url(work_process, format: :json)
end
