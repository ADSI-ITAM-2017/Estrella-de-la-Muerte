Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms
  root 'rooms#index'
  devise_for :usuarios, :controllers => { registrations: 'registrations' }
end
