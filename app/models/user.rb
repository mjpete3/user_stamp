class User < ActiveRecord::Base
  # attr_accessible :title, :body
  
  def self.current=(user)
    Thread.current[:current_user] = user
  end
  
  def self.current
    Thread.current[:current_user]
  end
  
end
