// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("./todo-components/TodoApp");

global.toastr = require("toastr")
toastr.options = {
  "debug": false,
  "positionClass": "toast-top-full-width",
  "onclick": null,
  "fadeIn": 300,
  "fadeOut": 1000,
  "timeOut": 5000,
  "extendedTimeOut": 1000
}
import "../stylesheets/application";


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import 'bootstrap'
import "../stylesheets/application";

//$(document).ready(function(){
//$('.dropdown').hover(function(){
//   $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(300);
//}, function(){
//  $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut(300);
//});
//);

document.addEventListener("turbolinks:load", () => {
  $('.dropdown').hover(function(){
    $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn(300);
  }, function(){
    $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut(300);
  });
})
