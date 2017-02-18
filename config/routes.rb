Rails.application.routes.draw do
  root "main#main"

  get "admin", to: "admin#admin", as: :admin
  post "/", to: "main#find_best_person", as: :find_best_person

  resources :people, only: [:create]
  resources :skills, only: [:create]
  resources :ranks, only: [:create]


end
