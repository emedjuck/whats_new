Rails.application.routes.draw do
  resources :whats_new_items do
    collection do
      post :reorder
    end
  end

end
