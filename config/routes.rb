Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  #STUDENT USER
  root 'student_subjects#index'
  
  resources :student_subjects, only: [:index, :show, :create]
  
  resources :sections, only: [:show, :edit, :update] do 
    resources :student_standards, only:[:edit, :update]
  end


  #ADMIN

scope '/teacher' do
  resources :standards, only: [:index, :create, :update, :destroy]
  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end
end

end
