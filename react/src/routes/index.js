import React from "react";
import { Route } from "react-router-dom";
import UserLayout from "../layouts/frontend/UserLayout";
import PublicLayout from "../layouts/public/PublicLayout";
import MasterLayout from "../layouts/admin/MasterLayout";

function AppRoutes(rest) {

    return(
        <>
            <Route {...rest} render={(props) => <PublicLayout {...props} /> } />
            { localStorage.getItem('auth_token') && (
                <>
                    { localStorage.getItem('auth_role') === "user" && (
                        <Route {...rest} render={(props) => <UserLayout {...props} /> } />
                    )}
                    { localStorage.getItem('auth_role') === "admin" && (
                        <Route {...rest} render={(props) => <MasterLayout {...props} /> } />
                    )}
                </>
            )}          
        </>
    );

}

export default AppRoutes;