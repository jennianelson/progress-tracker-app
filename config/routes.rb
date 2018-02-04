Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #STUDENT USER
  root 'subjects#index'

  resources :subjects, only: [:new, :create]
  
  resources :student_subjects, only: [:new, :create, :destroy]

  resources :subjects, only: [:index, :show] do
    resources :sections, only: [:show]
  end
  
  resources :sections, only: [:show] do
    resources :student_standards, only:[:edit, :update]
  end


  #ADMIN
  # resources :subjects
  # resources :sections, only: [:new, :create, :edit, :update, :destroy]

  # resources :sections, only: [:show] do
  #   resources :standards, only:[:create, :index]
  # end

  resources :standards, only: [:index]

end
