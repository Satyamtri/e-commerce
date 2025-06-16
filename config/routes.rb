Rails.application.routes.draw do
  root "home#index"
  get "/welcome", to: 'home#welcome'
  get '/progress', to: 'home#progress', as: 'progress'
  devise_for :users ,controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :posts
  resources :topics, only: [:index, :show] do
    resources :sub_topics, only: [] do
      member do
        patch :update_status
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
