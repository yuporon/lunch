Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/users/registrations',
    sessions: 'devise/users/sessions'
  }
end
