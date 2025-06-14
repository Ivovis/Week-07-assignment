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

/* add tasks */
INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Project Plan','A detailed plan outlining the objectives, timelines, and resources required for the project.', 1, 1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('User Manual','A guide providing instructions on how to use the software or system.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Meeting Notes','Summary of discussions and decisions made during a meeting.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Technical Specification','Document detailing the technical requirements and specifications of a product or system.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Test Case','A set of conditions or variables under which a system or component is tested.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Bug Report','A report documenting an issue or defect found in a software application.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Release Notes','A document listing the changes, improvements, and fixes in a new version of a software product.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Requirements Document','A document outlining the functional and non-functional requirements of a system or product.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Training Material','Resources and content used to train users or employees on a particular subject or system.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('System Architecture','A blueprint of the systems components, their relationships, and interactions',1,1);

/* we link each task to the 'in progress' tag  */
INSERT INTO tags_tasks (task_id,tag_id) VALUES (1,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (2,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (3,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (4,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (5,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (6,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (7,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (8,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (9,1);
INSERT INTO tags_tasks (task_id,tag_id) VALUES (10,1);
