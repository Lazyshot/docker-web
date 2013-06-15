DockerWeb::Application.routes.draw do
  root :to => "pages#index"

  match "hosts" => "hosts#index", :as => :hosts_index
  match "hosts/add" => "hosts#add", :as => :hosts_add
  match "hosts/remove" => "hosts#remove", :as => :hosts_remove

  match "apps" => "apps#index", :as => :apps_index
  match "apps/create" => "apps#create", :as => :apps_create, :via => :get
  match "apps/create" => "apps#create_post", :as => :apps_create_post, :via => :post
  match "apps/:id" => "apps#get", :as => :apps_get

  match "users" => "users#index", :as => :users_index
  match "login" => "users#login", :as => :users_login, :via => :get
  match "login" => "users#login_create", :as => :users_login_post, :via => :post
  match "logout" => "users#logout", :as => :users_logout
  match "register" => "users#register", :as => :users_register, :via => :get
  match "register" => "users#register_post", :as => :users_register_post, :via => :post

end
