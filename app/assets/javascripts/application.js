// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require rails-ujs
//= require turbolinks
//= require active_storage_drag_and_drop
//= require draggable
//= require_tree .

$(document).on('click', 'form .remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});

$(document).on('click', 'form .add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});


$(document).on("turbolinks:load", function() {

  new Draggable.Draggable(document.querySelectorAll('ul'), {
    draggable: 'li'
  })
  .on('drag:start', () => console.log('drag:start'))
  .on('drag:move',  () => console.log('drag:move'))
  .on('drag:stop',  () => console.log('drag:stop'));
});

document.addEventListener("turbolinks:load", function() {

  $("#items").sortable();

});
