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
INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Create a Project Plan','Define the apps goals, features, timeline, and team roles. Set clear milestones and deadlines.', 1, 1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Design the UI','Make wireframes and mockups using design tools. Focus on layout, navigation, and visuals.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Build Core Features','Code the main functions. Test each part to ensure it works as intended.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Set Up Authentication','Add user login and registration. Use secure methods like email/password or OAuth.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Connect to APIs','Integrate external services like payments or maps. Use APIs and SDKs for data exchange.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Test the App','Run tests to find bugs and usability issues. Ensure smooth performance across devices.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Improve Performance','Speed up load times and reduce resource use. Optimize code and media files.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Get Ready for Launch','Finalize code, set up servers, and prepare databases and backend systems.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Write Key Documentation','Create user guides and developer notes. Keep instructions clear and helpful.',1,1);

INSERT INTO tasks (title,text,priority,task_list_id) VALUES ('Gather Feedback','Collect user input after launch or beta testing. Use it to improve future versions.',1,1);

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
