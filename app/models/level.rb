class Level
  include Mongoid::Document
  include Mongoid::Timestamps
  field :session_id, type: BSON::ObjectId
  field :app_id, type: BSON::ObjectId

  field :data, type: Hash
  field :actions, type: Array
  field :version_id, type: Integer
  field :env, type: String
end
