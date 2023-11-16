Rails.application.routes.draw do
  root "parcels#index"
  get 'info' => 'info#list', as: 'list'
  get "/parcels" =>  "parcels#index", as: 'index'
  get "/info/from" => "info#showFrom", as: 'showFrom'
  get "/info/value" => "info#showValue", as:'showValue'
  get "/info/repeated" => "info#showRepeated", as: 'showRepeated'

  resources :parcels
end
