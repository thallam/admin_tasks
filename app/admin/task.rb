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
permit_params :description,:completed, :due, :context, :time_estimate, :priority, :project_id, :admin_user_id

index do
  selectable_column
  column :description
  column :priority
  column :context
  column :time_estimate
  column :project_id
  column :completed

  actions
end

form do |f|
  f.semantic_errors
  f.inputs "Task Details" do
    f.input :project_id, label: "Project"
    f.input :description
    f.input :priority
    f.input :context, as: :select, collection: Task.contexts.keys
    f.input :completed
    f.input :time_estimate
    f.input :due, as: :datepicker, datepicker_options: { min_date: 0.days.ago.to_date, max_date: "+1M +5D" }
  end
  actions
end


sidebar :Selected, partial: 'sideform', collection: Task.first

filter :description
filter :priority
filter :context, as: :select, collection: Task.contexts.keys
filter :completed
filter :time_estimate
# filter :due, as: :datepicker, datepicker_options: { min_date: 0.days.ago.to_date, max_date: "+1M +5D" }


scope :all, default: true
scope :due_this_week do |tasks|
  tasks.where('due > ? and due < ?', Time.now, 1.week.from_now)
end
scope :late do |tasks|
  tasks.where('due < ?', Time.now)
end

end
