Rails.application.routes.draw do

  root to: 'cocktails#index'

  resources :cocktails, except: [:edit, :update] do
    collection do
      get '/ingredients', to: "cocktails#ingredients"
    end
    resources :doses, shallow: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
