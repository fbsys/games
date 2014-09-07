json.array!(@badge_categories) do |badge_category|
  json.extract! badge_category, :id
  json.url badge_category_url(badge_category, format: :json)
end
