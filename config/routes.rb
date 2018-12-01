Rails.application.routes.draw do
  devise_for :users
  root to: "projects#index" 
  
  resources :projects do 
    resources :items do 
      resources :reviews 
    end 

    resources :project_users, path: :users, module: :projects
  end 

  
end
