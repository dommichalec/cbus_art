Rails.application.routes.draw do
  resources :pieces do
    resources :registrations
  end

  get 'city/columbus' => 'pieces#index'
  root 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
end
