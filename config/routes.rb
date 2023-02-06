Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users
  resources :stores do
    resources :reviews, shallow: :true
    resource :likes, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
    collection do
      get 'bookmarks'
    end
  end
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
