import React from "react";
import { Route, Redirect } from "react-router-dom";
import UserLayout from "../layouts/frontend";
import PublicLayout from "../layouts/public/PublicLayout";
import MasterLayout from "../layouts/admin/";
import { get_local_storage_item } from "../util";

function AppRoutes(rest) {
    
    return(
        <>
            <Route {...rest} render={(props) => <PublicLayout {...props} /> } />
            { get_local_storage_item('auth_token') ? (
                <>
                    { get_local_storage_item('auth_role') === "user" && (
                        <Route {...rest} render={(props) => <UserLayout {...props} /> } />
                    )}
                    { get_local_storage_item('auth_role') === "admin" && (
                        <Route {...rest} render={(props) => <MasterLayout {...props} /> } />
                    )}
                </>
            ) : (
                <Redirect to="/" />
            )}          
        </>
    );

}

export default AppRoutes;