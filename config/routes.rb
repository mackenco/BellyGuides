BellyGuide::Application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :maps do
      get 'clone', on: :member
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :restaurants, only: [:create, :update, :destroy] do
    get 'clone', on: :member
  end
  resources :favorites, only: :index
  resources :comments, only: :index


  root :to => "users#show"
end
