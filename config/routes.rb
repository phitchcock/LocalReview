Rails.application.routes.draw do
  root "pages#home"
  get 'pages/about'
  get 'pages/contact'

  resources :establishments
end
