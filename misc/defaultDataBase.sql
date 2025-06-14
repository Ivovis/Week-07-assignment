/* run this to set the default database*/

/* First create the tables if they don't exist */
CREATE TABLE IF NOT EXISTS task_list(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS tasks (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(25) NOT NULL,
    text VARCHAR(300),
    priority INT NOT NULL,
    task_list_id INT REFERENCES task_list(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS tags (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(25) NOT NULL
);

CREATE TABLE IF NOT EXISTS tags_tasks (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    task_id INT REFERENCES tasks(id) NOT NULL,
    tag_id INT REFERENCES tags(id) NOT NULL
);


/* if they did exits we now empty them and reset index's back to 1 */
TRUNCATE TABLE tags_tasks, task_list, tasks, tags;

ALTER SEQUENCE tags_tasks_id_seq RESTART WITH 1;
ALTER SEQUENCE tasks_id_seq RESTART WITH 1;
ALTER SEQUENCE task_list_id_seq RESTART WITH 1;
ALTER SEQUENCE tags_id_seq RESTART WITH 1;


/* now add a single task list */
INSERT INTO task_list (name) VALUES ('My First Task List');

/* add the three default tags*/
INSERT INTO tags (name) VALUES ('In progress');
INSERT INTO tags (name) VALUES ('Completed');
INSERT INTO tags (name) VALUES ('On Hold');

/* add three example tasks to the single list */
INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('My first task','And example of a task that can be updated or deleted',1,1);
INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('My second task','Another task to be done',3,1);
INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('My third task','Last one I promise',2,1);

/* we link each task to the 'in progress' tag  */
INSERT INTO tags_tasks (task_id,tag_id) VALUES (1,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (2,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (3,1);
