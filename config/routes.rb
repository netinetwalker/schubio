Schubio::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :projects

  match "blog/tag/:id(/page/:page)" => "blog#show_tag", :as => :blogtag
  match "blog/page/:page" => "blog#index"
  match "blog/feed" => "blog#feed", :as => :blog_feed
  match "blog/comments/feed" => "blogpost_comments#feed", :as => :blog_comments_feed
  resources :blogposts, :controller => "blog", :path => "blog" do
    resources :blogpost_comments, :path => "comments"
  end

  # routes for the pages. takes pretty much everything except paths with / inside
  resources :pages
  match ":id" => "pages#show", :as => :page_clean

  # default- and 404-route
  root :to => "blog#index"
  match '*a', :to => 'application#render_404'
end
