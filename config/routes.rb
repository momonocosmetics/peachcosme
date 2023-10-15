Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'cosmetics/top' => 'cosmetics#top'

  resources :cosmetics do
      resources :plays, only: [:create, :destroy]
      resources :comments, only: [:create]
  end


  root 'cosmetics#top'

end
