Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  get 'swipes' => 'swipes#index'
  post 'swipes/:swipee_id' => 'swipes#swipe'
  get 'matches' => 'matches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
