json.array!(@instructions) do |instruction|
  json.extract! instruction, :id, :id, :instruction_code, :status_type, :name
  json.url instruction_url(instruction, format: :json)
end
