json.array!(@play_sessions) do |play_session|
  json.extract! play_session, :id, :game_name, :game_id, :version_id
  json.url play_session_url(play_session, format: :json)
end
