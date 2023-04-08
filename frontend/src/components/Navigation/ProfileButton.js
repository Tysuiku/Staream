import React, { useState } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";
import badapple from "./touhou badapple.jpeg";

const ProfileButton = ({ user }) => {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);

  const logout = (event) => {
    event.preventDefault();
    dispatch(sessionActions.logout());
  };

  return (
    <div>
      <div className="profileButtonWrapper">
        <button
          className="profileButton"
          onClick={() => setShowMenu(!showMenu)}
        >
          {`${user.username} ▾`}
        </button>

        {showMenu && (
          <div className="profileButtonDropdown">
            <button className="profileButtonDropdownItem" onClick={logout}>
              Logout: <span className="logoutUserName">{user.username}</span>
            </button>
          </div>
        )}
      </div>

      <div className="profile-border">
        <img src={badapple} className="temp-profile-pic" />
      </div>
    </div>
  );
};

export default ProfileButton;
