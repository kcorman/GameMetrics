json.array!(@games) do |game|
  json.extract! game, :id, :session_id, :data
  json.url game_url(game, format: :json)
end
