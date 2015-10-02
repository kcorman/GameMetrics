class PlaySession
  include Mongoid::Document
  include Mongoid::Timestamps
  field :app_id, type: BSON::ObjectId
  field :user_id, type:String
  field :version_id, type: Integer
  field :closed_on, type:Time
  field :length, type:Integer
  field :data, type: Hash
  field :env, type: String

  validates_presence_of :app_id, :version_id, :user_id
end
