import { Link } from "react-router";
import "./styles/MainPage.css";
import TaskList from "./TaskList.jsx";

export default function MainPage() {
  return (
    <>
      <p>Main page</p>
      <Link to="list">
        <p id="listName" className="listName">
          A fake List Name
        </p>
      </Link>
      <div>
        <Link to="newtask">Add New</Link>
        <TaskList />
      </div>
      <Link to="tags">Fake Tags</Link>
    </>
  );
}
