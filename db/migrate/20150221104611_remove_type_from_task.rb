class RemoveTypeFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :type
  end
end
