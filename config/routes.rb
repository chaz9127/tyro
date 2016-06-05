Rails.application.routes.draw do
  resources :users
  resource :session, :path => 'log_in'
end
