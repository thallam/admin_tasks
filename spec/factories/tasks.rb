# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string
#  time_estimate :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :task do
    description "MyString"
time_estimate 1
  end

end
