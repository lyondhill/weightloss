class Chat
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user

  field :message, :type => String

  def display
    "#{self.created_at.strftime('%m/%d/%Y %H:%M')}: #{user.username}: #{self.message}"
  end

end
