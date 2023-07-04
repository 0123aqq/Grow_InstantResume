function IDValidation(userID) {
	  let regex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+$/;
	  
	  if (regex.test(userID)){
	    $("#wrongID").hide();
	    return true;
	  } else {
	    $("#wrongID").show();
	  	return false;
	  }
	}
	
function PWValidation(userPW) {
	  let regex = /^[a-zA-Z0-9]{4,20}$/;
	  
	  if (regex.test(userPW)){
	    $("#wrongPW").hide();
	    return true;
	  } else {
	    $("#wrongPW").show();
	    return false;
	  }
	}

function PWCheck() {
	let form = document.getElementById("checkPW").closest("form");
	let PWone = form.userPW.value;
	let PWtwo = form.checkPW.value;
	
	if (PWone != PWtwo) {
		$("#wrongPWCheck").show();
	} else {		
		$("#wrongPWCheck").hide();
	}
	
}