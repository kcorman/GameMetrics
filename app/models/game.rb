class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :session_id, type: BSON::ObjectId
  field :data, type: Hash
end
