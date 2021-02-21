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
    resources :customers, only:[:index, :show, :edit, :update]
  end

  namespace :customer do
    resources :products, only:[:index, :show]
    resources :carts, only:[:index, :create, :update, :destroy]
    delete 'cart_all' => 'carts#destroy_all'
    resources :orders, only:[:new, :create, :update,:edit, :index]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :contacts, only:[:new, :create, :index]
    get 'contacts/thanks' => 'contacts#thanks'
    resources :customers, only:[:edit,:update]
  end

end
