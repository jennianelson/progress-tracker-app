Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :update, :destroy] 
  
  root 'student_subjects#index'
    
  resources :student_subjects, only: [:index, :show, :create, :destroy] do 
    resources :sections, only: [:show]
  end
  
  resources :sections, only: [:edit, :update]
  
  resources :student_standards, only:[:show, :edit, :update]
  

  resources :standards, only: [:create, :update, :destroy]

  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end


end
