BellyGuide::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]

  root :to => "users#show"
end
