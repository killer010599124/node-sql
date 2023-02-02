

const http = require('http');
const url = require('url');
const fs = require("fs");
const express = require('express');
var path = require('path');

var setDomain = require('express-set-domain');
// add middleware to force requests to orcascan.com

// mysql
var mysql = require('mysql');
var MySql = require('sync-mysql');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'testbranko'
});
// mysql sync
var mysqlConnection = new MySql({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'testbranko'
});

var multer  = require('multer');
var storage_v = multer.diskStorage({
	destination: function (req, file, cb){
		cb(null, 'videos/');
	},
	filename: function (req, file, cb){
		var filename = `${Date.now()}.mp4`;
		var body = req.body;
		
		// mysqlConnection.query(`INSERT INTO tbl_videos (user, title, description, date, filename) 
		// 	VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.date}", "${filename}")`);
		cb(null, file.originalname);
	}
});
var storage_a = multer.diskStorage({
	destination: function (req, file, cb){
		
		cb(null, 'recordings/');
	},
	filename: function (req, file, cb){
		var filename = `${Date.now()}.mp4`;
		var body = req.body;
		console.log(req.body.title);
		
		// mysqlConnection.query(`INSERT INTO tbl_videos (user, title, description, date, filename) 
		// 	VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.date}", "${filename}")`);
		cb(null, file.originalname);
	}
});
var storage_t = multer.diskStorage({
	destination: function (req, file, cb){
		cb(null, 'captures/danielstarek@yahoo.com/');
	},
	filename: function (req, file, cb){
		var filename = `${Date.now()}.mp4`;
		var body = req.body;
		
		// mysqlConnection.query(`INSERT INTO tbl_videos (user, title, description, date, filename) 
		// 	VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.date}", "${filename}")`);
		cb(null, file.originalname);
	}
});
var upload_v = multer({storage: storage_v, limits: { fileSize: 2000000000, fieldSize: 2000000000 }}); // 20mb
var upload_a = multer({storage: storage_a, limits: { fileSize: 2000000000, fieldSize: 2000000000 }});
var upload_t = multer({storage: storage_t, limits: { fileSize: 2000000000, fieldSize: 2000000000 }});
// var upload = multer();
const basicAuth = require('express-basic-auth');
var cookieParser = require("cookie-parser");
const server = express();



server.use(express.static("control"));
// server.use(express.static("videos"));
server.use(express.static("lib"));
server.use(express.static("captures"));
server.use(express.static("recordings"));
server.use(express.static("page"));
server.use(express.json({limit: '50mb'}));
// server.use(express.urlencoded({limit: '50mb'}));

const similarity = require("string-similarity");



// var hostname = '92.240.237.148';
var hostname = '127.0.0.1';
var port = 8080;

if (process.env.DEVELOPMENT){
	hostname = '127.0.0.1';
	port = 8000;
}



// var mysqlConnection = new MySql({
// 	host: 'localhost',
// 	user: 'root',
// 	password: '',
// 	database: "articles_db"
// });

// uploads
// server.use(upload.array());

//auth
const ENABLE_SESSIONS = true;
var sessions = [];
server.use(cookieParser());
// monitor session ids
setInterval(x => { sessions.forEach(function(session){
	var diff = Math.abs(Date.now() - session.createdAt);
	var minutes = Math.floor((diff/1000)/60);
		if(minutes >= 30){
			sessions.shift(); // remove first item
		}
})
}, 10000);
function IsValidSession(id)

{
	if (!ENABLE_SESSIONS) return true;
	if (!id) return false;
	var session = sessions.find(o => o.sessionId === id);
	return session == undefined? false : true;
}

function GenerateSessionID()
{
	return code = [...Array(12)].map(() => Math.floor(Math.random() * 16).toString(16)).join('');
}
// basic auth
function BasicAuth(){
	return basicAuth({ users: GetUsers2(), challenge: false});
	server.use(function(req, res, next) {
		auth(req, res, next);
	});
}
// end auth

