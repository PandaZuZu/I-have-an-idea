Rails.application.routes.draw do

  get 'register' => 'users#new', as: 'users'
  post 'register' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  get 'project_registration' => 'projects#new', as: 'projects'
  post 'project_registration' => 'projects#create'
  post 'project_delete' => 'projects#destroy'
  get 'projects/edit' => 'projects#edit', as: 'project'
  post 'projects/update'
  get 'projects/viewproject'

  get 'my_project' => 'projects#show'

  get 'admin_panel' => 'sessions#admin_panel'
  post 'admin_panel' => 'sessions#password_changed'

  get 'achievement/show'
  get 'achievement/new', as:'achievements'
  post 'achievement/new' => 'achievement#create'
  post 'achievement/destroy'

  get 'users/show_achievement'

  get 'show' => 'sessions#show'

  get 'review/show'
  get 'review/new', as:'reviews'
  post 'review/new' => 'review#create'




  get 'home/index'

  root 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
