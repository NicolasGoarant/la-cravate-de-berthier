Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users
root 'cravates#index'
resources :cravates, only: [:index, :show]
  resources :orders, only: [:show, :create] do
  resources :payments, only: :new
  end

mount StripeEvent::Engine, at: '/stripe-webhooks'

end
