Rails.application.routes.draw do
  #AUTHENTICATION
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: "users/omniauth_callbacks" }

  root 'student_subjects#index'

  resources :student_subjects, only: [:index, :show, :create] do 
    resources :sections, only: [:show]
    resources :student_standards, only: [:index]
  end
  
  resources :student_standards, only:[:show, :edit, :update]
  
  scope 'admin' do
    delete 'student_subjects/:id', to: 'student_subjects#destroy'
    resources :sections, only: [:edit, :update]
    resources :standards, only: [:create, :update, :destroy]
    resources :users, only: [:index, :show, :update, :destroy] 
    resources :subjects do 
        resources :standards, only: [:show, :new, :edit]
    end
  end

end