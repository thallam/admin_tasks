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

class Task < ActiveRecord::Base
validates :description, presence: true

end
