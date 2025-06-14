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
