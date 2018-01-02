# 20180102

#### model: user, board, comment

#### controller: boards, sessions

#### gem: bootstrap, font-awesome, faker, bcrypt, kaminari 



*Gemfile*

```ruby
# Import Bootstrap4
gem 'bootstrap'
# Generate Fake data
gem 'faker'
# Pagination
gem 'kaminari'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
```

*app/models/user.rb*

```ruby
class User < ActiveRecord::Base
  has_secure_password # bcrypt
  has_many :boards
end
```

*app/models/board.rb*

```ruby
class Board < AcriveRecord::Base
  belongs_to :user
end
```

*app/controllers/sessions_controller.rb*

```ruby
class SessionsController < ApplicationController
  # 회원가입
  def signup

  end

  def user_signup
    user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      redirect_to '/signin', notice: "회원가입이 완료!"
    else
      redirect_to '/signup', notice: "잘못된 비밀번호 입니다."
    end
  end

  # 로그인
  def signin

  end

  def user_signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "로그인에 성공했습니다."
    else
      redirect_to '/signin', notice: "이메일이 없거나, 비밀번호가 틀렸습니다."
    end
  end
	
  #로그아웃
  def signout
    
  end
end

```



### Javascript

- 이벤트(Event: click, hover, keydown, mouseup, mousedown)
- 이벤트 리스너(on)
- 이벤트 핸들러(function())



### yield, content_for









2.  이벤트, 이벤트 리스너, 이벤트 핸들러

- 이벤트: 마우스 오버(mouseover)
- 이벤트 리스너: onmouseover
- 이벤트 핸들러: 복잡한 function()



목요일 오후 시간까지

##### ajax(비동기 자바스크립트)

- 좋아요(like) 넣다 뺏다
- 댓글 등록
- 댓글 삭제
- 댓글 수정
- 무한스크롤
- 회원가입 할 때 중복체크(id)

금요일에는?

- bootstrap template(asset_pipeline)





