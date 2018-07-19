Rails.application.routes.draw do
  devise_for :users
  get 'swipes/index'
  get 'matches/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
