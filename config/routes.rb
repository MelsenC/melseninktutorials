Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  get 'privacy', to: 'static_pages#privacy'
  get 'about', to: 'static_pages#about'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: [:create]
  end
  resources :lessons, only: [:show]
  namespace :instructor do
    resources :lessons, only: [:update, :edit, :destroy]
    resources :sections, only: [:update] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:create]
    end
  end
end
