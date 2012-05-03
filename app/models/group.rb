class Group
  include Mongoid::Document

  field :name

  has_many :users
end
