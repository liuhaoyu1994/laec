Rails.application.routes.draw do
  get 'services/new'

  get 'services/show'

  get 'services/index'

  get 'services/edit'

  get 'services/creat'

  get 'services/destroy'

  get 'services/update'

  get 'facility_contact/create'

  get 'facility_contact/destroy'

  get 'static_pages/home'

  get 'publish_user_relationships/create'

  get 'publish_user_relationships/destroy'

  get 'publish_relationships/new'

  get 'publish_relationships/show'

  get 'publish_relationships/index'

  get 'publish_relationships/edit'

  get 'publications/new'

  get 'publications/show'

  get 'publication' , to: 'publications#index'

  get 'publications/edit'

  get 'galleries/show'

  get 'galleries/new'

  get 'galleries/index'

  get 'galleries/edit'

  get 'sessions/new'

  get 'authors/new'

  get 'authors/index'

  get 'authors/show'

  get '/signup', to: 'users#new'

  get '/newproject', to: 'projects#new'

  get '/home', to: 'static_pages#home'
  
  get '/teaching', to: 'static_pages#research'

  get '/ensc283', to: 'static_pages#ENSC283'
  
  get '/ensc321', to: 'static_pages#ensc321'

  get '/ensc423', to: 'static_pages#ensc423'


  get '/research', to: 'projects#index'

  get '/service', to: 'static_pages#service'

  get '/about', to:'static_pages#aboutus'

  get '/login',   to: 'sessions#new'
  
  post  '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'
  
  resources :publish_user_relationships
  resources :publish_relationships
  resources :publications
  resources :users
  resources :projects             
  resources :facilities
  resources :galleries
  resources :facility_contacts,      only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :users do
    member do
      get :articles
    end
  end
  
  resources :projects do
    member do
      get :authors
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
