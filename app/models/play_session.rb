class PlaySession
  include Mongoid::Document
  include Mongoid::Timestamps
  field :game_name, type: String
  field :game_id, type: String
  field :version_id, type: Integer
  field :closed_on, type:Time
end
