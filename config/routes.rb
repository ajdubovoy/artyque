Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :contact_forms, only: :create
  get 'contact_forms/success', to: 'contact_forms#success', as: :contact_forms_success
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
