RailsAdmin.config do |config|
  config.main_app_name = ['SchubIO', 'admin']
  config.current_user_method { current_user }

  config.model 'Blogpost' do
    label 'Posts'
    navigation_label 'Blog'
    weight 1

    list do
      sort_by :created_at

      field :title
      field :created_at
      field :is_draft
    end

    edit do
      group :general do
        field :is_draft

        field :title do
          length 255
          required true
        end

        field :tags_string do
          length 255
          required true
        end
      end

      group :content do
        field :content do
          html_attributes cols: 100
          required true
        end
      end
    end
  end

  config.model 'BlogpostComment' do
    label 'Comments'
    navigation_label 'Blog'
    weight 2

    list do
      sort_by :created_at

      field :author
      field :blogpost
      field :created_at
    end

    edit do
      group :general do
        field :author do
          length 255
          required true
        end

        field :email do
          length 255
          required true
        end

        field :blogpost
      end

      group :content do
        field :content do
          html_attributes cols: 100
          required true
        end
      end
    end
  end

  config.model 'Page' do
    navigation_label 'Content'
    weight 3

    list do
      sort_by :url

      field :url
      field :title
    end

    edit do
      group :general do
        field :title do
          length 255
          required true
        end

        field :url do
          length 255
          required true
        end
      end

      group :content do
        field :content do
          html_attributes cols: 100
          required true
        end
      end
    end
  end

  config.model 'Project' do
    navigation_label 'Content'
    weight 4

    list do
      sort_by :title

      field :title
      field :category
    end

    edit do
      group :general do
        field :title do
          length 255
          required true
        end

        field :teaser_image do
          length 255
          required true
        end

        field :source_link do
          length 255
          required true
        end

        field :category do
          length 255
          required true
        end
      end

      group :content do
        field :short_description do
          length 255
          required true
        end

        field :description do
          html_attributes cols: 100
          required true
        end
      end
    end
  end

  config.model 'User' do
    navigation_label 'Meta'
    weight 5
  end
end
