$(document).ready(function() {
  // == $(function() {})
  // var tr = document.getElementsByClassName('board')
  $('.board').click(function() {
    location.href = '/boards/' + $(this).data('id');
  })
})
// 1. tr에 해당하는 html element을 찾는다.
// 2. html element에 click 이벤트 리스너를 달아준다.
// for(var i=0; i<tr.length; i++) {
  // tr[i].onclick = function() {
    // 3. 이벤트 핸들러에서는 해당 html element가 가지고 있는 속성을 꺼낸다.
    // console.dir(this);
    // var id = this.getAttribute('data-id');
    // 4. 해당 속성 값으로 url을 만들어서 페이지를 이동한다.
//     location.href = '/boards/' + id;
//   }
// }
