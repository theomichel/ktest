Rails.application.routes.draw do
  get 'landings/index'

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  devise_for :beeorganizers, controllers: {registrations: "beeorganizers/registrations", sessions: "beeorganizers/sessions", passwords: "beeorganizers/passwords"}, skip: [:sessions, :registrations]
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landings#index'

  get 'landings/spellersignup'
  get 'landings/beeorganizersignup'

  #/spellersignup 'landings#spellersignup.html'
  #/beesignup 'landings#beesignup.html'

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
  
  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end

  devise_scope :beeorganizer do
    get    "organizerlogin"   => "beeorganizers/sessions#new",         as: :new_beeorganizer_session
    post   "organizerlogin"   => "beeorganizers/sessions#create",      as: :beeorganizer_session
    delete "organizersignout" => "beeorganizers/sessions#destroy",     as: :destroy_beeorganizer_session
    
    get    "organizersignup"  => "beeorganizers/registrations#new",    as: :new_beeorganizer_registration
    post   "organizersignup"  => "beeorganizers/registrations#create", as: :beeorganizer_registration
    put    "organizersignup"  => "beeorganizers/registrations#update", as: :update_beeorganizer_registration
    get    "organizeraccount" => "beeorganizers/registrations#edit",   as: :edit_beeorganizer_registration
  end


end
