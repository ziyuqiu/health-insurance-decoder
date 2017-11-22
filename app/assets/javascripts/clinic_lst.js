function createSidebarLi(json){
  return ("<li><a>" + json.name + "</a></li>");
};

function bindLiToMarker($li, marker){
  $li.on('click', function(){
    handler.getMap().setZoom(14);
    marker.setMap(handler.getMap()); //because clusterer removes map property from marker
    marker.panTo();
    google.maps.event.trigger(marker.getServiceObject(), 'click');
  })
};

function createSidebar(json_array){
	$('#sidebar_container').empty();

  _.each(json_array, function(json){
    var $li = $( createSidebarLi(json) );
    $li.appendTo('#sidebar_container');
    bindLiToMarker($li, json.marker);
  });
};

function draw(clinicType){
	handler = Gmaps.build('Google');
	if (clinicType == "urgent"){
		var json_array = [
	    { 	lat: 42.3692639, 
	    	lng: -71.249348, 
	    	name: 'Newton Wellesley Hospital Waltham Urgent Care Center',
	    	infowindow: "<h4>Newton Wellesley Hospital<br /> Waltham Urgent Care Center</h4><strong> Location: </strong> <br />Located in the Children Hospital Building <br /> 9 Hope Ave. <br /> Waltham, Mass. 02453 <br /> <strong>Contact: </strong><br />(617) 243-5981 <br /> <strong>Walk-In Hours: </strong><br /><i>Monday through Saturday </i><br /> 9 a.m. to 7 p.m. <br /> <i>Sunday </i><br /> 9 a.m. to 2 p.m. <br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" },
	    { 	lat: 42.375749, 
	    	lng: -71.252918, 
	    	name: 'American Family Care', 
	    	infowindow: "<h4>AFC(American Family Care)</h4><strong> Location: </strong> <br />1030 Main Street <br /> Waltham, MA 02451 <br /> <strong>Contact: </strong><br />(781) 894-6900 <br /> <strong>Walk-In Hours: </strong><br /><i>Daily </i><br /> 8 a.m. to  8 p.m.<br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" }
	  	];
	} else if (clinicType == "non-urgent"){
		var json_array = [
	    { 	lat: 42.31809, 
	    	lng: -71.2112, 
	    	name: 'CVS (Newton)',
	    	infowindow: "<h4>CVS Minute Clinics</h4><strong>Location: </strong> <br />978 Boylston St <br /> Newton, MA <br /> <strong>Contact: </strong><br />1-866-389-2727 <br /> <strong>Hours: </strong><br /><i>Monday through Friday </i><br/>8a.m. to 7 p.m. (closed 1-2 p.m.)<br/><i>Saturday</i><br/>9 a.m. -5:30 p.m. (closed 1-1:30 p.m.) <br /><i>Sunday </i> <br />10 a.m. -5:30 p.m.(closed 1-1:30 p.m.)<br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" },
	    { 	lat: 42.390021, 
	    	lng: -71.143590, 
	    	name: 'CVS (Cambridge)',
	    	infowindow: "<h4>CVS Minute Clinics</h4><strong>Location: </strong> <br />211 Alewife Brook Pkwy <br /> Cambridge, MA <br /> <strong>Contact: </strong><br />1-866-389-2727 <br /> <strong>Hours: </strong><br /><i>Monday through Friday </i><br/>8a.m. to 7 p.m. (closed 1-2 p.m.)<br/><i>Saturday</i><br/>9 a.m. -5:30 p.m. (closed 1-1:30 p.m.) <br /><i>Sunday </i> <br />10 a.m. -5:30 p.m.(closed 1-1:30 p.m.)<br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" },
	    { 	lat: 42.3704661, 
	    	lng: -71.076222, 
	    	name: 'CVS (Cambridge)',
	    	infowindow: "<h4>CVS Minute Clinics</h4><strong>Location: </strong> <br />36 White Street <br /> Cambridge, MA <br /> <strong>Contact: </strong><br />1-866-389-2727 <br /> <strong>Hours: </strong><br /><i>Monday through Friday </i><br/>8a.m. to 7 p.m. (closed 1-2 p.m.)<br/><i>Saturday</i><br/>9 a.m. -5:30 p.m. (closed 1-1:30 p.m.) <br /><i>Sunday </i> <br />10 a.m. -5:30 p.m.(closed 1-1:30 p.m.)<br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" },
	    { 	lat: 42.41910, 
	    	lng: -71.11219, 
	    	name: 'CVS (Medford)',
	    	infowindow: "<h4>CVS Minute Clinics</h4><strong>Location: </strong> <br />85 High Street <br /> Medford, MA <br /> <strong>Contact: </strong><br />1-866-389-2727 <br /> <strong>Hours: </strong><br /><i>Monday through Friday </i><br/>8a.m. to 7 p.m. (closed 1-2 p.m.)<br/><i>Saturday</i><br/>9 a.m. -5:30 p.m. (closed 1-1:30 p.m.) <br /><i>Sunday </i> <br />10 a.m. -5:30 p.m.(closed 1-1:30 p.m.)<br /> <strong> Note: </strong> <br />Bring your insurance information. <br />" }
	  ];
	}





	handler.buildMap({ internal: {id: 'sidebar_builder'}}, function(){

	  var markers = handler.addMarkers(json_array);

	  _.each(json_array, function(json, index){
	    json.marker = markers[index];
	  });

	  
	  createSidebar(json_array);
	  handler.bounds.extendWith(markers);
	  handler.fitMapToBounds();
	});
}

// var urgent_markers = draw("urgent");
// var non-urgent_markers = draw("non-urgent");

	function switchContent(evt, typeName) {

    // Declare all variables
    var i, tabcontent2, tablinks2;

    // Get all elements with class="tabcontent2" and hide them
    tabcontent2 = document.getElementsByClassName("tabcontent2");
    for (i = 0; i < tabcontent2.length; i++) {
        tabcontent2[i].style.display = "none";
    }

    // Get all elements with class="tablinks2" and remove the class "active"
    tablinks2 = document.getElementsByClassName("tablinks2");
    for (i = 0; i < tablinks2.length; i++) {
        tablinks2[i].className = tablinks2[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(typeName).style.display = "block";
    evt.currentTarget.className += " active";
    draw(typeName);

}

