root to: "application#home"

resources :borrowers do
  resource :periods, only: %i(new create), module: :borrowers
end
