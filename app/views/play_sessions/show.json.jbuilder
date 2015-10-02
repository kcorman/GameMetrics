json.id @play_session.id.to_s
json.extract! @play_session, :app_id, :version_id, :created_at, :updated_at, :data
