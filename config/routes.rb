Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :update, :destroy]

  #STUDENT USER
  root 'student_subjects#index'
  
  resources :student_subjects, only: [:index, :show, :create, :destroy]
  
  resources :sections, only: [:show, :edit, :update] do
    resources :student_standards, only:[:show, :edit, :update]
  end

  resources :standards, only: [:create, :update, :destroy]

  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end


end
