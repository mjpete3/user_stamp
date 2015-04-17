#
# include the UserStamp into each model where the user fields need to be updated 
# 

module UserStamp

  extend ActiveSupport::Concern
  
  included do
    before_save    :add_created_and_updated
    before_update  :add_updated
    before_destroy :add_destroy     
  end
  
  private 
  
  
  # when the before_save callback is triggered, set the created_user and updated_user name
  def add_created_and_updated
    if User.current
      self.created_user = User.current_user.login_name if self.has_attribute? :created_user
      self.updated_user = User.current_user.login_name if self.has_attribute? :updated_user
    end
  end
  
  # when the before_update callback is triggered, set the updated_user name
  def add_updated
    self.updated_user = User.current_user.login_name if User.current and self.has_attribute? :updated_user
  end
  
  # when the before_destory callback is called, set the destroy_user name
  def add_destroy
    self.destroy_user = User.current_user.login_name if User.current and not destroyed? and self.has_attribute? :destroy_user
  end
  
end
