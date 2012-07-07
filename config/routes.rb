SimpleFormBootstrap::Application.routes.draw do
  resources :locations

  resources :events
  match '/users/send_user_reminders' => 'users#send_user_reminders'
  match '/users/advanced_search' => 'users#advanced_search'
  match '/users/search' => 'users#search'
  match '/users/dashboard' => 'users#dashboard'
  match '/users/send_reminders' => 'users#send_reminders'

  resources :users

  resources :articles do
    resources :comments, :only => :create, :controller => 'articles/comments'
  end
  
  resources :catogiries

  root :to => 'articles#index'

  match 'login' => 'users#login'

  match 'logout' => 'users#logout'
 
  match '/users/sign_in' => 'users#sign_in'

  match '/remove_event' => 'events#remove_event'

  match '/send_event_reminders' => 'events#send_event_reminders'

  
end
