import "./styles/TaskList.css";
import { useState, useEffect } from "react";

export default function TaskList() {
  const [tasksList, setTasksList] = useState([]);

  //   console.log("TaskList Called");

  useEffect(() => {
    async function getTasks() {
      console.log("getTasks called");
      const res = await fetch("http://localhost:10000/init");
      const data = await res.json();
      const wrangData = data.taskData;
      //   console.log(wrangData);
      setTasksList(wrangData);
    }
    getTasks();
    const refreshInterval = setInterval(getTasks, 4000);
    return () => clearInterval(refreshInterval);
  }, []);

  return (
    <>
      <div>
        {tasksList.map((taskItem) => {
          return (
            <p key={taskItem.id} className="taskTitle">
              {taskItem.title}: &quot;{taskItem.text}&quot;
            </p>
          );
        })}
      </div>
    </>
  );
}
