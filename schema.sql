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
	image varchar
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

INSERT INTO boards (name, image) VALUES ('music', 'ph');
INSERT INTO boards (name, image) VALUES ('television', 'ph');
INSERT INTO boards (name, image) VALUES ('technology', 'ph');

INSERT INTO threads (board_id, user_id, subject, body, image) VALUES (1, 4, 'Shitposts', 'Shitpooooost', 'x');
INSERT INTO threads (board_id, user_id, subject, body, image) VALUES (1, 4, 'Bloo', 'Shmee', 'x');

INSERT INTO posts (thread_id, user_id, subj, bod, image, replied_to) VALUES (1, 2, 'nlah', 'haha fuck you!', '/', 3);