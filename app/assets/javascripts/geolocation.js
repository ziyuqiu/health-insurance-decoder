var handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'geolocation'} }, function(){
  // be aware chrome >= 50 requires https for geolocation to work
  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(displayOnMap);
});

function displayOnMap(position){
  var marker = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(marker);
};