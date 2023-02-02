const context = document.querySelector("#articles");
const instance = new Mark(context);

var articles = [];
var articlesLater = [];
var recordings = [];
var videos = [];
const params = Object.fromEntries(new URLSearchParams(location.search));
const SERVER_URL = "http://127.0.0.1:8080";

var hotlink = true;

var articleTemplate = `
	<li onclick="SelectArticle(this)">
		<a class="nav-link text-white article">
			<span class="bi bi-newspaper bi-space"></span>
			<span class="title">#TITLE#</span>
		</a>
	</li>
`;
var articleTemplate2 = `
	<li onclick="LoadRightPanel(this, '#TYPE#', #INDEX#);">
		<div class="nav-link text-white article">
			<p><span class="title">#TITLE#</span></p>
			<p><span class="date-saved">#DATE#</span></p>
			<p><a href="#HREF#" target="_blank" onclick="event.stopPropagation();">#URL#</a></p>
			<p class="article-desc"><span>#DESC#</span></p>
		</div>
	</li>
`;
var audioTemplate = `
	<span><label>#TITLE#</label></span><br>
	<span><label>#DESC#</label></span><br>
	<span><a href="#HREF#" target="_blank" onclick="event.stopPropagation();">#URL#</a></span><br>
	<span><label>#DATE#</label></span><br>
	<br>
	<audio controls src="#SRC#"></audio>
	<hr>
`;
var videoTemplate = `
	<span><label><b>#TITLE#</b></label></span><br>
	<span><label>#DESC#</label></span><br>
	<span><label class="video-date">#DATE#</label></span><br>
	<br>
	<video controls src="#SRC#"></video>
	<hr>
`;

var selectedArticle;
var editDescription = false;
var tags = [];

function OnLoad(){
	GetArticles();
}

function GetArticlesDebug() {
	articles = [
		
		{title: "Odesa 2. Máj 2014- Memento fašizmu : NazorObcana.sk", date: "01/01/2000", url: "www.nazorobcana.sk", description: "PRED ROKOM SA ODOHRALA V ODESE TRAGÉDIA. ZABUDNÚŤ NA ŇU BY ZNAMENALO REZIGNOVAŤ NA ĽUDSKOSŤ. VŠETCI, KTORÍ ODMIETAME BYŤ ĽAHOSTAJNÍ K TOMU, ČO SA STALO 2.MÁJA 2014, NEMÔŽEME MLČAŤ, UŽ AJ KVÔLI ĽUĎOM, KTORÍ SA SVETSKEJ SPRAVODLIVOSTI NEDOČKALI."},
		{title: "title2", date: "01/01/2000", url: "www.url2.com", description: "description 2"}];
	articlesLater = [{title: "title1-later", url: "www.url1.com", description: "description 1"},
		{title: "title2-later", url: "www.url2.com", description: "description 2"}];

	recordings = [
		{title: "recording1", description: "description1", date: "01/01/2022", url: "www.example1.com", source: "source1.wav"},
		{title: "recording2", description: "description2", date: "02/02/2022", url: "www.example1.com", source: "source2.wav"},
		{title: "recording3", description: "description3", date: "03/03/2022", url: "www.example3.com", source: "source3.wav"},
		{title: "recording4", description: "description4", date: "04/04/2022", url: "www.example4.com", source: "source4.wav"},
		{title: "recording5", description: "description5", date: "05/05/2022", url: "www.example5.com", source: "source5.wav"},
	]

	videos = [
		{title: "video1", description: "description1", date: "01/01/2022", url: "www.example1.com", source: "videos/video.mp4"},
		{title: "video2", description: "description2", date: "02/01/2022", url: "www.example2.com", source: "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"},
		{title: "video3", description: "description3", date: "03/01/2022", url: "www.example3.com", source: "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"}
	]
	
	LoadLeftPanel("articles");

}

function GetHostname(url){
	var a = document.createElement('a');
	a.href = url;
	return a.hostname;
}

