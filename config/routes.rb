Rails.application.routes.draw do
  resources :psychologists
  resources :evaluateds do
    member do
      post 'assign_instrument'
      get 'show_evaluted_and_related_instruments'
    end
  end
  resources :instruments
  resources :questions
  resources :answers
end
