Rails.application.routes.draw do
  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'
  
  resources :users, only: [:edit, :new, :create, :update] do
    collection do 
      get 'index', to: 'users#index'
      get 'login', to: 'users#login_form'
      get 'signup', to: 'users#new'
      post 'login', to: 'users#login'
      post 'logout', to: 'users#logout'
     end
    member do
      delete 'destroy', to: 'users#destroy'
     end
    resource :relevances, only: [:create, :destroy]
      member do
        get 'followings'
        get 'followers'
      end
    end
  # resource :users do
  #  resource :relevances, only: {:create, :destroy}

    
  get 'users/:id' => 'users#show'
  
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id/edit' => 'posts#edit'
  get 'posts/:id' => 'posts#show'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/update' => 'posts#update'
  post 'posts/:id/destroy' => 'posts#destroy'
  
  get '/' => 'home#top'
  get '/about' => 'home#about'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # end 
 end
