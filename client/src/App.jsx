import "./App.css";
import { useState } from "react";
import { Routes, Route, Link } from "react-router";
import MainPage from "./components/MainPage";
import TaskPage from "./components/TaskPage";
import ListPage from "./components/ListPage";
import TagsPage from "./components/TagsPage";

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<MainPage />} />
      <Route path="/task" element={<TaskPage />} />
      <Route path="/list" element={<ListPage />} />
      <Route path="/tags" element={<TagsPage />} />
    </Routes>
  );
}
