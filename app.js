var express = require("express");
var app = express();
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('forum.db');
var fs = require('fs');
var ejs = require('ejs');


var bodyParser = require('body-parser');
var urlencodedBodyParser = bodyParser.urlencoded({extended: false});
app.use(urlencodedBodyParser);
var methodOverride = require('method-override');
app.use(methodOverride('_method'));
app.use(express.static('public'));

app.get("/", function(req, res) {
	db.all("SELECT * FROM boards", function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			var html = fs.readFileSync("./index.html", "utf8");
			var rend = ejs.render(html, {boards: rows});
			res.send(rend);
		}
	});	
});

app.get("/catalog/:id", function(req, res) {
	db.all("SELECT * FROM threads WHERE board_id=? ORDER BY t_order DESC",
		req.params.id,
		function(err, rows) {
		if (err) {
			console.log(err);
		} else {
			var html = fs.readFileSync("./catalog.html", "utf8");
			var rend = ejs.render(html, {threads: rows});
			res.send(rend);
		}
	})
});

app.get("/thread/:id", function(req, res) {
	db.get("SELECT * FROM threads WHERE id=?",
		req.params.id,
		function(err, rods) {
			if (err) {
				console.log(err);
			} else {
					db.all("SELECT * FROM posts WHERE thread_id=?",
					req.params.id,
					function(err, rows) {
					if (err) {
						console.log(err);
					} else {
						var html = fs.readFileSync("./thread.html", "utf8");
						var rend = ejs.render(html, {thread: rods, posts: rows});
						res.send(rend);
					}
				});
			}
		});	
});

app.listen(3000, function() {
  console.log("I'm listening!");
});