Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :products do
   resources :reviews, except: [:index, :show]
   collection do
     get 'search'
    end
  end
  resources :carts
  resources :cart_items do 
    get 'decrease', on: :member
    get 'increase', on: :member
  end
  resources :orders
  

  resources :products do
    resources :questions do
    resources :answers
    end
  end

  resources :questions do
      resources :answers
  end

  resources :products do
    member do
     get :add_to_cart
    end
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home#index'
   match '/about_us',   to: 'home#about_us',   via: :get
   match '/contact_us', to: 'home#contact_us', via: :get
end
