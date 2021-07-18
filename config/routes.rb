Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index'

  #We're telling scope that we want to use /admin as a URL prefix, and
  #all of the included routes will be handled by controllers in the admin module.
  #stats_path (when using scope/module)
  # scope '/admin', module: 'admin' do

  #When we want to route with a module and use that module's name as the URL prefix,
  #we can use the namespace method instead of scope, module.
  #The namespace method makes the assumption that the path prefix and module name match, 
  #saving us some typing. (DRY)
  #admin_stats_path (when using namespace)
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
