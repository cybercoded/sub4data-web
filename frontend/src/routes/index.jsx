import React from "react";
import { Route, Switch} from "react-router-dom";
import UserLayout from "../layouts/frontend";
import PublicLayout from "../layouts/public/PublicLayout";
import MasterLayout from "../layouts/admin";
import { RouteNotFound, getCookie, get_local_storage_item } from "../util";

function AppRoutes(rest) {
    
    return(
        <>
            <Switch>
                {getCookie('auth_token') ? (
                    <>
                        {get_local_storage_item('auth_role') === "user" && (
                            <Route {...rest} render={(props) => <UserLayout {...props} /> } />
                        )}
                        {get_local_storage_item('auth_role') === "admin" && (
                            <Route {...rest} render={(props) => <MasterLayout {...props} /> } />
                        )}
                    </>
                ) : (
                    <>
                        {get_local_storage_item('auth_role') === "public" && (
                            <Route {...rest} render={(props) => <PublicLayout {...props} /> } />
                        )}
                        {get_local_storage_item('auth_role') !== "public" && get_local_storage_item('auth_role') !== "user" && get_local_storage_item('auth_role') !== "admin" && (
                            <Route {...rest} render={(props) => <RouteNotFound {...props} /> } />
                        )}
                    </>      
                )}
                <Route component={RouteNotFound} />
            </Switch>
        </>
    );

}

export default AppRoutes;