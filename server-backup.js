const http = require('http');
const url = require('url');
const fs = require("fs");
const express = require('express');
var bodyParser = require('body-parser');
var multer  = require('multer');
var upload = multer({limits: { fileSize: 20000000, fieldSize: 20000000 }}); // 20mb
const basicAuth = require('express-basic-auth');
var mysql = require('mysql');
var MySql = require('sync-mysql');

const server = express();
server.use(express.static(__dirname));
server.use(express.json());
server.use(bodyParser.json());

// mysql
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


// basic auth
var auth = basicAuth({ users: GetUsers(), challenge: true});
server.use(function(req, res, next) {
	auth(req, res, next);
});
setInterval(function(){
	auth = basicAuth({ users: GetUsers(), challenge: true});
}, 60000);

// server.use(basicAuth({
// 	users: GetUsers(),
// 	challenge: true
// }));

// uploads
server.use(upload.array());
const  hostname = '127.0.0.1';
// const hostname = '92.240.237.148';
const port = 8000;

// connection.query("SELECT user, password FROM tbl_users", function(err, rows, fields){
// 		for (var row of rows)
// 			console.log(row.user);
// 	});

async function login() {
	return new Promise(function (resolve, reject) {
		var sql = `SELECT user, password FROM tbl_users`;
		mysqlConnection.query(sql, function(err, result){
			if (!err)	resolve(result);
			else resolve({error: true});
		});
	});
}
function GetUsers(){
	var rows = mysqlConnection.query('SELECT user, password FROM tbl_users');
	var users = {};
	for (row of rows)
		users[row.user] = row.password;
	return users;
}

const GenerateUid = size => [...Array(size)].map(() => Math.floor(Math.random() * 16).toString(16)).join('');

//connection.end();
server.get('/api/login', function(req, res){
	res.end("true");
});

server.post('/api/upload', function(req, res){
	var body = req.body;
	var user = req.auth.user;
	var meta = JSON.parse(body.metadata);
	var selections = JSON.parse(body.selections);
	var connections = JSON.parse(body.connections);
	var code = Date.now();

	try{
		// selections
		for (var selection of selections)
			mysqlConnection.query(`INSERT INTO tbl_captures (user, url, selection, percentage, capture, title, description, date)
			VALUES ("${user}", "${meta.url}", "${selection.text}", "${selection.percentage}", "${code}", 
			"${meta.title}", "${meta.description}", "${meta.date}")`);
		// connections
		if (connections){
			for (var connection of connections)
				mysqlConnection.query(`INSERT INTO tbl_connections (user, text1, text2, percentage, capture)
				VALUES ("${user}", "${connection.text1}", "${connection.text2}", "${connection.percentage}", "${code}")`);
		}
		if (!fs.existsSync(`captures/${user}`)) fs.mkdirSync(`captures/${user}`);
		fs.writeFileSync(`captures/${user}/${code}.jpg`, body.capture.split(",")[1], 'base64');
	}
	catch (error) {
		fs.writeFileSync(`logs/error-${code}`, 
			`error:\n${error}\n\nmeta:\n${meta}\n\nselections:\n${selections}\n\nconnections:\n${connections}`);
		res.status(400).end("error");
		return;
	}
	res.end("ok");
});
server.post('/api/save-article', function(req, res){
	var body = req.body;
	var user = req.auth.user;
	var title = body.title;
	var url = body.url;
	var date = body.date;
	var description = body.description;

	try{
		mysqlConnection.query(`INSERT INTO tbl_articles (user, title, description, url, date)
			VALUES ("${user}", "${title}", "${description}", "${url}", "${date}")`);
	}
	catch (error) {
		fs.writeFileSync(`logs/error-${code}`, 
			`error:\n${error}\n\nmeta:\n${meta}\n\nselections:\n${selections}\n\nconnections:\n${connections}`);
		res.status(400).end("error");
		return;
	}
	res.end("ok");
});


server.listen(port, hostname, () => {
	console.log(`Server running at http://${hostname}:${port}/`);
});