class CreateJoinTableUsersReviews < ActiveRecord::Migration
  def change
    create_join_table :projects, :reviews do |t|
      # t.index [:project_id, :review_id]
      # t.index [:review_id, :project_id]
    end
  end
end
