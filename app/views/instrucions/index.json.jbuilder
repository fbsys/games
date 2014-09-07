json.array!(@instrucions) do |instrucion|
  json.extract! instrucion, :id
  json.url instrucion_url(instrucion, format: :json)
end
