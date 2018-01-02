Rails.application.routes.draw do
  resources :boards
  root 'boards#index'

  # sign in
  get '/signin' => 'sessions#signin', as: :user_signin # 로그인 페이지
  post '/signin' => 'sessions#user_signin' # 실제 로그인
  # sign up
  get '/signup' => 'sessions#signup', as: :user_signup # 회원가입 페이지
  post '/signup' => 'sessions#user_signup' # 실제 회원가입
  # sign out
  delete '/signout' => 'sessions#signout', as: :user_signout # 로그아웃
end
