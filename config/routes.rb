Rails.application.routes.draw do   

  devise_for :users

  resources :unity_subtypes do
    resources :unities
  end

  resources :unities

  resources :projects do
    resources :contracts
  end
  
  resources :workers do
    #resources :contract_workers 
    member do
      get 'contracts'
      post 'contract_add'
      post 'contract_remove'
    end
  end 

  resources :contracts do
    member do
      get 'assigned'
    end
  end

  resources :swatenttions do
    resource :attentions
    member do
      post 'send_report'
    end
  end

  post 'sendrep' => 'swatenttions#send_report'
  post 'closerep' => 'attentions#close_report'    


  get 'attentions' => 'attentions#index'

  resources :types 
  resources :guards  
  resources :turns


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#main'

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