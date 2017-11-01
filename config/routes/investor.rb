root to: "dashboard#show"

resources :borrowers do
  resource :periods, only: %i(new create), module: :borrowers
end
