//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.barrating.min.js
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .

alert('asd')
$(document).ready(function() {
  $('.shipping-form').hide();

  $('#use_billing').click(function() {
    $('.shipping-form').toggle(300);
  });
});