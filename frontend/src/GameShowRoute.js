import React from "react";
import { Route, Redirect } from "react-router-dom";

const GameShowRoute = ({ component: Component, ...rest }) => (
  <Route
    {...rest}
    render={(props) => {
      const id = parseInt(props.match.params.id, 10);
      return id >= 1 && id <= 50 ? (
        <Component {...props} />
      ) : (
        <Redirect to="/home" />
      );
    }}
  />
);

export default GameShowRoute;
