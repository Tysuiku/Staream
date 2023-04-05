import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import csrfFetch from "../../store/csrf";
import { fetchGames } from "../../store/games";
// import "./HomePage.css";
import GameList from "./GameList/GameList";

const HomePage = () => {
  document.title = "Welcome to Staream";
  // const dispatch = useDispatch();

  const [data, setData] = useState({});

  // let games = [];
  // games = useSelector((state) => Object.values(state.games));

  useEffect(() => {
    // dispatch(fetchGames());
    csrfFetch("http://localhost:5000/api/games")
      .then((response) => response.json())
      .then((data) => {
        // console.log(data);
        setData(data);
      })
      .catch((error) => {});
  }, []);

  return (
    <>
      <h1>hello</h1>
      {Object.keys(data).map((item) => data[item].name)}
      {/* {console.log(data)} */}
    </>
  );
};

export default HomePage;
