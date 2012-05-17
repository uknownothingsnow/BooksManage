$(function(){
  var target = location.pathname.split('/')[2]
  $('.admin-nav li#' + target).addClass('active')
  
  $('.like').click(function(){
    var link = $(this)
    $.ajax({
      url: '/books/'+link.attr('id')+'/like',
      success: function(data){
        link.hide()
        alert('成功添加')
      }
    })
    return false
  })

})
