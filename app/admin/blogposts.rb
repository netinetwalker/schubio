ActiveAdmin.register Blogpost do
  menu :parent => "Blog", :label => "Articles"

  index do
    column :id
    column :title
    column :created_at

    default_actions
  end
end