function LoadLeftPanel(type){
	$("#articles").html("");
	var list = [];
	if (type === "articles") list = articles;		
	else if (type === "later") list = articlesLater;		
	else if (type === "audio") list = [...new Map(recordings.map(item => [item.url, item])).values()];
	else if (type === "video") list = videos;		
	else return;

	for (var [i, article] of list.entries()){
		// url
		// $("#url").text(GetHostname(list[i].url));
		// $("#url").attr("href", list[i].url);
		if (type === "video"){
			var element = $(articleTemplate2.replace("#TITLE#", article.title)
			.replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
			.replace("#TYPE#", type)
			.replace("#INDEX#", i)
			.replace("#DESC#", article.description));
		} else {
			var element = $(articleTemplate2.replace("#TITLE#", GetHostname(article.url))
			.replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
			.replaceAll("#URL#", article.url).replace("#HREF#", article.url)
			.replace("#TYPE#", type)
			.replace("#INDEX#", i)
			.replace("#DESC#", article.description));
		}

		if (type === "video") element.find("a").parent().remove();
		element.data("index", i);
		element.data("data", article);
		$("#articles").append(element);
	}

	$(".article").first().parent().click();
	// $("#sort").val("default");
}

function LoadRightPanel(element, type, index){
	var data = $(element).data("data");
	if (type === "audio"){
		$("#content-audio").html("");
		if (recordings.length > 0){
			for (var recording of recordings){
				if (recording.url !== data.url) continue;
				$("#content-audio").append(audioTemplate.
					replace("#TITLE#", recording.title).
					replace("#DESC#", recording.description).
					replace("#DATE#", recording.date.replace("T", " ").replace(".000Z", "")).
					replace("#URL#", recording.url).
					replace("#HREF#", recording.url).
					replace("#SRC#", `${recording.source}`));
			}
		}
	}
	else if (type === "video"){
		$("#content-video").html("");
		if (videos.length > 0){
			var video = videos[index];
			$("#content-video").append(videoTemplate.
				replace("#TITLE#", video.title).
				replace("#DESC#", video.description).
				replace("#DATE#", video.date.replace("T", " ").replace(".000Z", "")).
				replace("#SRC#", `${SERVER_URL}/video?file=${video.source}`));
		}
	}
	else {
		var i = $(element).data("index");
		selectedArticle = articles[i];
		$("#title").text(articles[i].title);
		var date = new Date(articles[i].date);
		$("#date").text(`Saved on ${date.toDateString()}`);
		// url
		var a = document.createElement('a');
		a.href = articles[i].url;
		$("#url").text(a.hostname);
		$("#url").attr("href", articles[i].url);
		$("#description").val(articles[i].description);

		// selections
		$.ajax({ type: "POST", url: "/api/selections", dataType: "json",
			async: false, contentType: 'application/json',
			data: JSON.stringify({url: articles[i].url}),
			success: function(selections){
				if (selections){
					$("#selection-tags").html("");
					for (var selection of selections){
						var words = selection.split(" ");
						var text = "";
						for (var word of words){
							if (text.length + word.length <= 20)
								text += ` ${word}`;
							else{
								text += " ...";
								break;
							}
						}
						$("#selection-tags").append(`<div class="tag" onclick="AddTag('${text}', '${selection}')">${text}</div>`);
					}
				}
			},
			error: function(error){}
		});

		$("#capture").attr("src", `${articles[i].user}/${articles[i].capture}.jpg`);
	}
}

function UpdateArticleList(articlesList){
	$("#articles").html("");

	for (var [i, article] of articlesList.entries()){
		// url
		var a = document.createElement('a');
		a.href = articlesList[i].url;
		$("#url").text(a.hostname);
		$("#url").attr("href", articlesList[i].url);

		var element = $(articleTemplate2.replace("#TITLE#", article.title)
			.replace("#DATE#", article.date).replace("#URL#", article.url).replace("#HREF#", article.url)
			.replace("#DESC#", article.description));
		element.data("index", i);
		$("#articles").append(element);
	}
	SelectArticle($(".article").first().parent());
	$("#sort").val("default");
}

