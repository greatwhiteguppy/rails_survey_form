Rails.application.routes.draw do
  root 'survey#index'

  post '/result' => 'survey#create'

  get '/result' => 'survey#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
