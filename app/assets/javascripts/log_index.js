// Get all elements with class = typeName and toggle visibility
function toggleLog(typeName) {
    var i, tabcontent;
    tabcontent = document.getElementsByClassName(typeName);
    for (i = 0; i < tabcontent.length; i++) {
	if (tabcontent[i].style.display != "block") {
	    tabcontent[i].style.display = "block";
	} else if (tabcontent[i].style.display != "none") {
	    tabcontent[i].style.display = "none";
	}
    }
}

// Opens browser printer dialogue when user clicks on the printer icon in the Log History menu.
function printSymptomsData(){
    var divToPrint=document.getElementById("printSymptomsTable");
    newWin= window.open("");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
}

// Opens browser printer dialogue when user clicks on the printer icon in the Log History menu.
function printVisitsData(){
    var divToPrint=document.getElementById("printVisitsTable");
    newWin= window.open("");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
}

function executeSymptomSearch() {
    console.log("Search field changed.");
    var s= document.getElementById("search_symptoms").value;
    console.log(s);
    var params = {
	symptom_name: s,
    }
    $.ajax({
	url: "/update_logs",
	type: "POST",
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
	data: params
    });
}
