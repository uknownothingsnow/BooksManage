$(function(){
  var target = location.pathname.split('/')[2]
  $('.admin-nav li#' + target).addClass('active')
})
