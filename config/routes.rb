Rails.application.routes.draw do
  root 'home#index'
  get 'login' => 'sessions#login'
  post 'login' => 'sessions#auth'
  get 'staff/:id' => 'staff#index'
  get 'spreadsheet' => 'application#download_spreadsheet'

  # api
  get 'api/staffs/:type' => 'api#staffs'
end
