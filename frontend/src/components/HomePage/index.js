import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGames } from "../../store/games";
// import "./HomePage.css";
import GameList from "./GameList/GameList";

const HomePage = () => {
  document.title = "Welcome to Staream";
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  return (
    <div className="store-home-page">
      <GameList />
    </div>
  );
};

export default HomePage;
