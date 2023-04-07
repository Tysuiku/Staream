import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGames } from "../../store/games";
import GameList from "./GameList/GameList";
import "./HomePage.css";
import GameCarousel from "./GameCarousel/GameCarousel";

const HomePage = () => {
  document.title = "Welcome to Staream";
  const dispatch = useDispatch();

  const games = useSelector((state) => {
    const gameArr = Object.values(state.games);
    gameArr.sort(() => Math.random() - 0.5);
    return gameArr.slice(0, 10);
  });

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  return (
    <>
      <GameCarousel />
      <GameList games={games} />
    </>
  );
};

export default HomePage;
