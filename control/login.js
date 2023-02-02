// const params = Object.fromEntries(new URLSearchParams(location.search));

function OnLoad(){
	return;
	// if (params.access){
	// 	try{
	// 		var data = JSON.parse(atob(params.access));
	// 		Login(data.username, data.password);
	// 	} catch{
	// 		console.log("unable to login with credentials: "+params.access);
	// 	}
	// }
	// console.log(md5("123"));
}
function Login(user, password) {
	console.log(user);
	if (!user){
		user = $("#user").val();
		password = $("#password").val();
		password = md5(password);
	}
	console.log(password);
	var success;
	$.ajax({ type: "POST", url: `/api/login`, dataType: 'json',
		async: false, contentType: 'application/json',
		data: JSON.stringify({user, password}),
		success: function (response){
			sessionStorage.setItem('user', $("#user").val());
			// alert(sessionStorage.getItem('user'));
			success = response;
	}});

	if (success) window.open("new_user", "_self");
	else{
		$("#error").show();
		setTimeout(x => $("#error").hide(), 3000);
	}
}
function Login_key(){

	if (event.keyCode == 13) {
		console.log("Enter key is pressed");
		print ('hello')
		return true;
	 } else {
		return false;
	 }
}
$(document).ready(function() {
	$(window).keydown(function(event){
	  if(event.keyCode == 13) {
		event.preventDefault();
		Login(null,null);
		return false;
	  }
	});
  });

