Rails.application.routes.draw do
  resources :polls do
    resources :questions do
      resources :answers
    end
  end
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/signout", to: "sessions#destroy", as: :signout
  root 'polls#index'
end
