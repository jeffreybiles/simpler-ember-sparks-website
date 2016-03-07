Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :posts, only: [:show, :index]
  get 'feed' => 'posts#feed'
  resources :tags, only: [:show, :index]

  get 'about', to: 'pages#about'
  get 'mailing_list', to: 'pages#mailing_list'
  get 'thank_you', to: 'pages#thank_you'
  get 'faq', to: 'pages#faq'
  get 'email_intro_free_validations_display', to: 'pages#email_intro_free_validations_display'
  get 'meta_guide_to_upgrading_ember', to: 'pages#meta_guide_to_upgrading_ember'

  get 'pay', to: 'accounts#pay'
  get 'account', to: 'accounts#show'
  get 'sales', to: 'accounts#sales'
  post 'subscribe', to: 'accounts#subscribe'
  post 'unsubscribe', to: 'accounts#unsubscribe'
  post 'change_credit_card', to: 'accounts#change_credit_card'
  post 'reset_password_through_email', to: 'accounts#reset_password_through_email'

  get 'set_password/:user_id/:token', to: 'users#set_password'
  post 'set_password/:user_id/:token', to: 'users#activate_organization_user'
  get 'accept_invitation/:user_id/:token', to: 'users#accept_invitation'

  mount_ember_app :ember_admin, to: "/ember_admin", controller: "pages", action: "ember_admin"
  mount_ember_app :organization_admin, to: "/organization_admin", controller: "pages", action: "organization_admin"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  namespace :api do
    resources :posts
    resources :tags
    resources :taggings
    resources :users do
      collection do
        post 'bulk_add'
        post 'bulk_remove'
      end
    end
    resources :organizations
  end

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
