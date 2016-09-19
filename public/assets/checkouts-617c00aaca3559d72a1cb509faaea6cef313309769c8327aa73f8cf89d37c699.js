$(document).ready(function() {
  $('.shipping-form').hide();

  $('#use_billing').click(function() {
    $('.shipping-form').toggle(300);
  });
});
