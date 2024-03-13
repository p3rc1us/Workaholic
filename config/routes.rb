Rails.application.routes.draw do

  root "categories#index"

  resources :categories do
    resources :tasks, except: :index
  end

  # Index (Read All)
  # get '/categories', to: 'categories#index'

  # New (Create New)
  # get '/categories/new', to: 'categories#new', as: 'new_category'

  # Create (Save New)
  # post '/categories', to: 'categories#create'

  # Show (Read One)
  # get '/categories/:id', to: 'categories#show', as: 'category'

  # Edit (Prepare for Update)
  # get '/categories/:id/edit', to: 'categories#edit'

  # Update (Save Changes)
  # patch '/categories/:id', to: 'categories#update'

  # Destroy (Delete)
  # delete '/categories/:id', to: 'categories#destroy'

  # Tasks Routes (CRUD) - Nested within Categories

  # Index (Read All for a Category)
  # get '/categories/:category_id/tasks', to: 'tasks#index', as: 'category_tasks'

  # New (Create New within a Category)
  # get '/categories/:category_id/tasks/new', to: 'tasks#new'

  # Create (Save New within a Category)
  # post '/categories/:category_id/tasks', to: 'tasks#create'

  # Show (Read One)
  # get '/categories/:category_id/tasks/:id', to: 'tasks#show', as: 'task'

  # Edit (Prepare for Update)
  # get '/categories/:category_id/tasks/:id/edit', to: 'tasks#edit'

  # Update (Save Changes)
  # patch '/categories/:category_id/tasks/:id', to: 'tasks#update'

  # Destroy (Delete)
  # delete '/categories/:category_id/tasks/:id', to: 'tasks#destroy'


  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end
