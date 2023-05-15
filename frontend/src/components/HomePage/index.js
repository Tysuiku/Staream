import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchRandomGames } from "../../store/games";
import GameList from "./GameList/GameList";
import "./HomePage.css";
import GameCarousel from "./GameCarousel/GameCarousel";
import GameNavbar from "./GameNavbar/GameNavbar";
import { NavLink } from "react-router-dom";
import Footer from "../Footer";

const HomePage = () => {
  document.title = "Welcome to Staream";
  const dispatch = useDispatch();

  const randomGames = useSelector((state) =>
    state.games.random ? Object.values(state.games.random) : []
  );

  useEffect(() => {
    dispatch(fetchRandomGames());
  }, [dispatch]);

  return (
    <div className="homePageShowPageBox">
      <div className="homePageIndexContainer">
        <div id="GameNavBarHome">
          <NavLink to={"/cart"}>
            <p className="indexCart">Cart</p>
          </NavLink>
          <GameNavbar />
        </div>
        {randomGames && randomGames.length > 0 && (
          <>
            <div id="GameCarouselHome">
              <GameCarousel games={randomGames} />
            </div>
            <div id="GameListHome">
              <GameList games={randomGames} />
            </div>
          </>
        )}
      </div>

      <div className="homepageFooter">
        {" "}
        <Footer />{" "}
      </div>
    </div>
  );
};

export default HomePage;
