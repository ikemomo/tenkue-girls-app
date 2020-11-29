Rails.application.routes.draw do
  #ログイン・アカウント編集後、任意のページに推移させる
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "home#index"
  get 'home/show'
  resources :users, only: [:index, :show]
  resources :posts
end
