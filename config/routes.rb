Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root 'pages#index', as: :root
  end

  root 'pages#public_index', as: :public_root

  resources :clients

  resources :invoices do
    resources :activities
  end

end
