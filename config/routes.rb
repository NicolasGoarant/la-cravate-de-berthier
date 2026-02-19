Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
  # PWA
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # Pages
  root "pages#home"
  post "subscribe_newsletter", to: "pages#subscribe_newsletter", as: :subscribe_newsletter
  # Cravates
  resources :cravates, only: [:index, :show]
  get 'engagements/ecologique', to: 'engagements#ecologique', as: :engagement_ecologique
  get 'engagements/feministe', to: 'engagements#feministe', as: :engagement_feministe
  get 'engagements/solidaire', to: 'engagements#solidaire', as: :engagement_solidaire
  get 'faq', to: 'pages#faq', as: :faq
  get 'contact', to: 'pages#contact', as: :contact
  get 'cgv', to: 'pages#cgv', as: :cgv
  get 'mentions-legales', to: 'pages#mentions_legales', as: :mentions_legales
  get 'confidentialite', to: 'pages#privacy', as: :privacy
  get 'livraison', to: 'pages#shipping', as: :shipping
  get 'a-propos', to: 'pages#about', as: :about

  # Panier
  get 'panier', to: 'cart#show', as: :cart
  post 'panier/ajouter/:id', to: 'cart#add', as: :cart_add
  patch 'panier/modifier/:id', to: 'cart#update', as: :cart_update
  delete 'panier/supprimer/:id', to: 'cart#remove', as: :cart_remove
  delete 'panier/vider', to: 'cart#clear', as: :cart_clear

  # Checkout
  get 'commander', to: 'checkout#show', as: :checkout
  post 'commander', to: 'checkout#create'
end
