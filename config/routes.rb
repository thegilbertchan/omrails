Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'signin', to: 'devise/sessions#new'
    delete 'signout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end

  resources :forum_threads do
    resources :forum_posts
  end

  # get 'users/:username', to: 'users#show', as: 'user'
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :forum_threads, only: :show, param: :forum_thread do
    member do
      post 'follow', to: 'follows#follow_forum_thread'
      delete 'unfollow', to: 'follows#unfollow_forum_thread'
    end
  end

  get 'feed', to: 'feed#show'  

  resources :forum_posts
  resources :tweets

  root 'pages#home'
  # get '/' => 'pages#home'
  get 'about', to: 'pages#about'
  get 'homealt', to: 'pages#homealt'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
