CREATE TABLE boards (
	id integer PRIMARY KEY AUTOINCREMENT,
	name varchar,
	image varchar
);

CREATE TABLE threads (
	id integer PRIMARY KEY AUTOINCREMENT,
	board_id integer,
	user_id integer,
	subject varchar,
	body varchar,
	image varchar,
	t_order integer
);


CREATE TABLE posts (
	id integer PRIMARY KEY AUTOINCREMENT,
	thread_id integer,
	user_id integer,
	subj varchar,
	bod varchar,
	image varchar,
	replied_to integer
);

CREATE TABLE users (
	id integer PRIMARY KEY AUTOINCREMENT,
	name varchar,
	email varchar,
	avatar varchar,
	flag varchar,
	loc varchar
);

INSERT INTO boards (name, image) VALUES ('music', 'fa fa-headphones');
INSERT INTO boards (name, image) VALUES ('television', 'fa fa-television');
INSERT INTO boards (name, image) VALUES ('technology', 'fa fa-code');
INSERT INTO boards (name, image) VALUES ('games', 'fa fa-gamepad');
INSERT INTO boards (name, image) VALUES ('literature', 'fa fa-book');
INSERT INTO boards (name, image) VALUES ('shitposting', 'fa fa-graduation-cap');


INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'ungghg', 'unf', 'x', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'Bloo', 'Bacon ipsum dolor amet drumstick beef t-bone ribeye shank flank pig ham hock strip steak doner capicola filet mignon fatback andouille ball tip. Pork belly alcatra chuck tri-tip. Tri-tip salami venison pancetta cow. Pork belly kevin sausage doner picanha swine ribeye bresaola bacon. Rump bacon ham, ham hock picanha leberkas tenderloin ground round tri-tip.', 'x', 2);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'Gragh', 'Harggggg', 'x', 3);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'No', 'wefwefwefwe', 'x', 4);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'Yes', 'sdvsdvsdvsdv', 'x', 5);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, 4, 'Ok', 'wefwefwefwefwefwefwef', 'x', 6);



INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (1, 2, 'nlah', 'haha fuck you!', '/', 3);
INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (1, 2, 'boop', 'memes', '/', 3);




