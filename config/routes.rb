Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get 'pages/about'
  get 'pages/contact'

  resources :establishments do
    resources :reviews, except: [:show, :index]
  end

  namespace :api, defaults: { format: :json} do
    namespace :v1 do 
      resources :users, only: [:show, :create, :update]
      resources :establishments, only: [:index, :show]
    end
  end
end
