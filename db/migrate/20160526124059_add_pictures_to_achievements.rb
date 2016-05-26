class AddPicturesToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :pictures, :json
  end
end
