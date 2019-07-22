Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Contact Forms
  resources :contact_forms, only: :create
  get 'contact_forms/success', to: 'contact_forms#success', as: :contact_forms_success

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard', as: :admin_dashboard

  # Artists
  resources :artists, only: %i[edit update] do
    resources :collections, only: %i[new create edit update], shallow: true do
      resources :artworks, only: %i[new create edit update], shallow: true
    end
    resources :links, only: %i[new create edit update], shallow: true
    resources :upcoming_projects, only: %i[new create edit update], shallow: true
  end
end
