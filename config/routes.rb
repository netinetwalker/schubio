Schubio::Application.routes.draw do
  # routes for users
  devise_for :users, :controllers => {:registrations => "registrations"}

  # static match for projects-index
  match "projects" => "projects#index", :as => :projects

  match "blog/tag/:id(/page/:page)" => "blog#show_tag", :as => :blogtag
  match "blog/page/:page" => "blog#index"
  resources :blogposts, :controller => "blog", :path => "blog" do
    resources :blogpost_comments
  end

  # routes for the pages. takes pretty much everything except paths with / inside
  resources :pages
  match ":id" => "pages#show", :as => :page_clean

  # default- and 404-route
  root :to => "home#index"
  match '*a', :to => 'application#render_404'
end
