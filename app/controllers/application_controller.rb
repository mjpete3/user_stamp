class ApplicationController < ActionController::Base
  # automatically set the current user fields for each call.
  before_filter :set_current_user
  
  private
  
  def set_current_user
    User.current = current_user
  end

end