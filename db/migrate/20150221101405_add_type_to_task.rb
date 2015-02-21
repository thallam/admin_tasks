class AddTypeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :type, :integer, default: 0
  end
end
