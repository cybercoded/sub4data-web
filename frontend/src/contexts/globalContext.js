import React from "react";

export const Context = React.createContext();

export const reducer = (state, action) => {
      return {
        ...state,
        ...action,
      };
};