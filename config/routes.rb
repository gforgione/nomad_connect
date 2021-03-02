Rails.application.routes.draw do
  devise_for :users
  root to: 'cities#home'
 
  resources :cities, only: %w[show] do 
    resources :faq, only: %w[index]
    resources :events, only: %w[index show]
    resources :headlines, only: %w[index]
    resources :forums, only: %w[index] do 
      resources :posts, only: %w[index]
    end 
  end 
  resources :forums, only: %w[index] do 
    resources :posts, only: %w[create index]
  end 
  resources :posts, only: %w[destroy] do 
    resources :comments, only: %w[create]
  end 
  resources :chatrooms, only: %w[show] do
    resources :messages, only: %w[create]
  end 
  resources :locations, only: %w[index]
end
