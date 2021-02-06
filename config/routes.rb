Rails.application.routes.draw do

  root to: 'customer/homes#about'

  devise_for :admins, controllers: {
    sessions:      'devise/admins/sessions',
    passwords:     'devise/admins/passwords',
    registrations: 'devise/admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'devise/customers/sessions',
    passwords:     'devise/customers/passwords',
    registrations: 'devise/customers/registrations'
  }

  namespace :admin do
    get 'homes/top'
    resources :products, only:[:new, :create, :index ,:show, :destroy, :edit, :update]
  end

end