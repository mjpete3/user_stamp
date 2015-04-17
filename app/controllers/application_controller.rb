class ApplicationController < ActionController::Base
  
  private
  
  def set_current_user
    User.current = current_user
  end

end