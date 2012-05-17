BooksManage::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => 'sites#index'

  resources :comments
  resources :books do
    member do
      get :show_list_by_tag
      get :like
      get :not_like
    end
    collection do
      get :search
      get :favorite
    end
  end

  namespace :admin do
    root :to => "dashboards#index"
    resources :tags do
      collection do
        get :search
      end
    end
    resources :books do
      collection do
        get :search
      end
    end
    resources :users do
      collection do
        get :search
      end
    end
  end

end
