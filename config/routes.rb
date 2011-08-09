Schubio::Application.routes.draw do
  # routes for users
  devise_for :users, :controllers => {:registrations => "registrations"}

  # static match for projects-index
  match "projects" => "projects#index", :as => :projects

  # routes for the blog
  resources :blogposts do
    resources :blogpost_comments
  end
  match "blog" => "blog#index", :as => :blog
  match "blog/:id/:alias" => "blog#show", :as => :blog_detail

  # routes for the pages. takes pretty much everything except paths with / inside
  resources :pages
  match ":id" => "pages#show", :as => :page_clean

  # default- and 404-route
  root :to => "home#index"
  match '*a', :to => 'application#render_404'
end
