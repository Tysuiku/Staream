import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
// import { fetchGames } from "../../store/games";
import GameList from "./GameList/GameList";
import "./HomePage.css";
import GameCarousel from "./GameCarousel/GameCarousel";
import GameNavbar from "./GameNavbar/GameNavbar";
import { NavLink } from "react-router-dom";
import Footer from "../Footer";

const HomePage = () => {
  document.title = "Welcome to Staream";
  // const dispatch = useDispatch();

  const gamesFromStore = useSelector((state) => Object.values(state.games));

  const [games, setGames] = useState([]);
  const [randomGames, setRandomGames] = useState([]);

  useEffect(() => {
    if (gamesFromStore.length > 0) {
      setGames(gamesFromStore);
      let randomGames = [...gamesFromStore].sort(() => Math.random() - 0.5);
      setRandomGames(randomGames.slice(0, 10));
    }
  }, [gamesFromStore.length]);

  // useEffect(() => {
  //   dispatch(fetchGames());
  // }, [dispatch]);

  // const simplifiedGames = games.map((game) => ({
  //   id: game.id,
  //   name: game.name,
  //   mainImage: game.mainImage,
  // }));

  return (
    <div className="homePageShowPageBox">
      <div className="homePageIndexContainer">
        <div id="GameNavBarHome">
          <NavLink to={"/cart"}>
            <p className="indexCart">Cart</p>
          </NavLink>
          <GameNavbar />
        </div>
        <div id="GameCarouselHome">
          <GameCarousel games={randomGames} />
        </div>
        <div id="GameListHome">
          <GameList games={randomGames} />
        </div>
      </div>

      <div className="homepageFooter">
        {" "}
        <Footer />{" "}
      </div>
    </div>
  );
};

export default HomePage;
