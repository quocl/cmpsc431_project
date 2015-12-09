Rails.application.routes.draw do
  get 'order_items/display_order_report'
   

  get "deliveries/update_address", :as => "update_address"
  get "deliveries/update_card", :as => "update_card"
    get "suppliers/update_address", :as => "update_supplier_address"
  resources :addresses
  devise_for :users

  # resources :categories do
  #   resources :sale_items do
  #   end
  # end
  resources :categories do
    member do
      get :sale_items
    end
  end 

  resources :product_reviews
  resources :suppliers
  resources :ordered_items
  resources :cards
  resources :sale_items
  resources :deliveries
  resources :seller_reviews
  resources :wishlists
  resources :ordered_items, only: [:new, :create, :edit, :update]
  resources :wishlist_items, only: [:create, :update, :destroy]
  resource :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "sale_items#index"


  
  match 'profile' => 'user#profile', via: :get
  match 'upgrade' => 'user#upgrade', via: :get
  match 'cancel' => 'user#cancel', via: :get
  match 'manage_address' => 'addresses#edit', via: :get
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
