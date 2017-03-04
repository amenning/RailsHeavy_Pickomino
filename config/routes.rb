Rails.application.routes.draw do
  resources :player_worms
  resources :frozen_dices
  resources :frozen_dice_sets
  resources :active_dices
  resources :grill_worms
  resources :dices do
    collection do
      get 'create_random'
    end
  end
  resources :worms
  resources :player_statuses
  resources :player_worm_sets
  resources :frozen_dice_statuses
  resources :images
  resources :themes
  resources :active_dice_sets
  resources :player_options
  resources :grills
  resources :gamestates
  resources :phases
  resources :games
  resources :players
  resources :users
  resources :grill_worm_tiles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: 'application#angular'

  resources :users, only: [:create, :show] do
    collection do
      post :login
      post :continue_game
      post :logout
    end
    resources :games, only: [:create, :show] do
      resources :game_states, only: [:create, :show]
    end
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
