Rails.application.routes.draw do
  root "mainmenu#index"
  resources :mainmenu do
    collection do
      get 'about' 
    end
  end
end
