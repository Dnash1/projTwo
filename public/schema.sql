CREATE TABLE boards (
	id integer PRIMARY KEY AUTOINCREMENT,
	name varchar,
	image varchar,
	b_count integer
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

INSERT INTO boards (name, image, b_count) VALUES ('music', 'fa fa-headphones', 1);
INSERT INTO boards (name, image, b_count) VALUES ('television', 'fa fa-television', 1);
INSERT INTO boards (name, image, b_count) VALUES ('technology', 'fa fa-code', 1);
INSERT INTO boards (name, image, b_count) VALUES ('games', 'fa fa-gamepad', 1);
INSERT INTO boards (name, image, b_count) VALUES ('literature', 'fa fa-book', 1);
INSERT INTO boards (name, image, b_count) VALUES ('shitposting', 'fa fa-graduation-cap', 1);


INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, "", 'Music stuff', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (2, "", 'TV sucks now :(', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (3, "", 'technology: is it good? or is it whack?', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (4, "", 'Games are the DEVIL', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (5, "", 'memes have replaced books', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (6, "", ':^)', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);
INSERT INTO threads (board_id, user_id, subject, body, image, t_order) VALUES (1, "", 'Wew lad', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit', '', 1);




INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (1, 2, 'nlah', 'haha fuck you!', '/', 3);
INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (1, 2, 'boop', 'memes', '/', 3);




