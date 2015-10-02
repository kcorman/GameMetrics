json.id @level.id.to_s
json.extract! @level, :session_id, :data, :actions, :version_id, :created_at, :updated_at
