ActiveAdmin.register AdminUser do
  menu :parent => "Users", :label => "Admins"

  index do
    column :id
    column :email
    column :created_at

    default_actions
  end
end
