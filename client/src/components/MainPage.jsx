import { Link } from "react-router";
import "./MainPage.css";

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
        <Link to="task">
          <p id="taskName1" className="taskName">
            A fake something to do 1
          </p>
        </Link>
        <Link to="task">
          <p id="taskName2" className="taskName">
            A fake something to do 2
          </p>
        </Link>
        <Link to="task">
          <p id="taskName3" className="taskName">
            A fake something to do 3
          </p>
        </Link>
      </div>
      <Link to="tags">Fake Tags</Link>
    </>
  );
}
