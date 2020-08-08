Rails.application.routes.draw do
  devise_for :users
  resources :tickets, only: [:create, :show]

  resource :search, only: [:new, :show, :edit, :create] #  в ед числе создается singular

  namespace :admin do
    resources :railway_stations do
      # on: :member - действие над конкретным объектом
      patch :update_position, on: :member
    end

    resources :trains do
      #опция для вложенных ресурсов shallow: true что бы убрать лишние параметры
      #указывает, что родительский объект train нужен только для 
      #экшинов index, create, new. Т.е. train_id убирается  
      resources :carriages, shallow: true # вложенный ресурс (вагон)
    end

    resources :routes
    resources :tickets
  end

  get 'welcome/index'

  #root 'welcome#index'
  root 'searches#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
