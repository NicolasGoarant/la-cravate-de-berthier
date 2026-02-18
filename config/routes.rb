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
end
