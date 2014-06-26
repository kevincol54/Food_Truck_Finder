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
//= require bootstrap.min.js
//= require underscore.min.js
//= require gmaps/google
//= require_tree .
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
  if ( a = 0, a < $(".geojson").length){
    var geojson = $(".geojson").val()
    var geo = $.parseJSON(geojson)
    console.log(geo)

    function getLocation(){
      navigator.geolocation.getCurrentPosition(success, error,options);
      {
        if (navigator.geolocation)
        {
          var options = {
            enableHighAccuracy: true,
            timeout: 5000,
            maximumAge: 0
          };
          // navigator.geolocation.getCurrentPosition(success, error,options);
        }
        else
        { x.innerHTML = "Geolocation is not supported by this browser."; }
      }
    }

    function error(e) {
      console.log("error code:" + e.code + 'message: ' + e.message );
    }

    function success(position) {
      var lat = position.coords.latitude;
      var lng =  position.coords.longitude;

      var myLocation = new google.maps.LatLng(lat, lng);
      console.log("maybe", myLocation )

      var mapOptions = {
        center: new google.maps.LatLng(myLocation.lat(),myLocation.lng()),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };

      var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

      var infowindow = new google.maps.InfoWindow({
        maxWidth: 150
      });


      for (var i = 0; i < geo.length; i++) {
        console.log(geo[i].location[0])
        console.log(geo[i].location[1])
        var name = geo[i].properties[0];
        var address = geo[i].properties[1];
        var content = name + "<br>" + address;

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(geo[i].location[1], geo[i].location[0]),
          map: map,
          title: (geo[i].properties[0]),
          html: content
        });

        
        google.maps.event.addListener(marker, 'click', function(){
            infowindow.setContent(this.html);
            infowindow.open(map, this);
        }); 
      }
      
      var myMarker = new google.maps.Marker({
        position: myLocation,
        map: map,
        icon: 'http://maps.google.com/mapfiles/ms/icons/green-dot.png',
        title: "You Are Here"
      })
    }  

    google.maps.event.addDomListener(window, 'load', getLocation() );
  }

  console.log("hi kevin")
  $(document.body).on("click", ".openclosed", function(){
    console.log("foodtruck")
    $.ajax({
      type: "PATCH",
      url: $(this).attr("foodtruck_url"),
      dataType: "script"
    })
  })
}





$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);
