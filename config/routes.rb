Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/welcome/home', to: 'welcome#home'
root 'welcome#home'
get "/login", to: "sessions#new" 
post "/login", to: "sessions#create" 
resources :users 
resources :breaks
resources :beaches

get '/signup', to: "users#new", as: "signup"
post '/signup', to: "users#create"
get '/login', to: "sessions#new", as: "login"
post '/login', to: "sessions#create"
post '/logout', to: "sessions#destroy"




end
