// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .
//= require bootstrap.min.js
var when_page_is_ready = function(){

  $("p.alert").fadeOut(2000)
  $("p.notice").fadeOut(2000)

  $("div.input.string.optional.user_company_name").hide();

  $("select#user_user_type").on('change', function(){
    
    if ( $(this).val() == 'Company' ) {
      $("div.input.string.optional.user_company_name").show();
    }
    else {
      $("div.input.string.optional.user_company_name").hide();
    } 
  })
}




$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);
