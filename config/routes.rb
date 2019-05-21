Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :stories do
    member do
      put :active
      put :inactive
    end

    collection do 
      get :story_by_status
    end  
  end    

end
