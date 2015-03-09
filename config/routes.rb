Rails.application.routes.draw do
  resources :polls
  resources :questions do
    resources :answers
  end

  root 'polls#index'
end
