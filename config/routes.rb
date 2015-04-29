Rails.application.routes.draw do
  root "establishments#index"
  get 'pages/about'
  get 'pages/contact'

  resources :establishments
end
