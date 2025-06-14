import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import pg from "pg";

const app = express();
app.use(express.json());
app.use(cors());

dotenv.config();

const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
});

app.listen(10000, function () {});

app.get("/", function (req, res) {
  res.json({ message: "its out there .....waiting." });
});

app.get("/init", async (req, res) => {
  // get list of task names
  let query = await db.query(`SELECT * from task_list`);
  let listNames = query.rows;

  // get list of tasks
  query = await db.query(`SELECT * from tasks`);
  let taskData = query.rows;

  // combine into object
  const initData = {
    listNames: listNames,
    taskData: taskData,
  };

  // outside of assignment scope, but later I would get the primary tag for each task here

  // send it
  res.json(initData);
});

app.post("/addTask", (req, res) => {
  // destructure the body
  const { title, text, priority, task_list_id } = req.body;
  console.log("post called:", req.body);
  try {
    const insert = db.query(
      `INSERT INTO tasks (title, text, priority, task_list_id) VALUES ($1, $2, $3, $4)`,
      [title, text, priority, task_list_id]
    );
    res.status(200).json({ success: true });
  } catch (error) {
    console.log("Error: check your connection string?");
    res.status(500).json({ success: false });
  }
});

app.delete("/deletetask/:id", (req, res) => {
  //we will use params to set what id we want to target for deletion
  //in the endpoint, we can set up dynamic params using : (for example, /:id)
  const taskId = req.params.id;

  try {
    const deleteBiscuit = db.query(`DELETE FROM task WHERE id = $1`, [taskId]);

    res.status(200).json({ success: true });
  } catch (error) {
    console.log("Error: check your connection string?");
    res.status(500).json({ success: false });
  }
});

//Update is a mix of delete and post --> we will use the body to add the updated data, and the params to target the correct entry

app.put("/updateBiscuit/:id", (req, res) => {
  // /:id --> dynamic params are params that change in value
  const taskBody = req.body; //updated biscuit data
  const taskId = req.params.id; //target the correct biscuit

  try {
    const updateBiscuit = db.query(
      `UPDATE tasks SET title = $1, text = $2, priority = $3, task_list_id = $4 WHERE id = $5`,
      [
        taskBody.title,
        taskBody.text,
        taskBody.priority,
        taskBody.tasl_list_id,
        taskId,
      ]
    );
    res.status(200).json({ success: true });
  } catch (error) {
    console.log("Error:check your connection string?");
    res.status(500).json({ success: false });
  }
});
