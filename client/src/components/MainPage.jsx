import { Link } from "react-router";
import "./styles/MainPage.css";
import TaskList from "./TaskList.jsx";

export default function MainPage() {
  return (
    <>
      {/* <p>Main page</p> */}
      <Link to="list" className="changeList">
        <p id="listName">My First List</p>
      </Link>
      <div>
        <Link to="newtask" className="addNew">
          Add New
        </Link>
      </div>
      <div>
        <TaskList />
      </div>
      <Link to="tags" className="changeTag">
        Fake Tags
      </Link>
    </>
  );
}
