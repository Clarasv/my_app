Rails.application.routes.draw do
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  
  get 'users/index' => 'users#index'
  get 'users/:id/edit' => 'users#edit'
  get 'users/:id' => 'users#show'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  post 'users/:id/update' => 'users#update'
  
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
end