function GetArticles(tags=false, search=false){
	var items = [];
	var url = "/api/articles";
	if (tags){
		url = "/api/articles-by-tags";
		$("#selection-tags-filter").find(".tag").each(function(){
			items.push($(this).data("selection"));
		});
		if (items.length === 0) return;
	}

	else if (search){
		url = "/api/articles-by-search";
		items = $("#search").val();
	}

	if (items.length > 0)
		$("#sidebar-title").text(`< Clear`);

	$.ajax({ type: "POST", url, dataType: "json",
		async: true, contentType: 'application/json',
		data: JSON.stringify({items}),
		success: function(x){	
			articles = x.articles;
			articlesLater = x.articlesLater;
			recordings = x.recordings;
			videos = x.videos;
			// UpdateArticleList(articles);
			LoadLeftPanel("articles");

			instance.mark(items);

			if (params.open 
				){
				$(".article a").each(function(index){
					if ($(this).text() === params.open){
						$(this).parent().parent().parent().click();
					}
				});
				hotlink = false;
			}
		},
		always: function(){
			console.log("always");
			
		}
	});
}

function AddTag(text, selection){
	$("#selection-tags-filter").append(`<div class="tag" data-selection="${selection}" onclick="RemoveTag(this)">${text}</div>`);
	$("#search").val("");
	$("#search").hide();
	$("#btn-search").hide();
	GetArticles(tags=true);
}

function RemoveTag(tag){
	$(tag).remove();
	if ($("#selection-tags-filter").find(".tag").length === 0){
		GetArticles();
		ResetSidebar();
	} else{
		GetArticles(tags=true);
	}
}

function Title_OnClick(){
	ResetSidebar();
	GetArticles();
}

function ResetSidebar(){
	$("#selection-tags-filter").find(".tag").remove();
	$("#sidebar-title").text(`Articles`);
	$("#search").val("");
	$("#search").show();
	$("#btn-search").show();
}

function CloseModal(){
	$(".modal").modal("hide");
}

function SelectArticle(article){
	// $(".article").removeClass("active");
	// $(article).find("a").addClass("active");
	var i = $(article).data("index");
	selectedArticle = articles[i];
	$("#title").text(articles[i].title);
	var date = new Date(articles[i].date);
	$("#date").text(`Saved on ${date.toDateString()}`);
	// url
	var a = document.createElement('a');
	a.href = articles[i].url;
	$("#url").text(a.hostname);
	$("#url").attr("href", articles[i].url);

	$("#description").val(articles[i].description);

	// selections
	$.ajax({ type: "POST", url: "/api/selections", dataType: "json",
		async: false, contentType: 'application/json',
		data: JSON.stringify({url: articles[i].url}),
		success: function(selections){
			if (selections){
				$("#selection-tags").html("");
				for (var selection of selections){
					var words = selection.split(" ");
					var text = "";
					for (var word of words){
						if (text.length + word.length <= 20)
							text += ` ${word}`;
						else{
							text += " ...";
							break;
						}
					}
					$("#selection-tags").append(`<div class="tag" onclick="AddTag('${text}', '${selection}')">${text}</div>`);
				}
			}
		},
		error: function(error){}
	});

	$("#capture").attr("src", `${articles[i].user}/${articles[i].capture}.jpg`);
}

