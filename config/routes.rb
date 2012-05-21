SimpleFormBootstrap::Application.routes.draw do
  resources :locations

  resources :events

  resources :users

  resources :articles do
    resources :comments, :only => :create, :controller => 'articles/comments'
  end

  root :to => 'articles#index'

  match 'login' => 'users#login'

  match 'logout' => 'users#logout'


  match '/users/sign_in' => 'users#sign_in'

  
end
