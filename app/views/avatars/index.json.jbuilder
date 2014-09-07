json.array!(@avatars) do |avatar|
  json.extract! avatar, :id, :year, :month, :employee_num, :company_name, :employee_name, :avatar_type, :strength, :constitution, :intelligence, :magic, :agility, :charm, :luck, :potential
  json.url avatar_url(avatar, format: :json)
end
