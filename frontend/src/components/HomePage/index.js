import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGames } from "../../store/games";
import GameList from "./GameList";
import "./HomePage.css";

const HomePage = () => {
  document.title = "Welcome to Staream";
  const dispatch = useDispatch();

  const games = useSelector((state) => Object.values(state.games));

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  return (
    <>
      <GameList games={games} />
    </>
  );
};

export default HomePage;
