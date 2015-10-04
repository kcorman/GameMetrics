class App
  include Mongoid::Document
  include Mongoid::Timestamps
  field :_id, type: String, default: ->{ name.squish.tr(" ", "_") if name }
  field :name, type: String
  field :owner, type: String

  validates_presence_of :name, :owner
end
