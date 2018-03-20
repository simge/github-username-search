Rails.application.routes.draw do
  root 'search#index'

  get 'search/search'

  get 'search/list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
