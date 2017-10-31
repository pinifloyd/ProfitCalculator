root to: "application#home"

resources :borrowers do
  resources :payments, except: %i(index), module: :borrowers
end
