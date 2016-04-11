class CreateJoinTableProjectPicture < ActiveRecord::Migration
  def change
    create_join_table :projects, :pictures do |t|
      # t.index [:project_id, :picture_id]
      # t.index [:picture_id, :project_id]
    end
  end
end
