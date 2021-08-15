Rails.application.routes.draw do
  
  root "pages#home"
  get 'receipts/index'
  get 'receipts/:id', to: 'receipts#show'
  devise_for :retailers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
