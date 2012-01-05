Madearthome::Application.routes.draw do

  resources :properties_to_categories

  resources :discounts_to_products

  resources :discounts

  resources :related_products

  resources :designers

  resources :manufacturers

  get "home/index"

  resources :advantages_to_products

  resources :advantages

  resources :property_categories_to_categories

	devise_for :users, :path => '', :path_names => { :sign_in => "admin/login", :sign_out => "admin/logout", :sign_up => "admin/register" }

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  #devise_for :users do
		#get "/admin/login" => "devise/sessions#new"
#	end

  get "admin/index"

	match "admin" => 'admin#index'

  resources :wishlist_items

  resources :wishlists

  resources :properties_to_products

  resources :properties

  resources :property_categories

  resources :order_items

  resources :orders

  resources :user_addresses

  resources :users

  resources :categories

  resources :photos

  resources :products

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

	# DEVISE

	# DEVISE END

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'home#index', :as => 'index'
	root :to => 'home#index', :as => 'index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
