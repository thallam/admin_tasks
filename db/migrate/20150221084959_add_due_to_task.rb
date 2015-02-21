class AddDueToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :due, :date, default: nil
  end
end
