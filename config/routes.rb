Rails.application.routes.draw do

  root 'customers#index'

  resources :customers

  get '/black_list', to: 'customers#black_list', as: :black_list_customer
  post '/black_list', to: 'customers#add_to_black_list'

  patch '/ban/:id', to: 'customers#ban', as: :ban_customer
  patch '/unban/:id', to: 'customers#unban', as: :unban_customer
end
