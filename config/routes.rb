Rails.application.routes.draw do
  devise_for :users
  resources :products do
   resources :reviews, except: [:index, :show]
   collection do
     get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home#index'
   match '/about_us',   to: 'home#about_us',   via: :get
   match '/contact_us', to: 'home#contact_us', via: :get
end
