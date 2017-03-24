Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :informations do
    resources :comments
  end
  root "informations#index"

end
