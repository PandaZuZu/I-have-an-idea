class AddProjectIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :project_id, :integer
  end
end
