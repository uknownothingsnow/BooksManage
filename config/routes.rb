BooksManage::Application.routes.draw do
  devise_for :users

  root :to => 'sites#index'

  resources :books do
    member do
      get :show_list_by_tag
    end
    collection do
      get :search
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
