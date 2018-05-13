Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'
  
  get 'news/new'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/admin/staffs/new', to: 'admin/staffs#create'
  patch '/admin/staffs/:id', to: 'admin/staffs#update'
  patch 'staff/:id', to: 'admin/staffs#update'
  post '/admin/patients/new', to: 'admin/patients#create'
  patch '/admin/patients/:id', to: 'admin/patients#update'
  patch 'patient/:id', to: 'admin/patients#update'
  post '/admin/appointments/new', to: 'admin/appointments#create'
  patch '/admin/appointments/:id', to: 'admin/appointments#update'
  patch 'appointments/:id', to: 'admin/appointments#update'

  namespace :admin do
    resources :users
    resources :staffs
    resources :patients
    resources :appointments
    resources :news
  end

  resources :appointment
  resources :staff
  resources :patient
  resources :users
  resources :news
  resources :password_resets, only: [:new, :create, :edit, :update]
end