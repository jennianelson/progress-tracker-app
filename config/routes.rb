Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #STUDENT USER
  root 'student_subjects#index'
  
  resources :student_subjects, only: [:index, :show, :create]

  # resources :subjects, only: [:show]
  
  resources :sections, only: [:show] do 
    resources :student_standards, only:[:edit, :update]
  end


  #ADMIN

scope '/teacher' do
  resources :standards, only: [:index, :create, :update]
  resources :subjects, only: [:index, :show, :new, :create, :edit, :destroy] do 
      resources :standards, only: [:show, :new, :edit]
  end
end

  # resources :subjects, only: [:new, :create, :edit, :update, :destroy] do
  #   resources :standards, only: [:index]
  # end
  # resources :sections, only: [:new, :create, :edit, :update, :destroy]

  # resources :sections, only: [:show] do
  #   resources :standards, only:[:create, :index]
  # end

  

end
