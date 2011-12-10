ActiveAdmin.register Project do
  index do
    column :id
    column :title
    column :short_description

    default_actions
  end
end