Rails.application.routes.draw do
  resources :evaluateds do
    member do
      post 'assign_instrument'
      get 'show_evaluted_with_instruments'
    end
  end
end
