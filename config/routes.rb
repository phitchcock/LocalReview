Rails.application.routes.draw do
  devise_for :users
  root "establishments#index"
  get 'pages/about'
  get 'pages/contact'

  resources :establishments do
    resources :reviews, except: [:show, :index]
  end
end
