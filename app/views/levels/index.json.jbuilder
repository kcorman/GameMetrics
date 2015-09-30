json.array!(@levels) do |level|
  json.extract! level, :id, :session_id, :data, :actions, :version
  json.url level_url(level, format: :json)
end
