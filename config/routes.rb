Rails.application.routes.draw do
  resources :cities
  resources :pieces do
    resources :registrations
  end
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
end
