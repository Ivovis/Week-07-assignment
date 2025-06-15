# Week 7 Assignment

A task management application, with a 'Task List' that holds a list of container categories each able to hold a list of tasks.

tasks have a title, description, priority and none or more tags

tags: each task can have none or more tags, tags can be added and removed with the tag editor (stretch goal)
There are three default tags 'Progressing','Completed' and 'On Hold'

First job will be to design the tables and create the mono repository.

---

##### Checkpoint 1

I have my tables designed using drawsql.com:

<img src="./misc/TaskAppSchema.png" alt="A screen capture of the planned database schema showing four tables" width="400">

The _task_list_ table holds the category titles, each task will link via a foreign key to a category in the task_list.

The _tasks_ table hold the core tasks, including title, text, priority and task_list_id.

The _tags_ table hold the names of all the tags, I'd like to add image icons as a stretch goal.

The _tags_tasks_ table is a junction table holding the connections between tags and tasks.

This commit includes the basic client/server framework ready for expansion, from here I plan to create the SQL queries using the exported data from drawsql.com and run them on the supabase, then commit the SQLQueries.sql for your reference.

---

=======

###### Checkpoint 2

Database queries to create the four tables have been made and run on supabase, the queries.sql can be found in the reporoot/misc folder, below is the schema as seen on supabase.com

<img src="./misc/TaskAppSchemaSupabase.png" alt="diagram of the schema for the database taken from supabase.com" width="500">

---

##### Checkpoint 3

Wireframes completed, the App has been designed for mobile devices used in vertical orientation, personal stretch goals of landscape and desktop styling.

I have four conditionally rendered pages;

###### main page

<img src="./misc/FrontPageWireframe.svg" alt="layout of main page" width="400">

###### task editing page

<img src="./misc/TaskPageWireframe.svg" alt="layout of task editing page" width="400">

###### tag selecting and editing page

<img src="./misc/TagPageWireframe.svg" alt="layout of task editing page" width="400">

###### task list editing page

This page has the same layout as the tag editing page

This turned into a bit of a rabbit hole and I have limited the design to the basics, This may still be a design too far, I'll start with a single fixed task list and add in the functionality for adding/editing and deleting lists later if time, same for the tags, for now I'll have a fixed set of tags and add the editing later if time.

My Key focus now is the main page and task view/editing page, I'll use place holders for the other two pages.

Next checkpoint will be the basic framework client where I am able to navigate the whole app.

---

##### Checkpoint 4

This took way longer than it should, I had completely forgotten the workshop on SPA, but eventually I arrived where I need to be, I now have a basic client with navigation, next up I will create the database reset and test data seed files.

---

#### Checkpoint 5

I discovered that creating or rather truncating database tables that have foreign key constraints should not be done in separate SQL instructions, I kept getting errors while debugging my seed files, so I switched to pure SQL using the editor on supabase.com and got both queries working, two files, one to create the default tables with default entries and the other to create the tables and more extensive test entries, named defaultDataBase.sql and testData.sql respectively, they can be found in the misc directory in the repo root. During my attempt at the js seed files I added the following to package.json

    "resetDB": "node resetDatabase",
    "testDB": "node installTestData"

I will return to the seed files after I have the assignment objectives completed.

Next I want to get the server up and running.

---

#### Checkpoint 6

Created server and a route names /init to return a list of 'task list names' and the full set of tasks, remembering to stick with the assignment objectives. (I have the full app in my mind churning over how to include everything needed!)

---

#### Checkpoint 7

Created component to display the tasks this uses .map (TaskList.jsx)
Created additional database test data - testData2.sql, more orientated towards actual tasks.
Added interval timer to the TaskList Component and checked that it updates when I add a row using subabase SQL editor - this is working.

---

#### Checkpoint 8

I have fleshed out TaskPage and called it with a parameter that states 'new' or 'edit' I'm not sure yet how to pass in an existing task from the TaskList component (my plan is to switch to TaskPage when the user clicks on an exiting task, but thats for later)

I have added the post route to the server and created the form, find it in TaskPage.jsx, It took me a while to work out how to return from the form after the submission had been completed, I discovered the useNavigate searching on line, we have not covered this so I wonder if I'm missing something here.

I should now have met all the assignment requirements:

🎯 Create a client using React. - done
🎯 Use Express to create your server, using both GET and POST endpoints. - Done  
🎯 Build a React form for users to create posts. - done
🎯 Create multiple pages using React Router. - done  
🎯 Design a database schema, and seed the database with some realistic data. - done
🎯 Use SQL to retrieve posts from the database in your Express server. - done
🎯 Display all posts using .map(). - done
🎯 Use an interval and useEffect() to poll your database. - done

For the life of me I have no idea how to use .env.production so I can have the correct url on deployment thats my next job after this commit.

updated my hard coded server url's in two components on the client

#### Checkpoint 9

Started the styling, I use that term with some contempt, The Add new task page accessed via 'Add New' on the main page seems to be behaving mostly as I want, the main page at this stage is a mess, the colors at this stage are just so I can identify the elements.

This commit serve just to document at least some progress on styling.
