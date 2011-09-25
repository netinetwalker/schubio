ActiveAdmin.register User do
  menu :parent => "Users", :label => "Website"

  index do
    column :id
    column :email
    column :created_at

    default_actions
  end
end
