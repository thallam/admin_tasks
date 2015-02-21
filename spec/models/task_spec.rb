# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string
#  time_estimate :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  priority      :integer          default("0")
#  due           :date
#  project_id    :integer
#  admin_user_id :integer
#  completed     :boolean
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  task = Task.new(description: "test task")
  it "is valid with a description" do
    expect(task).to be_valid
  end
  it "is invalid without a description" do
    task = Task.new( time_estimate: 45)
    task.valid?
    expect(task.errors[:description]).to include("can't be blank")
  end


end
