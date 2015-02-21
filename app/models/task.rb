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

class Task < ActiveRecord::Base
validates :description, :project, :admin_user, presence: true
belongs_to :project
belongs_to :admin_user
end
