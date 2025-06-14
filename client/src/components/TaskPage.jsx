import "./styles/TaskPage.css";
import { Link, useNavigate } from "react-router";
import { useState } from "react";
import MainPage from "./MainPage";

//const SERVER_URL = "http://localhost:10000";
const SERVER_URL = "https://week-07-assignment-siif.onrender.com";

export default function TaskPage({ type }) {
  // I hate Prittier
  const navigate = useNavigate();

  const [taskData, setTaskData] = useState({
    title: "",
    text: "",
    priority: 1,
    task_list_id: 1,
  });

  let message = "I have no idea what I am doing!";

  if (type === "new") {
    message = "Create New Task";
  }

  if (type === "edit") {
    message = "Edit Existing Task";
    //TODO: fill out fields using the passed in data ??
    // I suspect that I just include them in props, thats for later
  }

  function handleSubmit(event) {
    event.preventDefault();

    // console.log("submission:", taskData);

    const reply = fetch(SERVER_URL + "/addTask", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(taskData),
    });

    navigate(-1);
  }

  function handleTaskData(event) {
    setTaskData({ ...taskData, [event.target.name]: event.target.value });
  }

  return (
    <>
      <h2>{message}</h2>
      {
        <form onSubmit={handleSubmit}>
          <label htmlFor="title">Title: </label>
          <input
            type="text"
            name="title"
            required
            placeholder="Task Title"
            value={taskData.title}
            onChange={handleTaskData}
          />
          <label htmlFor="text">Details: </label>
          <input
            type="text"
            name="text"
            placeholder="add details about the task here"
            value={taskData.text}
            onChange={handleTaskData}
          />

          <button type="submit">Add</button>
        </form>
      }

      <Link to="/">Cancel</Link>
    </>
  );
}
