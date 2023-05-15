import { useState, useMemo, useEffect } from "react";
import { NavLink } from "react-router-dom";
import { debounce } from "lodash";
import { useDispatch, useSelector } from "react-redux";
import { fetchGames } from "../../../store/games";
import badapple from "./touhou badapple.jpeg";
import "./GameNavbar.css";

export default function GameNavbar() {
  const [value, setValue] = useState("");
  const [filteredGames, setFilteredGames] = useState([]);
  const dispatch = useDispatch();

  const games = useSelector((state) => Object.values(state.games.all));

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  const onChange = (event) => {
    setValue(event.target.value);
  };

  const debouncedSearch = useMemo(
    () =>
      debounce((searchValue) => {
        const lowercasedValue = searchValue.toLowerCase();
        const filtered = games.filter((game) => {
          if (!game || !game.name) return false;

          const gameName = game.name.toLowerCase();

          return (
            lowercasedValue &&
            gameName.startsWith(lowercasedValue) &&
            gameName !== lowercasedValue
          );
        });

        setFilteredGames(filtered.slice(0, 5));
      }, 300),
    [games]
  );

  useEffect(() => {
    debouncedSearch(value);
  }, [value, debouncedSearch]);

  return (
    <div className="GameNavbarBox">
      <NavLink exact to="/">
        <div className="yourStore">
          {/* <img src={badapple} className="yourStoreProfile" /> */}
          <p>Your Store</p>
        </div>
      </NavLink>
      <div className="GameSearch">
        <div className="search-container">
          <div className="search-inner">
            <input
              type="text"
              placeholder="Search"
              value={value}
              onChange={onChange}
            />
          </div>
          <div className="dropdown">
            {filteredGames.map((game) => (
              <NavLink
                to={`/games/${game.id}`}
                className="dropdown-row"
                key={game.id}
                onClick={() => setValue(game.name)}
              >
                <img src={game.mainImage} alt={game.name} />
                {game.name}
              </NavLink>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}
