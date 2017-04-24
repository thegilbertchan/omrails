Rails.application.routes.draw do
  resources :forum_threads do
    resources :forum_posts
  end
  resources :forum_posts
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get 'signin' => 'devise/sessions#new'
  	delete 'signout' => 'devise/sessions#destroy'
  	get 'signup' => 'devise/registrations#new'
  end
  root 'pages#home'
  # get '/' => 'pages#home'
  get 'about' => 'pages#about'
  get 'homealt' => 'pages#homealt'
  get 'contact' => 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
