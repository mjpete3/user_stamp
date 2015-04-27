class Material < ActiveRecord::Base
  include UserStamp
  
  scope :not_deleted, -> {where(deleted: false)}
  
  # override the destory method to set the deleted boolean to true.
  def destroy
    run_callbacks :destroy do
      self.update_column(:deleted, true)
    end
  end  
end
