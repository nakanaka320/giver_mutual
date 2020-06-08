Rails.application.routes.draw do
  devise_for :members
  root "mainmenu#index"
  resources :mainmenu do
    collection do
      get 'about' 
    end
  end

  resources :members

end
