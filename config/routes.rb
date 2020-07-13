Rails.application.routes.draw do
  devise_for :members
  root "rooms#index"
  resource :room do
    resources :messages do
      post 'make_message', to:'messages#make_message'
    end
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

  resources :tasks

end
