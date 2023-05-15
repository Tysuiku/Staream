import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router-dom";
import GameShowCarousel from "./GameShowCarousel/GameShowCarousel";
import GameShowInfo from "./GameShowInfo/GameShowInfo";
import AddToCartButton from "./AddToCartButton";
import { fetchGame } from "../../store/games";
// import { fetchGames } from "../../store/games";
import "./ShowPage.css";
import GameNavbar from "../HomePage/GameNavbar/GameNavbar";
import { NavLink } from "react-router-dom";
import Footer from "../Footer";
import ReviewList from "./reviews/ReviewList";
import ReviewForm from "./reviews/ReviewForm";

const GameShowPage = () => {
  const { id } = useParams();
  const game =
    useSelector((state) =>
      state.games && state.games.all ? state.games.all[id] : {}
    ) || {};

  const user = useSelector((state) => state.session.user);
  const dispatch = useDispatch();

  const reviewFormStyles = {
    Holocure: {
      marginTop: "16vw",
      marginLeft: "13.85vw",
    },
    "Among Us": {
      marginTop: "15vw",
      marginLeft: "13.85vw",
    },
    Terraria: {
      marginTop: "14vw",
      marginLeft: "13.85vw",
    },
    "Destiny 2": {
      marginTop: "14vw",
      marginLeft: "13.85vw",
    },
  };

  // const games2 = useSelector((state) => {
  //   return Object.values(state.games);
  // });

  useEffect(() => {
    dispatch(fetchGame(id));
  }, [dispatch, id]);

  // useEffect(() => {
  //   dispatch(fetchGames());
  // }, [dispatch]);

  return (
    <div className="showPageMainBox">
      <div>
        <NavLink to={"/cart"}>
          <p className="showCart">Cart</p>
        </NavLink>
        <div className="allgameshowpageItems">
          <div className="gameNavBarShowPage">
            <GameNavbar />
          </div>

          {game && <h1 className="gameNameShowPage">{game.name}</h1>}

          {game && (
            <div className="ShowPageComponents">
              <GameShowCarousel key={game.id} game={game} />
              <GameShowInfo game={game} />
              <div id="reviewForm1" style={reviewFormStyles[game.name] || {}}>
                {game && user && (
                  <ReviewForm
                    gameId={game.id}
                    user={user}
                    gamename={game.name}
                  />
                )}
              </div>
              <div className="gameinfobuyBox">
                <AddToCartButton game={game} />
                {game && (
                  <div className="gamesShowInfoDes">
                    <h1>ABOUT THIS GAME</h1>
                    <p>{game.description}</p>
                  </div>
                )}
              </div>

              {game && game.id && user && (
                <div className="game-reviews">
                  <ReviewList gameId={game.id} currentUserId={user.id} />
                </div>
              )}
            </div>
          )}
        </div>
      </div>
      <div className="showPageFooter">
        <Footer />
      </div>
    </div>
  );
};

export default GameShowPage;
