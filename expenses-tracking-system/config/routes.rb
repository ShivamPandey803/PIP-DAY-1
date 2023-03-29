Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :ledgers, only: [:create, :update, :destroy, :index] do
    resources :comments, only: [:update]
    post '/comments', to: 'comments#create'
  end

  post '/users', to: 'users#create'
  post '/login', to: 'users#login'
  get '/ledgers', to: 'ledgers#index'
  get '/ledgers/:user_id', to: 'ledgers#index'
  patch '/ledgers/:ledger_id/comments/:id', to: 'comments#update'
end
