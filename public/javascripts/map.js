// code for handling map on pages#home
document.observe("dom:loaded", function() {
  initMap();
  $("find_address").onclick = codeAddress;
});

var map;
var marker;
var geocoder;

// initialize map on page
function initMap() {
  geocoder = new google.maps.Geocoder();
  var latlng = new google.maps.LatLng(47.690454, -122.355949);
  var myOptions = {
    zoom: 16,
    center: latlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map"),
    myOptions);
  marker = new google.maps.Marker({
    map: map, 
    position: latlng
  });
}

// turn user-given address into lat/lng and re-center map
function codeAddress() {
  var address = $("address").value;
  if ($("address").value == "")
    alert("There is no address entered!");
  else {
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        marker.setMap(map); // change marker location

        // display overlays of nearby food
        showNearbyFood(results[0].geometry.location.lat(), results[0].geometry.location.lng());
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  }
}

// given a center latitude and longitude,
// will add overlays of food from nearby restaurants onto map
// todo: right now, just returns data about all restaurants in database
function showNearbyFood(centerLat, centerLng) {
  var maxFoodOverlays = 10; // have a max of 10 overlays on the map at any one time
  // todo: make sure to remove previous overlays which are no longer within range
  $("address").disabled = true; // disable search while searching
  $("find_address").disabled = true;

  // search for restaurants that are within range
  // of the given address
  var req = new Ajax.Request("/get_nearby_food_pictures", {
    method: "get",
    parameters: { lat: centerLat, lng: centerLng },
    onComplete: function(returnData) {
      var results = returnData.responseText;
      if (returnData.responseText == "")
        alert("There are no nearby restaurants in the database");
      else {
        var restaurants = eval("(" + results + ")");
        var numRestaurants = restaurants.length;

        alert(results);

        for (i = 0; i < numRestaurants; i++) {
          // for every restaurant,
          //  obtain the most popular menu item
          //  display the image as a small overlay on the map
          //  does this mean we also need to use paperclip to make a map_overlay thumbnail of pictures?
          //    or, we could just resize the pictures to save space
        }
      }
    }
  });

  $("address").disabled = false; // enable searching again
  $("find_address").disabled = false;
}
