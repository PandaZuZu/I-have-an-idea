class AddLoginDaysToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login_days, :integer
    add_column :users, :last_day_logged, :date
  end
end
