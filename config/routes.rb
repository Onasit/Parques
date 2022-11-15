Rails.application.routes.draw do
  devise_for :players, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    sign_up: "register"
  }
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#root to: "home#index"

root to: "players#index"
get "index", to: 'players#index'

end
