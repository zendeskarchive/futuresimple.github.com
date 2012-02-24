$(function(){
  var containers = ['ruby', 'python', 'js']
  var index = Math.floor((Math.random() * containers.length))
  $('.' + containers[index]).show();
})