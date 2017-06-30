Rails.application.routes.draw do
  # resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # resource :session, controller: "clearance/sessions", only: [:create]
  root :to => 'posts#index'

  #map.sign_out 'sign_out', :controller => 'sessions', :action     => 'destroy',:method     => :delete
  #delete '/sign_out' => 'sessions#destroy', :as => nil

  resources :users, controller: 'users', only: 'create'
  # resources :users, controller: "clearance/users", only: [:create] do
  #   resource :password,
  #     controller: "clearance/passwords",
  #     only: [:create, :edit, :update]
  # end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, shallow: true
  end
  resources :comments

end
