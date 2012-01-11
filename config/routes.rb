TheTask::Application.routes.draw do

  get "dashboard/index"

##  match 'denied' => 'dashboard#denied_action'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  match 'players/:player_id/challenges' => 'player_challenges#index'
  match 'games/:game_id/challenges/type_change' => 'challenges#type_change'
  
  resources :entering_messages, :only => [:edit, :show, :update], :controller => :player_challenges
  resources :capturing_codes, :only => [:edit, :show, :update], :controller => :player_challenges
  resources :player_challenges, :only => [:edit, :show, :update], :controller => :player_challenges
  resources :position_confirmation, :only => [:edit, :show, :update], :controller => :player_challenges

  # TODO like :capturing_codes
  #  resources :entering_messages, :controller => :player_challenges
 
  resources :rewards do
    get 'collect', :on => :member 
  end
  
  resources :reward_collections, :only => [:index, :show]

  resources :plays, :except => [:destroy, :edit, :new]


  resources :games do
    resources :challenges do
    end
    
#    resources :capture_codes, :controller => :challenges
#    resources :enter_messages, :controller => :challenges
#    resources :confirm_positions, :controller => :challenges
 
    get 'activate', :on => :member 
    get 'archive', :on => :member 
  end

  resources :users do
  #  resources :challenges, :controller => :player_challenges
#    resources :
  end
  
  root :to => 'dashboard#index'


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
  #  root :to => 'dashboard#index'

  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
