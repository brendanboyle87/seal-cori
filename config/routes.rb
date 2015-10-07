Rails.application.routes.draw do
  root to: 'pages#show', page: "home"

  devise_for :users
  get "/pages/:page" => "pages#show"
  resources :records, only: [:new, :create, :show]
end
