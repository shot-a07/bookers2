Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  resources :users
  resources :books
  
  get 'about' => 'homes#about'
  
  
  
  end
