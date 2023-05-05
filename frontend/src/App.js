import React from "react";
import { Route, Switch, Redirect } from "react-router-dom";
import LoginFormPage from "./components/LoginFormPage";
import SignupFormPage from "./components/SignupFormPage";
import Navigation from "./components/Navigation";
import HomePage from "./components/HomePage";
import GameShowPage from "./components/GameShowPage";
import CartPage from "./components/CartPage";
import useScrollToTop from "./hooks/useScrollToTop"; // custom hook
import GameShowRoute from "./GameShowRoute";
function App() {
  useScrollToTop(); // Use the custom hook

  return (
    <>
      <Navigation />
      <Switch>
        <Route exact path="/">
          <Redirect to="/home" />
        </Route>
        <Route exact path="/home">
          <HomePage />
        </Route>
        <Route path="/cart">
          <CartPage />
        </Route>
        <GameShowRoute path="/games/:id" component={GameShowPage} />{" "}
        {/* Use the custom route component */}
        <Route path="/login">
          <LoginFormPage />
        </Route>
        <Route path="/signup">
          <SignupFormPage />
        </Route>
        <Route path="*">
          <Redirect to="/home" />
        </Route>
      </Switch>
    </>
  );
}

export default App;
