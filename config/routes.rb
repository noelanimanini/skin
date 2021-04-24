Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
  root to: 'products#index'
  resources :products
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
