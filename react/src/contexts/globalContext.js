import React from "react";

export const Context = React.createContext();

export const reducer = (state, value) => {
    return {
      ...state,
      ...value
    };
};