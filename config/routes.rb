Rails.application.routes.draw do
  devise_for :users

  get "/homes", to: "homes#home", as: :home

  root to: "homes#home"

  resources :projects do
    member do
      get 'preview'
    end

    resources :groups do
      resources :items do
        collection do
          patch :sort
        end
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