function GetUsers2(){
	var rows = mysqlConnection.query('SELECT user, password FROM tbl_users');
	var users = [];
	var cnt = 0;
	for (row of rows){
		users[cnt] = row.user;
		cnt++;
	}
		// users[row.user] = row.password;
	return users;
}
function GetEmails2(){
	var rows = mysqlConnection.query('SELECT email FROM tbl_users');
	var emails = [];
	var cnt = 0;
	for (row of rows){
		emails[cnt] = row.email;
		cnt++;
	}
		// users[row.user] = row.password;
	return emails;
}
function GetUsers(){
	var users = mysqlConnection.query('SELECT user, password FROM tbl_users');
	return users;
}

function GetSelections(user, url){
	var selections = mysqlConnection.query(`SELECT * FROM tbl_selections WHERE user = "${user}" AND
		url = "${url}"`);
	return selections.map(x => x.selection);
}

const GenerateUid = size => [...Array(size)].map(() => Math.floor(Math.random() * 16).toString(16)).join('');

server.get("/", function(req, res){
	var credentials = req.query.access;
	if (IsValidSession(req.cookies.sessionId)) {
		return res.redirect('/new_user');
	}
	else{
		if (credentials) return res.redirect(`/login?access=${credentials}`);
		else return res.redirect(`/login`);
	}
});
server.get("/user", function(req, res){
	if (!IsValidSession(req.cookies.sessionId))	return res.redirect('/login');
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	res.sendFile(`/page/user.html`, {root: __dirname })
});
server.get("/register", function(req, res) {
	res.sendFile(`/page/register.html`, {root: __dirname })
});
server.get("/new_user", function(req, res) {
	if (!IsValidSession(req.cookies.sessionId))	return res.redirect('/login');
	res.sendFile(`/page/new_user.html`, {root: __dirname })
});
server.get("/login", function(req, res){
	res.sendFile(`page/login.html`, {root: __dirname })
});
server.get("/capture", function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	try{
		// if (req.query.capture === "default")
		res.sendFile(`captures/${session.user}/${req.query.capture}.jpg`, {root: __dirname });
	}
	catch{
		res.sendStatus(404);
	}
});

server.get("/audio", BasicAuth(),async function(req, res){
	var file = req.query.file;
	res.sendFile(__dirname, `/recordings/${file}`);
});

server.get('/video',BasicAuth(), function(req, res) {
	var path = `videos/${req.query.file}`;
	const stat = fs.statSync(path);
	const fileSize = stat.size;
	const head = {
	  'Content-Length': fileSize,
	  'Content-Type': 'video/mp4',
	};
	res.writeHead(200, head);
	fs.createReadStream(path).pipe(res)
})
server.post("/video", upload_v.single('file'), async function(req, res){
	
	console.log(req.file.filename);
	
	var body = req.body;
	// console.log(req.body.user);
	//var s = req.auth.user;
	mysqlConnection.query(`INSERT INTO tbl_videos (user, title, description, date, filename) 
			VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.date}", "${req.file.filename}")`);
	return res.end(JSON.stringify(true));
});
server.post("/audio", upload_a.single('file'), async function(req, res){
	
	var user = req.body.user;
	
	var title = req.body.title;
	var url = req.body.url;
	var description = req.body.description;
	var date = req.body.date;
	var pageDate = req.body.pageDate;
	

		mysqlConnection.query(`INSERT INTO tbl_recordings (user, title, url, description, date, pageDate, filename) 
			VALUES ("${user}", "${title}", "${url}", "${description}", "${date}", "${pageDate}", "${req.file.filename}")`);
		
	return res.send(JSON.stringify(true));
});
server.post("/upload_Article", upload_t.single('file'), async function(req, res){
	
	var body = req.body;
	var code = Date.now();

	var date = req.body.date;
	var pageDate = req.body.pageDate;

	

	mysqlConnection.query(`INSERT INTO tbl_articles (user, title, description, url, date, capture,pageDate)
	VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.url}", "${date}", "${req.file.filename}" ,"${pageDate}")`);

	return res.send(JSON.stringify(true));
});
server.post('/api/register', function(req, res){
	var data = req.body;
	var user = data.user? data.user : "";
	
	var password = data.password? data.password : "";
	var email = data.email? data.email : "";

	var users = GetUsers2();
	var emails = GetEmails2();
	
	console.log(emails)
	
	var userExists = users.find(x => x == user);
	// console.log(userExists);
	
	if (userExists){
		console.log('User already exits');
		res.end(JSON.stringify("User already exists"));
		return;
	}

	var emailExists = emails.find(x => x == email);

	if (emailExists){
		console.log(emailExists);
		res.end(JSON.stringify("Email already used for registration"));
		return;
	}

	try {
		mysqlConnection.query(`INSERT INTO tbl_users (user, password, email)	VALUES ("${user}", "${password}", "${email}")`);
	} 
	catch{
		res.end(JSON.stringify("Something went wrong"));
		return;
	}
	res.end(JSON.stringify(true));
});
server.post('/api/login', function(req, res){
	var data = req.body;
	var user = data.user? data.user : "";
	var password = data.password? data.password : "";
	var users = GetUsers();
	var user = users.find(x => x.user == user && x.password == password);
	if (user){
		if (req.cookies.sessionId){
			sessions = sessions.filter(function(x){
				return x.sessionId !== req.cookies.sessionId;
			});
		}
		var id = GenerateSessionID();
		sessions.push({user: user.user, createdAt: Date.now(), sessionId: id});
		res.writeHead(200, {
			"Set-Cookie": `sessionId=${id}; Max-Age=${30*60}; Path=/; HttpOnly`,
			"Access-Control-Allow-Credentials": "true"
		});
		res.end(JSON.stringify(true));
	}
	else res.end(JSON.stringify(false));
});
server.post('/api/logout', function(req, res){
	if (req.cookies.sessionId){
		sessions = sessions.filter(function(x){
			return x.sessionId !== req.cookies.sessionId;
		});
		res.end(JSON.stringify(true));
	}
	else res.end(JSON.stringify(false));
});
server.post('/api/selections', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	try{
		return res.end(JSON.stringify(GetSelections(session.user, req.body.url)));
	}
	catch{
		return res.end(JSON.stringify(false));
	}
});

