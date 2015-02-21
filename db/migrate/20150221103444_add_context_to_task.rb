class AddContextToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :context, :integer, default: 0
  end
end
