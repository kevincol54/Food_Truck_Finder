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

  function getLocation(){

    {
      if (navigator.geolocation)

      {

        var options = {
            enableHighAccuracy: true,
            timeout: 5000,
            maximumAge: 0
        };

        navigator.geolocation.getCurrentPosition( success, error,options);
      }

      else

      { x.innerHTML= "Geolocation is not supported by this browser."; }
    }
  }

  function error(e) {

  console.log("error code:" + e.code + 'message: ' + e.message );

  }

  function success(position) {
    var  lat  = position.coords.latitude;
    var  lng =  position.coords.longitude;

    var  myLocation =   new google.maps.LatLng(lat, lng);

    var mapOptions = {
         center: new google.maps.LatLng(myLocation.lat(),myLocation.lng()),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);

    var marker = new google.maps.Marker({
        position: myLocation,
        map: map,
        title:"you are here"
    });

    var infowindow = new google.maps.InfoWindow({
        content: "You Are Here"
    });

    google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
    });

  }
  google.maps.event.addDomListener(window, 'load', getLocation() );
}




$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);
