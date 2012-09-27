ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Blogposts" do
          table_for Blogpost.order("created_at desc").limit(5) do
            column :id do |blogpost|
              link_to blogpost.id, [:admin, blogpost]
            end
            column :title
            column :created_at
          end
        end
      end

      column do
        panel "Recent Blogcomments" do
          table_for BlogpostComment.order("created_at desc").limit(5) do
            column :id do |comment|
              link_to comment.id, [:admin, comment]
            end
            column :blogpost
            column :author
          end
        end
      end
    end
  end
end
