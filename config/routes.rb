Rails.application.routes.draw do
  resources :monitoring_data, only: [] do
    collection do
      get 'create', to: 'monitoring_data#create'
      get 'temperature', to: 'monitoring_data#temperature_data'
    end
  end
end
