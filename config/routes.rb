ClubOrganizr::Application.routes.draw do
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
  
  scope "(:locale)", :locale => /en|de/ do
	  devise_for :users
	  root :to => "customers#index"
	  resources :customers
		 scope path: "(:customer_id)", :as => "customer" do
		  resources :events		  
		  resources :customers_users, :path => "members", :only => [:index, :create]
		  resources :customers_users, :path => "member", :except => [:index, :create]
		  resources :events_users, :path => "availability"

	  end
	  resources :users
	  get "/index/imprint", :controller => "indices", :action => "imprint"
	  get "/index/imprint", :controller => "devise/indices", :action => "imprint"
	  get "/index/privacy", :controller => "indices", :action => "privacy"
	  get "/index/privacy", :controller => "devise/indices", :action => "privacy"
	  resources :conversations, only: [:index, :show, :new, :create] do
	    member do
	      post :reply
	      post :trash
	      post :untrash
	    end
	end
  end

get '/(:locale)' => "customers#index"

end
