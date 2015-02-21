ActiveAdmin.register Project do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :title

  index do
    column :title do |project|
      link_to project.title, admin_project_path(project)
    end
    actions
  end
  filter :title

  show :title => :title do
    panel "Tasks" do
      table_for project.tasks do |t|
        t.column("Description") { |task| link_to task.description, admin_task_path(task) }
        t.column("Completed") { |task| status_tag (task.completed ? "Done" : "Pending"), (task.completed ? :completed : :in_progress) }
        t.column("Assigned To") { |task| task.admin_user.email }
        t.column("Due") { |task| task.due? ? l(task.due, :format => :long) : '-' }
      end
    end
  end
end
