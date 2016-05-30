class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :pictures_id
      t.integer :user_id
      t.float :rating

      t.timestamps null: false
    end
  end
end
