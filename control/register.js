
function OnLoad(){
	$("#success").hide();
	// $.ajax({ type: "GET", url: `/api/articles?user=${"user1"}`, dataType: 'json',
	// 	async: false, contentType: 'application/json',
	// 	success: function (response){

	// 		user = response;
	// }});

	// if (user){
	// 	for (var [i, article] of user.articles.entries()){
	// 		var element = $(articleTemplate.replace("#TITLE#", article.title).
	// 			replace("#PERCENT#", article.percent));
	// 		element.data("index", i);
	// 		$("#articles").append(element);
	// 	}
	// }
}

function Register(){
	if (!$("#user").val() || !$("#email").val() || !$("#password").val() || !$("#password-confirm").val()){
		$("#error").text("All fields are required").show();
		setTimeout(x => $("#error").hide(), 5000);
		return;
	}
	else if ($("#password").val() != $("#password-confirm").val()){
		$("#error").text("Passwords don't match").show();
		setTimeout(x => $("#error").hide(), 5000);
		return;
	}

	var response;
	$.ajax({ type: "POST", url: "/api/register", dataType: 'json',
		async: false, contentType: 'application/json',
		data: JSON.stringify({
			user: $("#user").val(),
			email: $("#email").val(),
			password: md5($("#password").val())
		}),
		success: function(x){
			response = x;
	}});

	if (response === true){
		$("#form").hide();
		$("#success").show();
	}
	else{
		$("#error").text(response).show();
		setTimeout(x => $("#error").hide(), 5000);
	}
}