Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  get '/', to:'tasks#index'
    resources :tasks
end
