Rails.application.routes.draw do
  devise_for :users
  get '/', to:'tasks#index'
  root 'tasks#index'
  get 'tasks/new', to: 'tasks#new', as: 'new_task'
  get 'tasks/edit', to: 'tasks#edit', as: 'edit_task'
  post 'tasks/new', to: 'tasks#create', as: 'create_task'
  post 'tasks/update/:id', to: 'tasks#update', as: 'update_task'
  delete 'tasks/delete/:id', to: 'tasks#delete', as: 'delete_task'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
