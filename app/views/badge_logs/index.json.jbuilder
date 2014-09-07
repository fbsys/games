json.array!(@badge_logs) do |badge_log|
  json.extract! badge_log, :id
  json.url badge_log_url(badge_log, format: :json)
end
