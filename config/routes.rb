Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user'

  resources :forum_threads do
    resources :forum_posts
  end
  resources :forum_posts
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get 'signin', to: 'devise/sessions#new'
  	delete 'signout', to: 'devise/sessions#destroy'
  	get 'signup', to: 'devise/registrations#new'
  end
  root 'pages#home'
  # get '/' => 'pages#home'
  get 'about', to: 'pages#about'
  get 'homealt', to: 'pages#homealt'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
