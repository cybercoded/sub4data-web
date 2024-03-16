import React from "react";

import {Route,Switch,Redirect} from 'react-router-dom';
import Navbar from "./Navbar";
import SideBar from "./Sidebar";
import UserRouteList from "../../routes/UserRouteList";
import { RouteNotFound } from "../../util";
const UserLayout= ()=>{

    return(
        <div className="sb-nav-fixed first">
            <Navbar />
            <div id="layoutSidenav">            
                <div id="layoutSidenav_nav">
                    <SideBar />
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <Switch>
                            {UserRouteList.map((routeData,idx)=>{
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
                                })}
                                <Redirect from="/" to="/admin/dashboard" />
                        </Switch>
                    </main>
                </div>  
            </div>
        </div>

    );

}

export default UserLayout;