import "./styles/TagsPage.css";
import { Link } from "react-router";

export default function TagsPage() {
  return (
    <>
      <p>Tags page, here you will be able to add,remove and select a tag.</p>
      <Link to="/">Back</Link>
    </>
  );
}
