class AddAchievementIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :achievement_id, :json
  end
end
