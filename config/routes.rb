Rails.application.routes.draw do
  resources :psychologists
  post 'login', to: 'psychologists#log_in'
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
