Rails.application.routes.draw do
  get 'relations/new'

   resources :profiles
 
 devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}
  get 'pages/index'

  get 'pages/top'

  get 'pages/show'
  
  root 'pages#top'


 post 'relations/create' => 'relations#create'
 post 'relations/destroy' => 'relations#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
