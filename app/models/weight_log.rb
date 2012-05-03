class WeightLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :weight, type: Float

  belongs_to :user
  
end
