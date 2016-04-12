class AddPicturesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pictures, :json
  end
end
