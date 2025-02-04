Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
    resources :requests
  end 
  resources :users, :only => [:show]

  get "/homes", to: "homes#home", as: :home

  root to: "homes#home"

  get :search, controller: :search

  resources :projects do

    collection do
      get 'projects_chart'
    end

    member do
      get 'preview'
      get 'load_activities'
    end

    resources :groups do
      collection do
        patch :sort
      end
    end
    resources :requests
    resources :categories

    resources :items do
      member do
        get 'average_of_each_value'
        get 'reviews_chart'
        get 'preview'
        get "result"
        delete :delete_image
      end

      collection do
        patch :sort
        get 'chart_item_average_rating_in_index'
      end

      resources :reviews do
        member do
          get 'review_chart'
        end
      end
    end

    resources :faqs
    resources :project_users, path: :users, module: :projects

    post "items_filter", action: :index, controller: "items_filter"

  end

  # Service Worker Routes
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
end
