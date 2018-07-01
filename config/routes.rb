Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :journals, only: [:index, :show, :new, :create]
      resources :users, only: [:index, :show, :new, :create, :update]
      post "/auth", to: "sessions#create"
      get "/current_user", to: "sessions#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
