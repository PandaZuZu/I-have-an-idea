class ChangeUsersIdTypeInAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :user_id, :json
  end
end
