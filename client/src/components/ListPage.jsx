import "./ListPage.css";
import { Link } from "react-router";

export default function ListPage({ activePage, setActivePage }) {
  return (
    <>
      <p>
        Task List page, here you will be able to add,remove and select a task
        list
      </p>
      <Link to="/">Back</Link>
    </>
  );
}
