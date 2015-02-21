class AddProjectsAndAdminUsersToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :project_id, :integer
    add_column :tasks, :admin_user_id, :integer
    add_column :tasks, :completed, :boolean
  end
end
