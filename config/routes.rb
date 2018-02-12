Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios do
    put :sort, on: :collection
  end
  get 'react-items', to: 'portfolios#react'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount Actionable.server => '/cable'

  root to: 'pages#home'
end
