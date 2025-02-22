Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :projects, only: [:index, :show] do
    resources :comments, only: [:create]
    resources :status_histories, only: [:create]
  end
end
