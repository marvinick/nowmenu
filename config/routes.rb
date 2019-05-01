Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

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

      member do
        get 'preview'
        get "result"
        delete :delete_image
      end

      collection do
        patch :sort
        get 'chart'
      end

      resources :reviews do
        collection do
          get 'chart'
        end
      end

    end

    resources :faqs

    resources :requests

    resources :project_users, path: :users, module: :projects

    post "items_filter", action: :index, controller: "items_filter"

    resources :charts do
      collection do
        get 'chart'
      end
    end
  end



  # Service Worker Routes
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
end
