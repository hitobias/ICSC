Rails.application.routes.draw do
  get 'donations/index'

  get 'donations/new'

  get 'donations/create'

  get 'group_applications/index'

  get 'group_applications/new'

  get 'group_applications/update'

  get 'conference_options/new'

  get 'conference_options/create'

  get 'conference_options/index'

  get 'conference_options/show'

  get 'conference_options/edit'

  get 'conference_options/update'

  get 'conferences/new'

  get 'conferences/create'

  get 'conferences/edit'

  get 'conferences/update'

  get 'conferences/show'

  get 'conferences/index'

  get 'members/new'

  get 'members/create'

  get 'members/index'

  get 'members/edit'

  get 'members/update'

  get 'members/destroy'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'home#index'

  get 'announcement' => 'home#announcement'
  get 'registration' => 'users#new'
  get 'tours'        => 'home#tours'
  get 'contact'      => 'home#contact'
  get 'login'        => 'sessions#new'
  post 'login'       => 'sessions#create'
  get 'logout'       => 'sessions#destroy'
  get 'applications' => 'group_applications#index'
  get 'donations'    => 'donations#index'

  resources :users
  resources :members
  resources :groups, only: [:edit, :update, :destroy]
  resources :conferences
  resources :conference_options
  resources :group_applications,  only: [:index, :new, :create]
  
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:index, :new, :create, :edit, :update]


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
