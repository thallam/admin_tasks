ActiveAdmin.register Task do


#   # See permitted parameters documentation:
#   # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#   #
#   # permit_params :list, :of, :attributes, :on, :model
#   #
#   # or
#   #
#   # permit_params do
#   #   permitted = [:permitted, :attributes]
#   #   permitted << :other if resource.something?
#   #   permitted
#   # end

  actions :all
  permit_params :description,:due, :time_estimate, :priority, :project_id, :admin_user_id

  scope :all, default: true
  scope :due_this_week do |tasks|
    tasks.where('due > ? and due < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('due < ?', Time.now)
  end

end
