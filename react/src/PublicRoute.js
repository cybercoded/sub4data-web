import React from "react";
import { Route } from "react-router-dom";
import PublicLayout from "./layouts/public/PublicLayout";

function PublicRoute(rest){
    return(
        <Route {...rest} render={(props)=><PublicLayout {...props} /> } />
    );

}

export default PublicRoute;