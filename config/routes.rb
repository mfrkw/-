Rails.application.routes.draw do
  root to: 'homes#top'
  
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
    
    resources :likes, only: [:index, :create, :destroy]
    resources :chats
    resources :notices
    
    
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
    
    resources :dogs
    resources :chats
    resources :notices
    
    
    
    
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
