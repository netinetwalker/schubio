ActiveAdmin.register BlogpostComment do
  menu :parent => "Blog", :label => "Comments"

  index do
    column :id
    column :created_at
    column :author
    column :content
    column :blogpost

    default_actions
  end
end
