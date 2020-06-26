Rails.application.routes.draw do
  devise_for :members
  root "mainmenu#index"
  resources :mainmenu do
    collection do
      get 'about' 
    end
  end

  resources :members do
    collection do
      post 'make_user' , to: 'members#make_user'
      get 'sign_in_form' , to:'members#sign_in_form'
    end
  end

end
