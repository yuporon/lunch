Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/users/registrations',
    sessions: 'devise/users/sessions'
  }
  
  root to: 'recruits#index'
  resources :recruits do
    member do
      resources :favorites, only: [:create, :destroy]
      get :assign
    end
    collection do
      get :my_lunch
    end
  end

  resource :users
end
