Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post 'user_token' => 'user_token#create'

      resources :users, only: %i[show]

      resources :todo_groups do
        resources :todos, only: %i[index create update destroy], shallow: true
      end
    end
  end
end
