
function PWValidation() {
	  let user_pw = document.loginForm.user_pw.value;
	  let regex = /^[a-zA-Z0-9]{4,20}$/;
	  
	  if (regex.test(user_pw)){
	    $("#wrongPW").hide();
	    return true;
	  } else {
	    $("#wrongPW").show();
	    return false;
	  }
	}
	