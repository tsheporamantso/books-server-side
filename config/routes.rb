Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end
end
