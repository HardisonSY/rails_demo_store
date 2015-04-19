Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :products
  root 'products#index'

  resource :cart do
    post 'add', path: 'add/:id'
    get 'checkout'
  end

  resources :orders, except: [:edit, :update, :destroy]

  namespace :backend do
    get 'dashboard', to:'dashboard#index'
    resources :products, except:[:show]
    resources :categories, except:[:show]
    resources :orders, except: [:destroy] do
      post 'pay'
      post 'out'
      post 'deliver'
    end
  end
end
