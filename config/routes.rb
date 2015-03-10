Rails.application.routes.draw do
  resources :polls do
    resources :questions do
      resources :answers
    end
  end

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/sign-out", to: "sessions#destroy", as: :sign_out
  root 'static_pages#index'
end
