Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}

  namespace :admin do
    resources :members, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update] do
      resources :order_products, only: [:update]
    end
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    root to: 'homes#top'
  end
    delete '/cart_products/destroy_all', to: 'public/cart_products#destroy_all'
    resources :cart_products, module: :public, only: [:index, :update, :destroy]
    post '/cart_products', to: 'public/cart_products#create',  as: 'create_cart_products'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
