Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root 'splash#index', as: :unauthenticated_root
  end

  resources :groups do
    resources :deals, only: [:index, :new, :create]
  end
end
