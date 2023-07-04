function IDValidation(user_id) {
	  let regex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+$/;
	  
	  if (regex.test(user_id)){
	    $("#wrongID").hide();
	    return true;
	  } else {
	    $("#wrongID").show();
	  	return false;
	  }
	}
	
function PWValidation(user_pw) {
	  let regex = /^[a-zA-Z0-9]{4,20}$/;
	  
	  if (regex.test(user_pw)){
	    $("#wrongPW").hide();
	    return true;
	  } else {
	    $("#wrongPW").show();
	    return false;
	  }
	}
	