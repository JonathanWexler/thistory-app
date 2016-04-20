Rails.application.routes.draw do
# main root of app
  root "home#index"

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks'
  }

  #this defines the scope for devise with users
  #if logged in, will root to users index
  #write some actions to say if not logged in go to log in or signup page
  #still have to figure out how to have root of site go to landing page.
  #basically the root to is what devise looks to go after signining in or up.
  devise_scope :user do
    get "login", to: "users/sessions#new"
    resources :profiles
  end

  devise_scope :admin do
    get "login_admin", to: "admins/sessions#new"
    delete 'admins/user/:id' => 'admins/registrations#destroy_user', :as => :admin_destroy_user
    get 'admins/user/:id' => 'admins/registrations#edit_user', :as => :admin_edit_user
    resources :users
  end

  resources :profiles, only: [:new, :create, :show, :edit, :update]


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
