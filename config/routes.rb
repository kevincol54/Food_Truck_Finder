Rails.application.routes.draw do
  devise_for :users
  root'home#index'
  get '/food_trucks' => 'food_trucks#index' 
  
  resources :companies do
    resources :food_trucks, except: :index do
      member do
        patch :closed
        patch :serving
        get :likeorunlike
        post :likeorunlike
        patch :likeorunlike
      end
    end
  end
end
