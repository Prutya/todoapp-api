Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :todo_groups, only: %i[index] do
        resources :todos, only: %i[index create update destroy], shallow: true
      end
    end
  end
end
