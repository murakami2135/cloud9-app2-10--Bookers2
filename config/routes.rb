Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  resources :books, only: [:edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:edit, :create, :index, :show, :update]
  get "home/about" => "homes#about"

end
