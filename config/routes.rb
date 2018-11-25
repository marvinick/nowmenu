Rails.application.routes.draw do
  resources :projects 
  resources :items
  root to: "projects#index" 
end
