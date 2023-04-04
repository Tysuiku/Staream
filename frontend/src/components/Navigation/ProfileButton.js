import React, { useState } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";

const ProfileButton = ({ user }) => {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);

  const logout = (event) => {
    event.preventDefault();
    dispatch(sessionActions.logout());
  };

  return (
    <div className="profileButtonWrapper">
      <button className="profileButton" onClick={() => setShowMenu(!showMenu)}>
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
  );
};

export default ProfileButton;
