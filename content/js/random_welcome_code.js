$(function(){
  var technologies = $('.welcome div')
  var index = Math.floor((Math.random() * technologies.length - 1 ))
  $(technologies.get(index)).show();
})