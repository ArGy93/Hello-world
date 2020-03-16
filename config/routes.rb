Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  # get 'personal', controller: 'personal', action: 'history'

  get 'personal', controller: 'pages', action: 'personal'

  get 'pages/:slug', controller: 'pages', action: 'show'

  get 'tickets', controller: 'pages', action: 'tickets'

  get 'news', controller: 'pages', action: 'news'

  get 'answers', controller: 'pages', action: 'answers'

  get 'recent', controller: 'rounds', action: 'history'

  get 'index/index'

  get 'orders/create', controller: 'orders', action: 'create'

  root 'index#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
