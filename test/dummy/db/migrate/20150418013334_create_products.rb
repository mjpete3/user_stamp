class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.boolean :deleted, default: false
      t.string  :created_user
      t.string  :updated_user
      t.string  :destroy_user

      t.timestamps
    end
  end
end
