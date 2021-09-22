Rails.application.routes.draw do
  get 'search/search'
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: 'home_about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships,  only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
