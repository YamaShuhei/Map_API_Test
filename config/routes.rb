Rails.application.routes.draw do
  get '/' => "homes#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :homes, only: [:index, :show, :new ,:create, :edit]
  resources :posts, only: [:index, :show, :new ,:create, :edit]
end
