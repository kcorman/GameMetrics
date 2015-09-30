json.array!(@apps) do |app|
  json.extract! app, :id, :name, :owner
  json.url app_url(app, format: :json)
end
