Rails.application.routes.draw do
  root to: 'homes#top'
  
  devise_for :fosters, controllers: {
    sessions:      'fosters/sessions',
    passwords:     'fosters/passwords',
    registrations: 'fosters/registrations'
  }
  
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
