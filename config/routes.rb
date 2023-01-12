Rails.application.routes.draw do
  devise_for :players, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    #sign_up: "register"
  }
  resources :players do 
    collection do
      get :score
    end
  end
  resources :games, except: [:index] do 
    member do
      get :in_game
    end
  end

  put "estado/:id", to: "games#estado", as: "estado"

  resources :deaths, only: [:create, :destroy]

  resources :seasons, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root to: "home#index"

  root to: "players#index"
  # get "index", to: 'players#index'

  # get "show", to: 'players#show'

end
