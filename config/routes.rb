Rails.application.routes.draw do
  #AUTHENTICATION
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  #STUDENT ROUTES
  root 'student_subjects#index'

  resources :student_subjects, only: [:index, :show, :create, :destroy] do 
    resources :sections, only: [:show]
    resources :student_standards, only: [:index]
  end
  
  resources :student_standards, only:[:show, :edit, :update]
  
  
  #ADMIN ROUTES
  resources :sections, only: [:edit, :update]
  resources :standards, only: [:create, :update, :destroy]
  resources :users, only: [:index, :show, :update, :destroy] 
  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end

end
