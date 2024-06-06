import React from "react";

import {Route,Switch,Redirect} from 'react-router-dom';
import PublicRouteList from "../../routes/PublicRouteList";
import { RouteNotFound } from "../../util";

const PublicLayout= ()=>{

    return (        
        <main>
            <Switch>
                { PublicRouteList.map((routeData,idx)=>{
                    return (
                        routeData.component && (
                            <Route key={idx}  
                                path={routeData.path}
                                exact={routeData.exact}
                                name={routeData.name}
                                render={(props) =>(
                                    <routeData.component {...props}/>
                                )}
                            />
                        ))
                    })
                }
                <Redirect from="/user" to="/login" />
                <Redirect from="/admin" to="/login" />
                <Route component={RouteNotFound} />
        </Switch>
        </main>
    );

}

export default PublicLayout;