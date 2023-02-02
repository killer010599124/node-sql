
let arrow = document.querySelectorAll(".arrow");

for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
   arrowParent.classList.toggle("showMenu");
    });
  }

  let sidebar = document.querySelector(".sidebar");

  sidebar.onmouseover=function(){
    sidebar.classList.remove('close');
  }
  sidebar.onmouseout=function(){
    sidebar.classList.add('close');
  } 

  var articleTemplate = `
	<li onclick="LoadRightPanel(this, '#TYPE#', '#INDEX#');">
      <div class="search-result">
      <div class="top">
        <div class="left">
          <h2>#TITLE#</h2>
        </div>
        <div class="right">
          <p>#DATE#</p>
        </div>
      </div>
      <div class="middle">
        <span>#DESC#</span>
      </div>
      <div class="bottom">
        <div class="left">
          <a href="#">
          <p>#URL#</p>
          </a>
        </div>
        <div class="right">
          <p></p>
        </div>
      </div>
    </div>
	</li>
`;
var articleTemplate2 =  `
    <li onclick="LoadRightPanel(this, '#TYPE#', '#INDEX#');">
        <div class="search-result">
        <div class="top">
          <div class="left">
            <h2>#TITLE#</h2>
          </div>
          <div class="right">
            <p>#DATE#</p>
          </div>
        </div>
        <div class="middle">
          <span>#DESC#</span>
        </div>
        <div class="bottom">
          <div class="left">
            <a href="#">
            <p>>#URL#</p>
            </a>
          </div>
          <div class="right">
            <p></p>
          </div>
        </div>
      </div>
    </li>
`;
var audioTemplate = `
<button id = "#ID#" title="Delete article" class="btn btn-danger btn-delete bi bi-file-earmark-x-fill"
          onclick="DeleteAudio(this)"></button>
	<span><label>#TITLE#</label></span><br>
	<span><label>#DESC#</label></span><br>
	<span><a href="#HREF#" target="_blank" onclick="event.stopPropagation();">#URL#</a></span><br>
	<span><label>#DATE#</label></span><br>
	<br>
	<audio controls src="#SRC#"></audio>
	<hr>
`;
var videoTemplate = `
  <button  title="Delete article" class="btn btn-danger btn-delete bi bi-file-earmark-x-fill"
          onclick="$('#modal-delete').modal('show')"></button>
  <hr>
  <hr>
          <p>
    <label>Description:</label>
    <button id="btn-description_v" class="btn btn-secondary btn-description" onclick="EditDescription()">Edit Description</button>
    <button id="btn-description-cancel_v" style ="display:none"  class="btn btn-secondary btn-description-cancel" onclick="CancelEditDescription()">Cancel</button>
    <br><br>
    <textarea id="description_v" class ="description" onblur="" readonly>#DESC#</textarea>
  </p>
    <hr>
	<span><label><b>#TITLE#</b></label></span><br>
	
	<span><label class="video-date">#DATE#</label></span><br>
	<br>
	<video controls src="#SRC#"></video>
	<hr>
`;

  const params = Object.fromEntries(new URLSearchParams(location.search));
  const SERVER_URL = "http://127.0.0.1:8080";
  const context = document.querySelector("#articles");
  const instance = new Mark(context);
  var hotlink = true;
  var text = [];
  var checktext = [];
  var audio = [];
  var videos = [];
  var all = [];
  var selectedArticle;
  var selectedVideo;
  var selectedAudio;
  var deleteAudioId;
  var deleteAudioUrl;
  var deleteAudio;
  var selectedFeature;
  var flag = false;
  var category = '';

  function OnLoad(){
    $("#loadgif").hide();
    $("#content").hide();
    $("#pdf_show").hide();
    // upload_hide();
    flag = false;
    $("#profile").text(sessionStorage.getItem('user'));
    console.log(sessionStorage.getItem('user'));
    category = 'text';
    selectedFeature = 'text';
    GetArticles();
  }

  function selectTab(sidetab){

    if (sidetab.id === "checktext"){
      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#checktext_i').addClass("active");
      jQuery('#checktext_s').addClass("active");
      // $('#all_i').css({'color':'#ffffff'});
      // $('#audio_i').css({'color':'#ffffff'});
      // $('#text_i').css({'color':'#ffffff'});
      // $('#checktext_i').css({'color':'#f0a500'});
      // $('#video_i').css({'color':'#ffffff'});
      // $('#topic_i').css({'color':'#ffffff'});

      category = 'checktext';
      $("#sort, #content").hide();
      // $("#sidebar").css("width", "100%");
       $("#search-bar-content").show();
      $("#content-audio").hide();
      $("#content-video").hide();
      GetArticles();
      UpdateArticleList(checktext);
      console.log('checktext');
    }
    else if (sidetab.id === "all"){
      category = 'all';
      
      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#all_i').addClass("active");
      jQuery('#all_s').addClass("active");
      // $('#all_i').css({'color':'#f0a500'});
      // $('#audio_i').css({'color':'#ffffff'});
      // $('#text_i').css({'color':'#ffffff'});
      // $('#checktext_i').css({'color':'#ffffff'});
      // $('#video_i').css({'color':'#ffffff'});
      // $('#topic_i').css({'color':'#ffffff'});

      $("#sort,  #search-bar-content").show();
      // $("#sidebar").css("width", "50%");
      $("#content").hide();
      $("#content-audio").hide();
      $("#content-video").hide();
      GetArticles();
      LoadLeftPanel("all");
      console.log('all');
      console.log(all);
    }
    else if (sidetab.id === "text"){

      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#text_i').addClass("active");
      jQuery('#text_s').addClass("active");
      // $('#all_i').css({'color':'#ffffff'});
      // $('#audio_i').css({'color':'#ffffff'});
      // $('#text_i').css({'color':'#f0a500'});
      // $('#checktext_i').css({'color':'#ffffff'});
      // $('#video_i').css({'color':'#ffffff'});
      // $('#topic_i').css({'color':'#ffffff'});

      category = 'text';
      $("#sort, #search-bar-content").show();
      // $("#sidebar").css("width", "50%");
      $("#content").hide();
      $("#content-audio").hide();
      $("#content-video").hide();
      GetArticles();
      UpdateArticleList(text);
      console.log('text');
      console.log(text);
    }
    else if (sidetab.id === "audio"){

      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#audio_i').addClass("active");
      jQuery('#audio_s').addClass("active");
      // $('#all_i').css({'color':'#ffffff'});
      // $('#audio_i').css({'color':'#f0a500'});
      // $('#text_i').css({'color':'#ffffff'});
      // $('#checktext_i').css({'color':'#ffffff'});
      // $('#video_i').css({'color':'#ffffff'});
      // $('#topic_i').css({'color':'#ffffff'});

      category = 'audio';
      $("#search-bar-content").hide();
      // $("#sidebar").css("width", "50%");
      $("#content").hide();
      $("#content-audio").hide();
      $("#content-video").hide();
      GetArticles();
      LoadLeftPanel("audio");
      console.log('audio');
      console.log(audio);
    }
    else if (sidetab.id === "video"){

      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#video_i').addClass("active");
      jQuery('#video_s').addClass("active");
      // $("#sidebar").css("width", "50%");

      // $('#all_i').css({'color':'#ffffff'});
      // $('#audio_i').css({'color':'#ffffff'});
      // $('#text_i').css({'color':'#ffffff'});
      // $('#checktext_i').css({'color':'#ffffff'});
      // $('#video_i').css({'color':'#f0a500'});
      // $('#topic_i').css({'color':'#ffffff'});

      category = 'video';
      $("#content").hide();
      $("#content-video").hide();
      $("#content-audio").hide();
      GetArticles();
      LoadLeftPanel("video");
      console.log(videos)
      console.log('video');
    }
    else if (sidetab.id === "topic"){
      jQuery('ul li i').removeClass("active");
      jQuery('ul li span').removeClass("active");
      jQuery('#topic_i').addClass("active");
      jQuery('#topic_s').addClass("active");
      // $("#sidebar").css("width", "50%");

      // $('#all_i').css({'color':'#ffffff'});
      // $('#audio_i').css({'color':'#ffffff'});
      // $('#text_i').css({'color':'#ffffff'});
      // $('#checktext_i').css({'color':'#ffffff'});
      // $('#video_i').css({'color':'#ffffff'});
      // $('#topic_i').css({'color':'#f0a500'});

     
    }
  }

  function Sort(){
    var temp = text;
    switch(category){
      case 'checktext':
        temp = checktext;
        break;
      case 'text':
        temp = text;
        break;
      case 'audio':
        temp = audio;
        break;
      case 'video':
        temp = videos;
        break;
      default:
        break;
    }
    console.log(temp);
    $("#articles").html("");
    if ($("#sort").val() === "NewestDate")
      temp.sort(function(a, b){
        return new Date(a.date) - new Date(b.date);
      });
    else if ($("#sort").val() === "OldestDate")
      temp.sort(function(a, b){
        return new Date(b.date) - new Date(a.date);
      });
    else if ($("#sort").val() === "AZtitle")
      temp.sort(function(a, b){
        if (a.title < b.title) return -1;
        if (a.title > b.title) return 1;
        return 0;
      });
    else if ($("#sort").val() === "ZAtitle")
      temp.sort(function(a, b){
        if (a.title < b.title) return 1;
        if (a.title > b.title) return -1;
        return 0;
      });
    else if ($("#sort").val() === "AZurl")
      temp.sort(function(a, b){
        if (a.url < b.url) return -1;
        if (a.url > b.url) return 1;
        return 0;
      });
    else if ($("#sort").val() === "ZAurl")
      temp.sort(function(a, b){
        if (a.url < b.url) return 1;
        if (a.url > b.url) return -1;
        return 0;
      });
    else if ($("#sort").val() === "NewestUpload")
      temp.sort(function(a, b){
        return new Date(a.pageDate) - new Date(b.pageDate);
      });
    else if ($("#sort").val() === "OldestUpload")
      temp.sort(function(a, b){
        return new Date(b.pageDate) - new Date(a.pageDate);
      });
  
    for (var [i, article] of temp.entries()){
      // var element = $(articleTemplate2.replace("#TITLE#", article.title).
      //   replace("#PERCENT#", article.percentage));
      var element = $(articleTemplate.replace("#TITLE#", article.title)
        .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
        .replaceAll("#URL#", article.url).replace("#HREF#", article.url)
        .replace("#INDEX#", i)
        .replace("#DESC#", article.description));
      element.data("index", i);
      $("#articles").append(element);
    }
  }

  function GetHostname(url){
    var a = document.createElement('a');
    a.href = url;
    a.hostname = a.hostname.replace('www.','');
    return a.hostname;
  }
  function LoadLeftPanel(type){
    $("#articles").html("");
    var list = [];
    if (type === "articles") list = text;		
    else if (type === "later") list = checktext;		
    else if (type === "audio") list = [...new Map(audio.map(item => [item.url, item])).values()];
    else if (type === "video") list = videos;		
    else if (type === "all") {

        for (var [i, article] of text.entries()){
            var element = $(articleTemplate.replace("#TITLE#", article.title)
            .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
            .replaceAll("#URL#", GetHostname(article.url)).replace("#HREF#", article.url)
            .replace("#TYPE#", "text")
            .replace("#INDEX#", i)
            .replace("#DESC#", article.description));      
         
          element.data("index", i);
          element.data("data", article);
          $("#articles").append(element);
        }
        list = [...new Map(audio.map(item => [item.url, item])).values()];
        for (var [i, article] of list.entries()){

          var element = $(articleTemplate.replace("#TITLE#", article.title)
            .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
            .replaceAll("#URL#", GetHostname(article.url)).replace("#HREF#", article.url)
            .replace("#TYPE#", "audio")
            .replace("#INDEX#", i)
            .replace("#DESC#", article.description));   

          element.data("index", i);
          element.data("data", article);
          $("#articles").append(element);
        }     
        for (var [i, article] of videos.entries()){

          var element = $(articleTemplate2.replace("#TITLE#", article.title)
          .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
          .replace("#TYPE#", "video")
          .replace("#INDEX#", i)
          .replace("#DESC#", article.description));
          // if (type === "video") element.find("a").parent().remove();
          element.find("a").parent().remove();
          element.data("index", i);
          element.data("data", article);
          $("#articles").append(element);
        }  
      $(".article").first().parent().click();
      
      return;
    }
    else return;
  
    for (var [i, article] of list.entries()){
      
      if (type === "video"){
        var element = $(articleTemplate2.replace("#TITLE#", article.title)
        .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
        .replace("#TYPE#", type)
        .replace("#INDEX#", i)
        .replace("#DESC#", article.description));
      } else {
        var element = $(articleTemplate.replace("#TITLE#", article.title)
        .replace("#DATE#", article.date.replace("T", " ").replace(".000Z", ""))
        .replaceAll("#URL#", GetHostname(article.url)).replace("#HREF#", article.url)
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
  
  }
  function LoadRightPanel(element, type, index){

    // $("#capture").attr("src", "https://cssauthor.com/wp-content/uploads/2018/06/Bouncy-Preloader.gif");
    $("#loadgif").show();
    
    var data = $(element).data("data");
    deleteAudioUrl = data.url;
    console.log(data);
    if (type === "audio"){
      deleteAudio = element;
      

      selectedFeature = 'audio';
      $("#content-audio").html("");
      $("#content").hide();
      $("#content-audio").show();
      $("#content-video").hide();
      if (audio.length > 0){
        var cnt = 0;
        // console.log(audio);
        // selectedAudio = audio;
        for (var recording of audio){
          if (recording.url !== data.url) continue;
         
          $("#content-audio").append(audioTemplate.
            replace("#ID#" , recording.id).
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
      selectedFeature = 'video';
      $("#content-video").html("");
      $("#content").hide();
      $("#content-video").show();
      $("#content-audio").hide();
      
      if (videos.length > 0){
        var video = videos[index];
        selectedVideo = video;
        
        
        
        $("#content-video").append(videoTemplate.
          replace("#TITLE#", video.title).
          replace("#DESC#", video.description).
          replace("#DATE#", video.date.replace("T", " ").replace(".000Z", "")).
          replace("#SRC#", `${SERVER_URL}/video?file=${video.source}`));
        // var a = document.createElement('a');
        // a.href = video.url;
        // $("#url").text(a.href);
        // $("#description").val(video.description);
      }
    }
    else {
      selectedFeature = 'text';
      $("#content").show();
      $("#content-audio").hide();
      $("#content-video").hide();
      
      var i = $(element).data("index");
      selectedArticle = text[i];
      $("#title").text(text[i].title);
      var date = new Date(text[i].date);
      // $("#date").text(`Saved on ${date.toDateString()}`);
      // url
      var a = document.createElement('a');
      a.href = text[i].url;
      $("#url").text(a.href);
      $("#url").attr("href", text[i].url);
      $("#description").val(text[i].description);
  
      // selections
      // $.ajax({ type: "POST", url: "/api/selections", dataType: "json",
      //   async: false, contentType: 'application/json',
      //   data: JSON.stringify({url: text[i].url}), 
      //   success: function(selections){
      //     if (selections){
      //       $("#selection-tags").html("");
      //       for (var selection of selections){
      //         var words = selection.split(" ");
      //         var txt = "";
      //         for (var word of words){
      //           if (txt.length + word.length <= 20)
      //             txt += ` ${word}`;
      //           else{
      //             txt += " ...";
      //             break;
      //           }
      //         }
      //         $("#selection-tags").append(`<div class="tag" onclick="AddTag('${txt}', '${selection}')">${txt}</div>`);
      //       }
      //     }
      //   },
      //   error: function(error){}
      // });
      
     
      
      // $("#img_container").html("<img id='capture' onclick='OpenImgPopup()' onLoad = 'loadImage()'></div>");
      if(text[i].capture.split('.')[1] == 'pdf'){
        $("#pdf_show").show();
        $("#pdf_show").attr("src", `${text[i].user}/${text[i].capture.split('.')[0]}.pdf`);
        $("#capture").hide();
        $("#loadgif").hide();
      }
      else{
        
        $("#capture").attr("src", `${text[i].user}/${text[i].capture.split('.')[0]}.jpg`);
        $("#pdf_show").hide();
      }
      
      // req.file.filename.split('.')[0]
  }
}

  function GetArticles(tags=false, search=false){
    // console.log('started');
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
        text = x.articles;
        checktext = x.articlesLater;
        audio = x.recordings;
        videos = x.videos;
        console.log(audio);
        if(flag){
          flag = false;
          $("#content-audio").html("");
          for (var recording of audio){
            if (recording.url !== deleteAudioUrl) continue;
           
            $("#content-audio").append(audioTemplate.
              replace("#ID#" , recording.id).
              replace("#TITLE#", recording.title).
              replace("#DESC#", recording.description).
              replace("#DATE#", recording.date.replace("T", " ").replace(".000Z", "")).
              replace("#URL#", recording.url).
              replace("#HREF#", recording.url).
              replace("#SRC#", `${recording.source}`));
          }

        }
        // all.append(text);all.append(audio);all.append(videos);
        
        // UpdateArticleList(text);
        // LoadLeftPanel("articles");
        switch(category){
          case 'checktext':
            UpdateArticleList(checktext);
            break;
          case 'text':
            LoadLeftPanel("articles");
            break;
          case 'audio':
            LoadLeftPanel("audio");
            break;
          case 'video':
            LoadLeftPanel("video");
            break;
          default:
            break;
        }

        instance.mark(items);
  
        if (params.open && hotlink){
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
    // $("#sort").val("default");
  }
  function loadImage(){
    $("#loadgif").hide();
    $("#capture").show();
  }
  function SelectArticle(article){
  
    // $(".article").removeClass("active");
    // $(article).find("a").addClass("active");
    var i = $(article).data("index");
    selectedArticle = text[i];
    console.log(text);
    $("#title").text(text[i].title);
    var date = new Date(text[i].date);
    $("#date").text(`Saved on ${date.toDateString()}`);
    // url
    var a = document.createElement('a');
    a.href = text[i].url;
    $("#url").text(a.hostname);
    $("#url").attr("href", text[i].url);
  
    $("#description").val(text[i].description);
  
    // selections
    // $.ajax({ type: "POST", url: "/api/selections", dataType: "json",
    //   async: false, contentType: 'application/json',
    //   data: JSON.stringify({url: text[i].url}),
    //   success: function(selections){
    //     if (selections){
    //       $("#selection-tags").html("");
    //       for (var selection of selections){
    //         var words = selection.split(" ");
    //         var txt = "";
    //         for (var word of words){
    //           if (txt.length + word.length <= 20)
    //             txt += ` ${word}`;
    //           else{
    //             txt += " ...";
    //             break;
    //           }
    //         }
    //         $("#selection-tags").append(`<div class="tag" onclick="AddTag('${txt}', '${selection}')">${txt}</div>`);
    //       }
    //     }
    //   },
    //   error: function(error){}
    // });
    
    // $(".se-pre-con").fadeIn('fast');
    // $("#img_container").html("<img id='capture' onclick='OpenImgPopup()' onLoad = 'loadImage()' ></div>");
    
    $("#capture").attr("src", `${text[i].user}/${text[i].capture}.jpg`);
    
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
    if(selectedFeature == 'text'){
      if ($("#btn-description").text() === "Save"){
        $.ajax({ type: "POST", url: "/api/edit-description", dataType: "json",
          async: false, contentType: 'application/json',
          data: JSON.stringify({id: selectedArticle.id, description: $("#description").val()}),
          success: function(x){
            GetArticles();
          },
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
    else if(selectedFeature == 'video'){
      if ($("#btn-description_v").text() === "Save"){
        $.ajax({ type: "POST", url: "/api/video_edit-description", dataType: "json",
          async: false, contentType: 'application/json',
          data: JSON.stringify({id: selectedVideo.id, description: $("#description_v").val()}),
          success: function(x){
            GetArticles();
          },
          error: function(error){}
        });
        CancelEditDescription();
      }
      else {
        console.log('enable description')
        $("#description_v").attr("readonly", false);
        $("#description_v").select();
        $("#btn-description_v").text("Save");
        $("#btn-description-cancel_v").show();
      }
    }
    
  }
  function CancelEditDescription(){
    if(selectedFeature == 'text'){
      $("#description").attr("readonly", true);
      $("#btn-description-cancel").hide();
      $("#btn-description").text("Edit Description");
    }
    else if(selectedFeature == 'video'){
      $("#description_v").attr("readonly", true);
      $("#btn-description-cancel_v").hide();
      $("#btn-description_v").text("Edit Description");
    }
    document.getSelection().removeAllRanges();
  }
  function OpenImgPopup() {
    $("#img-popup").attr("src", $("#capture").attr("src"));
    $("#img-popup-container").show();
  }
  function CloseImgPopup(){
    window.scrollTo(0, 0);
    $("#img-popup-container").hide();
  }
  function DeleteArticle(){
    if(selectedFeature == 'text'){
      console.log(selectedArticle.id);
      $.ajax({ type: "POST", url: "/api/delete-article", dataType: "json",
        async: false, contentType: 'application/json',
        data: JSON.stringify({id: selectedArticle.id})
      });
    }
    else if(selectedFeature == 'video'){
      console.log(selectedVideo.id);
      $.ajax({ type: "POST", url: "/api/delete-video", dataType: "json",
        async: false, contentType: 'application/json',
        data: JSON.stringify({id: selectedVideo.id})
      });
    }
    else if(selectedFeature = 'audio'){
      // ​alert(deleteAudioId);
      console.log(deleteAudioId);
      console.log(deleteAudioUrl);
      $.ajax({ type: "POST", url: "/api/delete-audio", dataType: "json",
        async: false, contentType: 'application/json',
        data: JSON.stringify({id: deleteAudioId}),
        success: function(x){	
          flag = true;
        }
      });
      
    }
    
    GetArticles();
    
    $(".modal").modal("hide");
  }
  function DeleteAudio(element){
    // alert(id);
    deleteAudioId = element.id;
    
    $('#modal-delete').modal('show');
  }
  function CloseModal(){
    $(".modal").modal("hide");
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
  function ResetSidebar(){
    $("#selection-tags-filter").find(".tag").remove();
    $("#sidebar-title").text(`Articles`);
    $("#search").val("");
    $("#search").show();
    $("#btn-search").show();
  }
  function upload_hide(){
    $("#upload_content").hide();
    $("#topic_modal").hide();
  }
  function upload_show(){
    $("#upload_content").show();
  }
  function category_select(){

      fileElement = document.getElementById('fileupload');
      let file = fileElement.files[0];
      console.log(file);
      $("#filename").text(file.name);
      if(file.type == "video/mp4" || file.type == "video/webm"){
          
          $("#feature_category").text("Uploading to Category: Video");
          
      }
      else if(file.type == "image/jpeg" || file.type == "application/pdf"){
        $("#feature_category").text("Uploading to Category: Article");
          
      }
      else if(file.type == "audio/wav" || file.type == "audio/mpeg" ){
        $("#feature_category").text("Uploading to Category: Audio");
          
      }
      else{
        return;
      }
  }
  function topic_Modal(){
    $("#topic_modal").show();
  }
  function topic_add(){

  }
  function topic_create(){

  }
  function checkEmpty(){
    // if($("#upload_url").val() == ""){
    //   alert("Input url");
    //   return;
    // }
    if($("#upload_title").val() == ""){
      alert("Input title");
      return;
    }
    else if($("#descriptionn").val() == ""){
      alert("Input description");
      return;
    }

    // else if($("#createDate").val() == ""){
    //   alert("Input date");
    //   return;
    // }
    else {
      return true;
    }
  }
  async function uploadFile() {
      //creating form data object and append file into that form data
      fileElement = document.getElementById('fileupload');
    if (fileElement.files.length === 0) {
      alert('please choose a file');
      return;
    }
    if(checkEmpty()){
        var type = "";
        var user = sessionStorage.getItem('user');
        let file = fileElement.files[0];
        let formData = new FormData();
        console.log(file);
    
        formData.set('file', file);
        formData.set('url',$("#upload_url").val());
        formData.set('recordings',"");
        formData.set('title',$("#upload_title").val());
        formData.set('description',$("#descriptionn").val());
        formData.set('user',user);
        if($("#createDate").val() == ""){
          formData.set('date',"2022-10-01");
          formData.set('pageDate',"2022-10-01");
          
        }
        else{
          
          formData.set('date',$("#createDate").val());
          formData.set('pageDate',$("#createDate").val());
          console.log($("#createDate").val());
        }
        
        
        if(file.type == "video/mp4" || file.type == "video/webm"){
            
            $("#feature_category").text("Uploading to Category: Video");
            type = "/video";
        }
        else if(file.type == "image/jpeg" || file.type == "application/pdf"){
          $("#feature_category").text("Uploading to Category: Article");
            type = "/upload_Article";
        }
        else if(file.type == "audio/wav" || file.type == "audio/mpeg"){
          $("#feature_category").text("Uploading to Category: Audio");
            type = "/audio";
        }
        else{
          return;
        }
    
        // formData.set('type',type);
      
        axios.post(type, formData, {
          onUploadProgress: progressEvent => {
            const percentCompleted = Math.round(
              (progressEvent.loaded * 100) / progressEvent.total
            );
            $("#progress__text").text(`upload process: ${percentCompleted}%`);
            $("#progress__fill").attr("style", `width : ${percentCompleted}%;`);
            console.log(`upload process: ${percentCompleted}%`);
          }
        })
          .then(res => {
              // $.ajax({ type: "POST", "", dataType: "json",
              //   async: true, contentType: 'application/json',
              //   data: JSON.stringify({items}),
              //   success: function(x){	
              //   },
              //   always: function(){
              //     console.log("always");
              //   }
              // });
            GetArticles();
            upload_hide();
            $("#upload_url").val("");
            $("#upload_title").val("");
            $("#descriptionn").val("");
            $("#createDate").val("");
            $("#progress__text").text(`upload process:0%`);
            $("#progress__fill").attr("style", `width : 0%;`);
            $("#fileupload").val("");
            alert("File upload successfully!");
            console.log(res.data)
            console.log(res.data.url)
          })
    }
    
  }