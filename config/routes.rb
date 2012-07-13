Pages::Application.routes.draw do
  namespace :api do
    resources :pages do
      collection do
        get :published
        get :unpublished
      end
      member do
        get :publish
        get :total_words
      end
    end
  end
end
