#     This file is part of the UserStamp library that provides tools to
#     track who created, updated, or destroyed a record in the database.
#
#     https://github.com/mjpete3/user_stamp
#     
#     Copyright (C) 2015 PD Technology Solutions, LLC
#
#     Permission is hereby granted, free of charge, to any person obtaining
#     a copy of this software and associated documentation files (the
#     "Software"), to deal in the Software without restriction, including
#     without limitation the rights to use, copy, modify, merge, publish,
#     distribute, sublicense, and/or sell copies of the Software, and to
#     permit persons to whom the Software is furnished to do so, subject to
#     the following conditions:
#
#     The above copyright notice and this permission notice shall be
#     included in all copies or substantial portions of the Software.
#
#     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#     LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#     OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#     WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#
# include the UserStamp into each model where the user fields need to be updated 
# 

module UserStamp

  extend ActiveSupport::Concern
  
  included do
    before_create  :add_created_and_updated
    before_update  :add_updated
    before_destroy :add_destroy     
  end
  
  private 
  
  
  # when the before_save callback is triggered, set the created_user and updated_user name
  def add_created_and_updated
    if User.current
      self.created_user = User.current.send(UserStamp.configuration.user_field) if self.has_attribute? :created_user
      self.updated_user = User.current.send(UserStamp.configuration.user_field) if self.has_attribute? :updated_user
    end
  end
  
  # when the before_update callback is triggered, set the updated_user name
  def add_updated
    self.updated_user = User.current.send(UserStamp.configuration.user_field) if User.current and self.has_attribute? :updated_user
  end
  
  # when the before_destory callback is called, set the destroy_user name
  def add_destroy
    self.destroy_user = User.current.send(UserStamp.configuration.user_field) if User.current and not destroyed? and self.has_attribute? :destroy_user
  end
  
end
