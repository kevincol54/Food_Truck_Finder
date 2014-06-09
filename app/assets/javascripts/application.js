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
//= require mapbox.js
//= require underscore.min.js
//= require gmaps/google
var when_page_is_ready = function(){

  $("p.alert").fadeOut(2000)
  $("p.notice").fadeOut(2000)

  // $("div.input.string.optional.user_company_name").hide();

  // $("select#user_user_type").on('change', function(){
    
  //   if ( $(this).val() == 'Company' ) {
  //     $("div.input.string.optional.user_company_name").show();
  //   }
  //   else {
  //     $("div.input.string.optional.user_company_name").hide();
  //   } 
  // })
}


handler = Gmaps.build('Google');
handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
  markers = handler.addMarkers([
    {
      "lat": 0,
      "lng": 0,
      "picture": {
        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width":  36,
        "height": 36
      },
      "infowindow": "hello!"
    }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
});



$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);
