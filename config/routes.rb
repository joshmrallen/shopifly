Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end
end
