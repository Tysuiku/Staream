import React, { useEffect } from "react";
import { createRoot } from "react-dom/client";
import { Provider } from "react-redux";
import { BrowserRouter } from "react-router-dom";
import "./index.css";
import App from "./App";
import configureStore from "./store";
import csrfFetch from "./store/csrf";
import * as sessionActions from "./store/session";

const store = configureStore();

if (process.env.NODE_ENV !== "production") {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
}

function Root() {
  return (
    <Provider store={store}>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </Provider>
  );
}

const AppRoot = () => {
  useEffect(() => {
    if (
      sessionStorage.getItem("X-CSRF-Token") === null ||
      sessionStorage.getItem("currentUser") === null
    ) {
      store.dispatch(sessionActions.restoreSession());
    }
  }, [store]);

  return <Root />;
};

createRoot(document.getElementById("root")).render(<AppRoot />);
