Rails.application.routes.draw do
    root "home#index"

    resources :accounts do 
        resources :contacts, only: [:index, :new]
    end 

    resources :contacts, except: [:new]
end
