import React from "react";
import { Route } from "react-router-dom";
import UserLayout from './layouts/frontend/UserLayout';
function PublicRoute(rest){
    return(
        <Route {...rest} render={(props)=><UserLayout {...props} /> } />
    );

}

export default PublicRoute;