Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pages do
    resources :pages, only: [:index, :destroy]
  end

  resources :books, only: [:new, :create, :index, :destroy]
end
