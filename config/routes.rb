Rails.application.routes.draw do
  namespace :admin do
    root to: 'pages#index'
    get  'login',  to: 'sessions#new'
    post 'login',  to: 'sessions#create'
    get  'logout', to: 'sessions#destroy'

    get 'registrants/download', to: 'registrants#download'
  end

  admin_for :pages
  admin_for :registrants
  admin_for :units
  admin_for :unit_lines
  admin_for :team_members
  admin_for :press_clippings
  admin_for :places
  admin_for :users
  admin_for :fact_sheets
  admin_for :images, private: true

  get 'login', to: redirect('/admin/login')
  post 'login',  to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  ########################
  ### Public Routes ######
  ########################

  root to: 'pages#show'

  get 'exclusive-trailer', to: 'trailer#show'

  resource :sitemap, only: :show
  resources :registrants, only: [:new, :create]
  resources :fact_sheets, only: :show
  resources :pages, only: :show, path: '(:slug)'
end
