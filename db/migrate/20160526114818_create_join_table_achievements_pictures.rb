class CreateJoinTableAchievementsPictures < ActiveRecord::Migration
  def change
    create_join_table :achievements, :pictures do |t|
      # t.index [:achievement_id, :picture_id]
      # t.index [:picture_id, :achievement_id]
    end
  end
end
