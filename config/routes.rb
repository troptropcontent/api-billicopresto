Rails.application.routes.draw do

  # root "articles#index"
  root to: 'pages#dashboard'
  get 'receipts/index'
  get 'receipts/:id', to: 'receipts#show', as: 'receiptshow'
  devise_for :retailers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end