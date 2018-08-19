Rails.application.routes.draw do
  #AUTHENTICATION
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  root 'student_subjects#index'
  get '/subjects/ready', to: 'subjects#ready'

  resources :student_subjects, only: [:index, :show, :create, :destroy] do 
    resources :sections, only: [:show]
    resources :student_standards, only: [:index]
  end
  
  resources :student_standards, only:[:show, :edit, :update]
  
  resources :sections, only: [:edit, :update]
  resources :standards, only: [:create, :update, :destroy]
  resources :users, only: [:index, :show, :update, :destroy] 
  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end

end