server.post('/api/edit-description', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var body = req.body;
	try{
		var x = mysqlConnection.query(`UPDATE tbl_articles SET description = "${body.description}" 
			WHERE user = "${session.user}" AND id = ${body.id}`);
		return res.end(JSON.stringify(true));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/video_edit-description', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var body = req.body;
	try{
		var x = mysqlConnection.query(`UPDATE tbl_videos SET description = "${body.description}" 
			WHERE user = "${session.user}" AND id = ${body.id}`);
		return res.end(JSON.stringify(true));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/delete-article', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var body = req.body;
	try{
		var x = mysqlConnection.query(`DELETE FROM tbl_articles WHERE user = "${session.user}" AND id = ${body.id}`);
		return res.end(JSON.stringify(true));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/delete-video', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var body = req.body;
	try{
		var x = mysqlConnection.query(`DELETE FROM tbl_videos WHERE user = "${session.user}" AND id = ${body.id}`);
		return res.end(JSON.stringify(true));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/delete-audio', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var body = req.body;
	try{
		var x = mysqlConnection.query(`DELETE FROM tbl_recordings WHERE user = "${session.user}" AND id = ${body.id}`);
		return res.end(JSON.stringify(true));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});

function SimilarityRange(word){
	var min = word.length - 3;
	var max = word.length + 3;

	if (min < 0) min = word.length;
	if (word.length === 1){
		min = 1; max = 2;
	}
	else if (word.length === 2){
		min = 1; max = 3;
	}
	return {min, max};

}
function GetRecordings(user){
	var audios = mysqlConnection.query(`SELECT * FROM tbl_recordings WHERE user = "${user}"`);
	var recordings = [];
	for (var audio of audios){
		if (fs.existsSync(`recordings/${audio.filename}`))
			recordings.push({id:audio.id, user:audio.user, title: audio.title, description: audio.description, date: audio.date, pageDate: audio.pageDate, url: audio.url, source: audio.filename});
	}
	return recordings;
}
function GetVideos(user){
	var videos = mysqlConnection.query(`SELECT * FROM tbl_videos WHERE user = "${user}"`);
	var recordings = [];
	for (var video of videos){
		if (fs.existsSync(`videos/${video.filename}`))
			recordings.push({id: video.id, user:video.user, title: video.title, description: video.description, date: video.date, source: video.filename});
	}
	return recordings;
}

server.post('/api/articles', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var user = session.user;
	try{
		var articles = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE user = "${user}" AND 
			capture != "later"`);
		var articlesLater = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE user = "${user}" AND 
			capture = "later"`);
		var recordings = GetRecordings(user);
		var videos = GetVideos(user);
		
		return res.end(JSON.stringify({articles, articlesLater, recordings, videos}));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/articles-by-tags', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var user = session.user;
	var tags = req.body.items;

	try{
		var selections = [];
		for (var tag of tags){
			var range = SimilarityRange(tag);
			var candidates = mysqlConnection.query(`SELECT * FROM tbl_selections 
				WHERE user = "${user}" AND CHAR_LENGTH(selection) >= ${range.min} AND 
				CHAR_LENGTH(selection) <= ${range.max}`);
			for (var selection of candidates){
				if (similarity.compareTwoStrings(tag, selection.selection) >= 0.5){
					if (!selections.find(x => x.url === selection.url)){
						selections.push(selection);
					}
				}
			}
		}

		var urls = "";
		for (var selection of selections) urls += `"${selection.url}",`;
		urls = urls.replace(/(^,)|(,$)/g, "");

		var articles = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE user = "${user}" AND 
			url IN (${urls}) AND capture != "later"`);
		var articlesLater = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE user = "${user}" AND 
			capture = "later"`);
		var recordings = GetRecordings(user);
		var videos = GetVideos(user);
		return res.end(JSON.stringify({articles, articlesLater, recordings, videos}));
		
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});
server.post('/api/articles-by-search', function(req, res){
	if (!IsValidSession(req.cookies.sessionId)) return res.status(401).end();
	var session = sessions.find(o => o.sessionId === req.cookies.sessionId);
	var user = session.user;
	var keywords = req.body.items;
	
	try{
		var articles = [];
		if(keywords.length == 1 && keywords[0] == "") {
			var candidates = mysqlConnection.query(`SELECT * FROM tbl_articles 
			WHERE (user = "${user}" AND capture != "later")`);

			for (var article of candidates){
				if (!articles.find(x => x.url === article.url)){
					articles.push(article);
				}
			}
			
			var articlesLater = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE (user = "${user}" AND 
			capture = "later")`);
		}
		else {
			for (var keyword of keywords){
				if(keyword == "") continue;
				var range = SimilarityRange(keyword);
				
				var candidates = mysqlConnection.query(`SELECT * FROM tbl_articles 
					WHERE (user = "${user}" AND capture != "later") AND (title LIKE "%${keyword}%" OR description LIKE "%${keyword}%")`);
				
					for (var article of candidates){
						if (!articles.find(x => x.url === article.url)){
							articles.push(article);
						}
					}

				var articlesLater = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE (user = "${user}" AND 
				capture = "later") AND (title LIKE "%${keyword}%" OR description LIKE "%${keyword}%")`);
			}
		}

		

		var recordings = GetRecordings(user);
		var videos = GetVideos(user);
		return res.end(JSON.stringify({articles, articlesLater, recordings, videos}));
	}
	catch(error){
		console.log(error);
		return res.end(JSON.stringify(false));
	}
});

server.post("/api/upload-audio",  async function(req, res){
	var user = req.body.user;
	var recordings = req.file;
	var title = req.body.title;
	var url = req.body.url;
	var description = req.body.description;
	var date = req.body.date;
	var pageDate = req.body.pageDate;

	// for (var recording of recordings){
		var filename = `${Date.now()}.wav`;
		mysqlConnection.query(`INSERT INTO tbl_recordings (user, title, url, description, date, pageDate, filename) 
			VALUES ("${user}", "${title}", "${url}", "${description}", "${date}", "${pageDate}", "${req.file.filename}")`);
		fs.writeFileSync(`recordings/${filename}`, recordings.split(",")[1], 'base64');
		console.log(`audio ${filename} saved`);
	// }
	return res.send(JSON.stringify(true));
});
server.post("/api/upload-video", BasicAuth(),async function(req, res){
	var user = req.user;
	// var recordings = req.body.recordings;
	var title = req.body.title;
	var url = req.body.url;
	var description = req.body.description;
	var date = req.body.date;
	var pageDate = req.body.pageDate;
	console.log(title);
	for (var recording of req.body.file){
		var filename = `kkkk.wav`;
		mysqlConnection.query(`INSERT INTO tbl_recordings (user, title, url, description, date, pageDate, filename) 
			VALUES ("${user}", "${title}", "${url}", "${description}", "${date}", "${pageDate}", "${filename}")`);
		fs.writeFileSync(`recordings/${filename}`, recording.split(",")[1], 'base64');
		console.log(`audio ${filename} saved`);
	}
	return res.send(JSON.stringify(true));
});
// chrome extension
server.get('/api/extension-login', BasicAuth(), function(req, res){
	res.end(JSON.stringify(true));
});
function ArticleExists(user, url){
	var articles = mysqlConnection.query(`SELECT * FROM tbl_articles WHERE user = "${user}" AND url = "${url}"`);
	return articles.length > 0? true : false;
}

server.post('/api/upload',function(req, res){
	var body = req.body;
	// var user = req.auth.user;
	// var meta = body.metadata;
	// var selections = body.selections;
	// var connections =  body.connections;
	var code = Date.now();
	console.log(body);
	// var articleExists = ArticleExists(user, meta.url);
	try{
		// if (!articleExists){
			mysqlConnection.query(`INSERT INTO tbl_articles (user, title, description, url, date, capture,pageDate)
				VALUES ("${body.user}", "${body.title}", "${body.description}", "${body.url}", "${body.date}", "${req.file.filename}" ,"${body.pageDate}")`);
		// }
		// else{
		// 	mysqlConnection.query(`UPDATE tbl_articles SET capture = "${code}" WHERE
		// 	user = "${user}" AND url = "${meta.url}"`);
		// }

		// //selections
		// if (selections){

		// 	for (var selection of selections){
		// 		var x = mysqlConnection.query(`INSERT INTO tbl_selections (user, url, selection, percentage)
		// 		VALUES ("${user}", "${meta.url}", "${selection.text}", "${selection.percentage}")`);
		// 	}
		// }
		// // connections
		// if (connections){
		// 	for (var connection of connections)
		// 		mysqlConnection.query(`INSERT INTO tbl_connections (user, url, text1, text2)
		// 		VALUES ("${user}", "${meta.url}", "${connection.text1}", "${connection.text2}")`);
		// }
		if (!fs.existsSync(`captures/${user}`)) fs.mkdirSync(`captures/${user}`);
		fs.writeFileSync(`captures/${user}/${code}.jpg`, "body.capture.split(",")[1]", 'base64');
		console.log("done");
	}
	catch (error){
		console.log(error);
		// fs.writeFileSync(`logs/error-${code}`, 
		// 	`error:\n${error}\n\nmeta:\n${meta}\n\nselections:\n${selections}\n\nconnections:\n${connections}`);
		// res.status(400).end(error);
		return;
	}
	return res.send(JSON.stringify(true));
});
server.post('/api/save-article', BasicAuth(), function(req, res){
	var body = req.body;
	var user = req.auth.user;
	var title = body.title;
	var url = body.url;
	var date = body.date;
	var description = body.description;

	try{
		mysqlConnection.query(`INSERT INTO tbl_articles (user, title, description, url, date, capture)
			VALUES ("${user}", "${title}", "${description}", "${url}", "${date}", "later")`);
	}
	catch (error) {
		console.log(error);
		fs.writeFileSync(`logs/error-${code}`, 
			`error:\n${error}\n\nmeta:\n${meta}\n\nselections:\n${selections}\n\nconnections:\n${connections}`);
		res.status(400).end("error");
		return;
	}
	return res.send(JSON.stringify(true));
});

server.post("/api/article-exists", BasicAuth(), async function(req, res){
	var user = req.auth.user;
	var url = req.body.url;
	var exists = ArticleExists(user, url);
	console.log(exists);
	return res.send(JSON.stringify(exists));
});

server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});