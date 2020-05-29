Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/contact', to: 'pages#contact', as: :contact

  #landing pages
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/services', to: 'pages#services'

  # Legal
  get '/legal/privacy', to: 'pages#privacy', as: :privacy
  get '/legal/impressum', to: 'pages#impressum', as: :impressum

  # Contact Forms
  resources :contact_forms, only: :create
  get 'contact_forms/success', to: 'contact_forms#success', as: :contact_forms_success
  post 'contact_forms/subscribe', to: 'contact_forms#subscribe', as: :contact_forms_subscribe

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard', as: :admin_dashboard

  # Artists
  resources :artists do
    resources :collections, only: %i[index new create edit update destroy], shallow: true do
      resources :artworks, only: %i[new create edit update show destroy], shallow: true
    end
    resources :links, only: %i[new create edit update destroy], shallow: true
    resources :upcoming_projects, only: %i[new create edit update destroy], shallow: true
    resources :resume_blocks, only: %i[index]
  end

  # News
  resources :news_posts, only: %i[index show new create edit update destroy]
  resources :categories, only: %i[new create edit update destroy]

  # Home Page Quotation
  resources :home_page_quotations, only: %i[edit update]

end
