Rails.application.routes.draw do
  devise_for :users

  get "/homes", to: "homes#home", as: :home

  root to: "homes#home"

  get :search, controller: :search

  resources :projects do
    member do
      get 'preview'
      get 'load_activities'
    end

    resources :groups do
      collection do
        patch :sort
      end
    end

    resources :categories

    resources :items do
      collection do
        patch :sort
      end
      resources :reviews
    end

    resources :project_users, path: :users, module: :projects
  end


end
