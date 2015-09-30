class App
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :owner, type: String
end
