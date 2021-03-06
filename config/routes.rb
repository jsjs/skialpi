Skialpi::Application.routes.draw do
 
  root :to => 'static_pages#home'
  
  resources :bug_reports
  resources :users do
    member do
      get :achievements
      get :season
      get :top10
      get :stats
      get :turn_off_helpers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :locations
  resources :areas
  resources :tracks
  resources :achievements
  
  match '/about', to: 'static_pages#about'
  match '/help', to: 'static_pages#help'
  match '/contact', to: 'static_pages#contact'
  match '/skusam', to: 'users#skusam'
  match '/skusam_sprac', to: 'users#skusam_sprac', via: 'put'
  
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  match '/registration', to: 'users#new'
  
  match '/locations/:id/area/new' => 'areas#new'
  match '/locations/:id/area/create' => 'areas#create', via: 'post'
  
  match '/areas/:id/track/new' => 'tracks#new'
  match '/areas/:id/track/create' => 'tracks#create', via: 'post'
  
  match '/tracks/:id/change_area' => 'tracks#change_area'
  match '/tracks/:id/change_area_proc' => 'tracks#change_area_proc', via: 'put'
  match '/tracks/:id/add_as_achievement' => 'tracks#add_as_achievement'
  match '/tracks/:id/add_as_achievement_proc' => 'tracks#add_as_achievement_proc', via: 'post'
  
   match 'update_areas' => 'achievements#update_areas'
   match 'update_tracks' => 'achievements#update_tracks'

   match 'stats' => 'stats#index'
   match 'stats/best' => 'stats#best'
   match 'stats/best_in_season' => 'stats#best_in_season'

   #match 'achievements/new'
   
   #get 'achievements/update_areas', :as => 'update_areas'
   #get 'achievements/update_tracks', :as => 'update_tracks'
   #get 'achievements/new'
 
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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
