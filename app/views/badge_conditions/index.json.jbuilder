json.array!(@badge_conditions) do |badge_condition|
  json.extract! badge_condition, :id
  json.url badge_condition_url(badge_condition, format: :json)
end
