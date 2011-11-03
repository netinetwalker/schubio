ActiveAdmin.register Page do
  index do
    column :id
    column :url
    column :title

    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title, :as => :string
      f.input :url, :as => :string
      f.input :content, :as => :text
    end
    f.buttons
  end
end
