class PlaySession
  include Mongoid::Document
  include Mongoid::Timestamps
  field :app_id, type: BSON::ObjectId
  field :user_id, type:String
  field :version_id, type: Integer
  field :closed_on, type:Time
  field :length, type:Integer
  field :data, type: Hash
  field :actions, type: Array
  field :env, type: String

  validates_presence_of :app_id, :version_id, :user_id


    # Use mongoid aggregation to group by the given field
    def self.group_by(field, format = 'day')
        key_op = [['year', '$year'], ['month', '$month'], ['day', '$dayOfMonth']]
        key_op = key_op.take(1 + key_op.find_index { |key, op| format == key })
        project_date_fields = Hash[*key_op.collect { |key, op| [key, {op => "$#{field}"}] }.flatten]
        group_id_fields = Hash[*key_op.collect { |key, op| [key, "$#{key}"] }.flatten]
        pipeline = [
            {"$match" => {field => {"$exists" => true}}},
            {"$project" => {"name" => 1, field => 1}.merge(project_date_fields)},
                    {"$group" => {"_id" => group_id_fields, "count" => {"$sum" => 1}}},
                            {"$sort" => {"count" => -1}}
                                ]
        collection.aggregate(pipeline)
    end
end
