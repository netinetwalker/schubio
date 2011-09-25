ActiveAdmin::Dashboards.build do
  section "Recent Blogposts", :priority => 1 do
    table_for Blogpost.order("created_at desc").limit(5) do
      column :id do |blogpost|
        link_to blogpost.id, [:admin, blogpost]
      end
      column :title
      column :created_at
    end
  end

  section "Recent Blogcomments", :priority => 2 do
    table_for BlogpostComment.order("created_at desc").limit(5) do
      column :id do |comment|
        link_to comment.id, [:admin, comment]
      end
      column :blogpost
      column :author
    end
  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end