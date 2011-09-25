ActiveAdmin.register Page do
  index do
    column :id
    column :url
    column :title

    default_actions
  end
end
