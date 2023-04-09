import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchGames } from "../../store/games";
import GameList from "./GameList/GameList";
import "./HomePage.css";
import GameCarousel from "./GameCarousel/GameCarousel";
import GameNavbar from "./GameNavbar/GameNavbar";

const HomePage = () => {
  document.title = "Welcome to Staream";
  const dispatch = useDispatch();

  const games = useSelector((state) => {
    const gameArr = Object.values(state.games);
    gameArr.sort(() => Math.random() - 0.5);
    return gameArr.slice(0, 10);
  });

  const games2 = useSelector((state) => {
    return Object.values(state.games);
  });

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  return (
    <div className="homePageIndexContainer">
      <GameNavbar games={games2} />
      <GameCarousel games={games} />
      <GameList games={games} />
    </div>
  );
};

export default HomePage;
