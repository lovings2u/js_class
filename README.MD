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

  # 로그아웃

  def signout
    session.delete(:user_id)
    redirect_to '/', notice: "로그아웃 성공!"
  end

end

```

### yield, content_for

- 내가 원하는 위치에서 `yield :namespace`
- 내가 원하는 내용을 `content_for :namespace do ... end`

### Javascript

- 이벤트(Event: click, hover, keydown, mouseup, mousedown)
- 이벤트 리스너(on)
- 이벤트 핸들러(function())


2. 이벤트, 이벤트 리스너, 이벤트 핸들러

- 이벤트: 마우스 오버(mouseover)
- 이벤트 리스너: onmouseover
- 이벤트 핸들러: 복잡한 function()


### jQuery

- CSS Selector에 의한 DOM 탐색 및 조작

  - parent, sibling을 통해 형제, 부모 DOM을 넘나들 수 있음

- 이벤트

  - .click(.이벤트명), .on('click', function() {}) .on('이벤트명', 이벤트 핸들러)

- AJAX(비동기 JS/XML)

  - rails에서의 ajax

  ```javascript
  // 1. ajax 요청 만들기
  $.ajax({
    // ajax로 요청을 보냄 >> JS파일에 대한 요청
    url: ,// 요청 보내는 url
    method: , //http method
    data: // data parameter
  })
  // 404 error

  // 2. 요청 보내는 url에 대한 route설정
  // member, collection
  // config/routes.rb에서 설정
  // 404 error

  // 3. controller에서 route에서 설정한
  // controller#action 만들어줌
  // 500 error

  // 4. action명과 같은 파일명을 가진 js.erb파일 만들어줌
  // 오타가 없다면, 정상적으로 동작함
  ```



#### 20180104

- 댓글 수정
  - **내용물을 클릭하면 input창으로 바뀜**


- 무한스크롤
  - **스크롤을 끝까지 내리면 발생**
- user email 체크
  - **validation(유효성 검사), front에서 **
- password 와 password_confirmation 내용이 다를경우
  - form이 제출 안되게 함(실습)



1. 이미 가입된 이메일인 경우



2. password와 password_confirmation이 서로 다를경우
   - 비밀번호가 서로 button은 disabled 되어 있어야 함
   - 가입 가능한 이메일인 경우 && 비밀번호가 서로 같은 경우에만 button 사용할 수 있게 만들어줌



```javascript
$('input').on('change', function() {
  // 이벤트 핸들러로 이름이 없는 함수가 들어가있는 경우
})
// 자바스크립트에서 함수 선언하기
// 자바스크립트 함수를 선언할 때에는 jquery 코드인 
// $(function() {}) 이전에 선언해주는 것이 통상적
1. function 함수명(매개변수) {} // 함수 선언식
// 선언하기 이전에도 사용할 수 있음
2. var 함수명 = function(매개변수) {} // 함수 표현식
// 선언하기 이전에 사용하면 undefined error 발생

1월 4일 실습 내용(힌트)
var email = false;
var password = false;
1. function validation() {}
// email과 password가 모두 true인지 확인
// 모두 true이면 button의 disabled를 삭제
// 하나라도 틀리면 button의 disabled를 추가

2. 우리가 만들어 놓은 on('change')의 결과로는 변수 email과
password를 true, 혹은 false 변경시킨 후에 함수 validation()을 실행 시킴

// ajax 안씁니다. 
```

