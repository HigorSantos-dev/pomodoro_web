Rails.application.routes.draw do
  resources :tasks do
    resources :pomodoros, only: [ :new, :create, :index, :show ]
  end

  root "tasks#index"
end
