class User
  include Mongoid::Document
  field :username
  field :email, :type => String
  field :password, :type => String

  field :starting_weight, type: Float
  field :weight_goal, type: Float

  belongs_to :group
  has_many :weight_logs
  has_many :chats

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def goal_reached?
    recent_log = weight_logs.asc(:created_at).last
    recent_weight = recent_log ? recent_log.weight : self.starting_weight
    recent_weight <= weight_goal
  end

  def percent_lost
    recent_log = weight_logs.asc(:created_at).last
    recent_weight = recent_log ? recent_log.weight : self.starting_weight
    (((self.starting_weight - recent_weight ) / self.starting_weight) * 100 ).round(2)

  end

end
