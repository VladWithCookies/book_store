//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  $('.shipping-form').hide();

  $('#use_billing').click(function() {
    $('.shipping-form').toggle(300);
  });
});