Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/users/registrations',
    sessions: 'devise/users/sessions'
  }
  
  resources :recruits do
    member do
      get :assign
    end
    collection do
      get :my_lunch
    end
  end

  resource :users
end
