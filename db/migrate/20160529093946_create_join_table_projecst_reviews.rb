class CreateJoinTableProjecstReviews < ActiveRecord::Migration
  def change
    create_join_table :users, :reviews do |t|
      # t.index [:user_id, :review_id]
      # t.index [:review_id, :user_id]
    end
  end
end
