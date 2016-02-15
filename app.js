var express = require("express");
var app = express();
var sqlite3 = require('sqlite3').verbose();
var db = new sqlite3.Database('forum.db');
var fs = require('fs');
var ejs = require('ejs');
var marked = require('marked');


var bodyParser = require('body-parser');
var urlencodedBodyParser = bodyParser.urlencoded({extended: false});
app.use(urlencodedBodyParser);
var methodOverride = require('method-override');
app.use(methodOverride('_method'));
app.use(express.static('public'));
app.set("view engine", "ejs")



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

app.post("/thread", function(req, res) {
	db.get("SELECT b_count FROM boards WHERE id=?",
		req.body.id,
		function(err, rows) {
			if (err) {
				console.log(err);
			} else {
				db.run("INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (?, ?, ?, ?, ?, ?)",
					req.body.id,
					req.body.user,
					req.body.sub,
					req.body.bod,
					req.body.img,
					(parseInt(rows.b_count) + 1),
					function(err) {
						if(err) {
							console.log(err);
						} else {
							res.redirect("/catalog/" + req.body.id);
						}
					});
			}
		});
});

app.post("/post", function(req, res) {
	db.get("SELECT b_count FROM boards WHERE id=?",
		req.body.b_id,
		function(err, rows) {
			if(err) {
				console.log(err);
			} else {
				console.log(parseInt(rows.b_count));
				db.run("UPDATE threads SET t_order=? WHERE id=?",
					(parseInt(rows.b_count) + 1),
					req.body.id,
					function(err) {
						if(err) {
							console.log(err);
						}
					});
				db.run("UPDATE boards SET b_count=? WHERE id=?",
					(parseInt(rows.b_count) + 1),
					req.body.b_id,
					function(err) {
						if(err) {
							console.log(err);
						}
					});
				db.run("INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (?, ?, ?, ?, ?, ?)",
					req.body.id,
					req.body.user,
					req.body.sub,
					req.body.bod,
					req.body.img,
					"null",
					function(err) {
						if(err) {
							console.log(err);
						} else {
							res.redirect("/thread/" + req.body.id);
						}
					});
			}
		});
	
});

var port = process.env.PORT ||  3000

app.listen(port, function(){
 console.log("Listening on port 3000")
})