DROP DATABASE IF EXISTS hscict;

CREATE DATABASE IF NOT EXISTS hscict
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

SHOW DATABASES;

USE hscict;

CREATE TABLE IF NOT EXISTS tasks 
(
	task_id int(11),
    title varchar(255) NOT null,
    start_date date,
    due_date date,
    status tinyint(4) NOT null,
    priority tinyint(4) not null,
    description text(255),
    PRIMARY KEY (task_id, title)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS users 
(
	user_id int(11),
    created_at date,
    updated_at date,
    deleted_at date
) ENGINE=INNODB;

ALTER TABLE tasks
ADD COLUMN assigned_by char(30),
ADD COLUMN completed bool DEFAULT false;

ALTER TABLE tasks
ADD COLUMN user_id int(11) NOT null;

ALTER TABLE tasks
DROP assigned_by,
DROP completed;

ALTER TABLE tasks
MODIFY title longtext;

ALTER TABLE tasks
MODIFY title char(50) NOT null;

ALTER TABLE tasks
RENAME TO tasks_description;

ALTER TABLE tasks_description
RENAME to tasks;

ALTER TABLE tasks
ADD PRIMARY KEY (task_id);

ALTER TABLE users
ADD PRIMARY KEY (user_id);

/* ALTER TABLE tasks
ADD CONSTRAINT tasks_pk PRIMARY KEY (task_id, title); */

ALTER TABLE tasks
ADD FOREIGN KEY (user_id) REFERENCES users(user_id);

/* ALTER TABLE tasks
ADD CONSTRAINT tasks_fk
FOREIGN KEY (user_id) REFERENCES users(user_id); */

RENAME TABLE tasks TO tasks_desc;
RENAME TABLE tasks_desc TO tasks;