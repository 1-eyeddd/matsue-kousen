Rails.application.routes.draw do
  get 'site/index'
	root 'site#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'monitoring' => 'monitoring#show'
end