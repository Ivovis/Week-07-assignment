import "./styles/TaskPage.css";
import { Link } from "react-router";

export default function TaskPage() {
  return (
    <>
      <p>Task page, here you will be able to view,remove and edit the task</p>
      <Link to="/">Back</Link>
    </>
  );
}
