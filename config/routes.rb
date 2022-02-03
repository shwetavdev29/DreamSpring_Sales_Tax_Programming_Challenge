Rails.application.routes.draw do
  resources :bills do
    member do
      get :receipt
    end
  end
  resources :categories
  root to: 'bills#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
