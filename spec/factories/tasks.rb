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

FactoryGirl.define do
  factory :task do
    description "MyString"
    time_estimate 1
  end

end
