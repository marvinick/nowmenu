Rails.application.routes.draw do
  root to: "projects#index" 
  
  resources :projects do 
    resources :items do 
      resources :reviews 
    end 
  end 

  
end
