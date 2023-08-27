Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  post '/reactions', to: 'reactions#user_reaction', as: 'user_reaction'
  get '/my_reactions', to: 'reactions#post_with_reactions', as: 'my_reactions'

  root 'posts#index'
end
