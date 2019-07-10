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
    resources :collections, only: %i[new create]
    resources :links, only: %i[new create]
    resources :upcoming_projects, only: %i[new create]
  end

  resources :links, only: %i[edit update]
  resources :upcoming_projects, only: %i[edit update]
end
