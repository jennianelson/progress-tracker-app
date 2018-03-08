Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  #STUDENT USER
  root 'student_subjects#index'
  
  resources :student_subjects, only: [:index, :show, :create, :destroy]
  
  resources :sections, only: [:show, :edit, :update] do 
    #section edit and update belong in admin routes but won't work there
    resources :student_standards, only:[:show, :edit, :update]
  end


  #ADMIN

scope '/admin' do
  resources :standards, only: [:index, :create, :update, :destroy]
  resources :subjects do 
      resources :standards, only: [:show, :new, :edit]
  end
  # resources :student_subjects, only: [:destroy]
end

end
