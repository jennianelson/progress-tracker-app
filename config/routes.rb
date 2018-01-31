Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #STUDENT USER
  root 'student_subjects#index'
  
  resources :student_subjects, only: [:show, :destroy] do
    resources :sections, only: [:show]
  end

  resources :student_standards, only:[:edit, :update]


  #ADMIN
  # resources :subjects
  # resources :sections, only: [:new, :create, :edit, :update, :destroy]

  # resources :sections, only: [:show] do
  #   resources :standards, only:[:create, :index]
  # end

  # resources :standards, only: [:index]


end
