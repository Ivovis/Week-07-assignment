/*
    Original queries used to create the tables.
    also see testData.sql and defaultDataBase.sql
    defaultDataBase.sql should be used for deployment.
*/

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
