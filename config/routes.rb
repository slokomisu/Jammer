Rails.application.routes.draw do
  root 'swipes#index'
  devise_for :users
  get 'swipes', to: 'swipes#index'
  get 'matches', to: 'matches/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
