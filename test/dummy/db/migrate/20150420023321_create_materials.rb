class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.boolean :deleted, default: false
      t.integer :created_user
      t.integer :updated_user
      t.integer :destroy_user

      t.timestamps
    end
  end
end
