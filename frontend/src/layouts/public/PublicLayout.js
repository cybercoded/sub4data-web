import React from "react";

import {Route,Switch} from 'react-router-dom';
import PublicRouteList from "../../routes/PublicRouteList";

const PublicLayout= ()=>{

    return (        
        <main>
            <Switch>
                {PublicRouteList.map((routeData,idx)=>{
                    return (
                        routeData.component && (
                            <Route key={idx}  
                            path={routeData.path}
                            exact={routeData.exact}
                            name={routeData.name}
                            render={(props) =>(
                                <routeData.component {...props}/>
                            )}
                            />))
                        })}
            </Switch>
        </main>
    );

}

export default PublicLayout;