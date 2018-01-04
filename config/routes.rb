Rails.application.routes.draw do
  resources :boards do
    member do
      post '/comments' => 'boards#create_comment', as: :create_comment_to
      delete '/comments/:comment_id' => 'boards#delete_comment', as: :delete_comment_to
      patch '/comments/:comment_id' => 'boards#update_comment', as: :update_comment_to
    end
    collection do
      get '/:board_id/like' => 'boards#user_like_board', as: :user_like
      get '/page_scroll' => 'boards#page_scroll', as: :scroll
    end
  end

  root 'boards#index'

  # sign in
  get '/signin' => 'sessions#signin', as: :user_signin # 로그인 페이지
  post '/signin' => 'sessions#user_signin' # 실제 로그인
  # sign up
  get '/signup' => 'sessions#signup', as: :user_signup # 회원가입 페이지
  post '/signup' => 'sessions#user_signup' # 실제 회원가입
  post '/check_email' => 'sessions#check_email'
  # sign out
  delete '/signout' => 'sessions#signout', as: :user_signout # 로그아웃
end
