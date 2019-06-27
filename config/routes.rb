Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Contact Forms
  resources :contact_forms, only: :create
  get 'contact_forms/success', to: 'contact_forms#success', as: :contact_forms_success

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard', as: :admin_dashboard

  # Artists
  resources :artists, only: %i[index show new create edit update] do
    member do
      get 'layout'
      get 'edit_collections'
    end
  end
end
