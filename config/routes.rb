Rails.application.routes.draw do
  resources :polls do
    resources :questions do
      resources :answers
    end
  end

  root 'polls#index'
end
