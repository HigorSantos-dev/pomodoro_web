Rails.application.routes.draw do
  resources :tasks do
    resources :pomodoros, only: [ :create, :update ]
  end

  root "tasks#index"
end
