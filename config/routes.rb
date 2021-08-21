Rails.application.routes.draw do
  root to: 'homes#top'
  get 'index' => 'homes#index'
  # foster

  devise_for :fosters, controllers: {
    sessions:      'fosters/sessions',
    passwords:     'fosters/passwords',
    registrations: 'fosters/registrations'
  }

  namespace :foster do
    resources :dogs do
      collection do
        get 'thanx'
      end
    end


    resources :fosters, only: [:show, :edit, :update] do
      collection do
        patch 'out'
      end
    end
  end

  # member

  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }

  namespace :member do
    resources :members, only: [:show, :edit, :update] do
      collection do
        patch 'out'
      end
    end

    resources :dogs do
      resource :likes, only: [:create, :destroy]  #いいねをするためのルート
      collection do
        get 'search'
      end
    end
    get 'likes' => 'likes#index' ##お気に入り一覧出すためのルート　一覧を出すのにdogいらない

  end
  
  resources :rooms, :only => [:show, :create] do
    resources :messages, :only => [:create]
  end 
  
  resources :notices
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
