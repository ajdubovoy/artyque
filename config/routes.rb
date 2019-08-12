Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Contact Forms
  resources :contact_forms, only: :create
  get 'contact_forms/success', to: 'contact_forms#success', as: :contact_forms_success

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard', as: :admin_dashboard

  # Artists
  resources :artists, only: %i[new create show edit update] do
    resources :collections, only: %i[index new create edit update destroy], shallow: true do
      resources :artworks, only: %i[new create edit update show], shallow: true
    end
    resources :links, only: %i[new create edit update destroy], shallow: true
    resources :upcoming_projects, only: %i[new create edit update destroy], shallow: true
    resources :resume_blocks, only: %i[index]
  end
end