function Sort(){
	$("#articles").html("");
	if ($("#sort").val() === "date-asc")
		articles.sort(function(a, b){
			return new Date(a.date) - new Date(b.date);
		});
	else if ($("#sort").val() === "date-desc")
		articles.sort(function(a, b){
			return new Date(b.date) - new Date(a.date);
		});
	else if ($("#sort").val() === "name-asc")
		articles.sort(function(a, b){
			if (a.title < b.title) return -1;
			if (a.title > b.title) return 1;
			return 0;
		});
	else if ($("#sort").val() === "name-desc")
		articles.sort(function(a, b){
			if (a.title < b.title) return 1;
			if (a.title > b.title) return -1;
			return 0;
		});
	else if ($("#sort").val() === "percent-asc")
		articles.sort(function(a, b){
			if (a.percentage < b.percentage) return 1;
			if (a.percentage > b.percentage) return -1;
			return 0;
		});
	else if ($("#sort").val() === "percent-desc")
		articles.sort(function(a, b){
			if (a.percentage < b.percentage) return -1;
			if (a.percentage > b.percentage) return 1;
			return 0;
		});

	for (var [i, article] of articles.entries()){
		var element = $(articleTemplate.replace("#TITLE#", article.title).
			replace("#PERCENT#", article.percentage));
		element.data("index", i);
		$("#articles").append(element);
	}
}

function Logout(){
	$.ajax({ type: "POST", url: "/api/logout", dataType: "json",
		async: false, contentType: 'application/json',
		data: JSON.stringify({}),
		success: function(x){
			window.open("/login", "_self");
		},
		error: function(error){}
	});
}

function EditDescription(event){
	if ($("#btn-description").text() === "Save"){
		$.ajax({ type: "POST", url: "/api/edit-description", dataType: "json",
			async: false, contentType: 'application/json',
			data: JSON.stringify({id: selectedArticle.id, description: $("#description").val()}),
			success: function(x){},
			error: function(error){}
		});
		CancelEditDescription();
	}
	else{
		$("#description").attr("readonly", false);
		$("#description").select();
		$("#btn-description").text("Save");
		$("#btn-description-cancel").show();
	}
}

function CancelEditDescription(){
	$("#description").attr("readonly", true);
	$("#btn-description-cancel").hide();
	$("#btn-description").text("Edit Description");
	document.getSelection().removeAllRanges();
}

function DeleteArticle(){
	$.ajax({ type: "POST", url: "/api/delete-article", dataType: "json",
		async: false, contentType: 'application/json',
		data: JSON.stringify({id: selectedArticle.id})
	});
	UpdateArticleList();
	$(".modal").modal("hide");
}

function SelectTab(tab){
	$(".tab").removeClass("selected");
	$(tab).addClass("selected");
	if (tab.id === "tab-saved"){
		$("#sort, #content").hide();
		$("#sidebar").css("width", "100%");
		$("#search-bar-content").show();
		$("#content-audio").hide();
		$("#content-video").hide();
		UpdateArticleList(articlesLater);
		
	}
	else if (tab.id === "tab-captured"){
		$("#sort, #content, #search-bar-content").show();
		$("#sidebar").css("width", "50%");
		$("#content").show();
		$("#content-audio").hide();
		$("#content-video").hide();
		UpdateArticleList(articles);
		console.log(articles);
	}
	else if (tab.id === "tab-audio"){
		// $("#search-bar-content").hide();
		$("#sidebar").css("width", "50%");
		$("#content").hide();
		$("#content-audio").show();
		$("#content-video").hide();
		LoadLeftPanel("audio");
	}
	else if (tab.id === "tab-video"){
		$("#sidebar").css("width", "50%");
		$("#content").hide();
		$("#content-video").show();
		$("#content-audio").hide();
		LoadLeftPanel("video");
	}
}

function Search(){
	var query = $("#search").val();
	$("#btn-search").attr("disabled", true);
	$("#btn-search").attr('style', 'cursor: wait !important');
	GetArticles(tags=false, search=true);
	$("#btn-search").attr("disabled", false);
	$("#btn-search").css("cursor", "pointer");
}

function handleLiveSearch() {
	Search();
}

function OpenImgPopup() {
	$("#img-popup").attr("src", $("#capture").attr("src"));
	$("#img-popup-container").show();
}
function CloseImgPopup(){
	window.scrollTo(0, 0);
	$("#img-popup-container").hide();
}