ActiveAdmin.register Blogpost do
  menu :parent => "Blog", :label => "Articles"

  filter :title
  filter :content
  filter :created_at
  filter :is_draft, :as => :check_boxes

  index do
    column :id
    column :title
    column :created_at
    column :is_draft

    default_actions
  end
end
