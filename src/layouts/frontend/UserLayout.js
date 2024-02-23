import React from "react";

import {Route,Switch} from 'react-router-dom';
import Navbar from "../../layouts/frontend/Navbar";
import SideBar from "./Sidebar";
import UserRouteList from "../../routes/UserRouteList";
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
                                        />))
                                    })}
                        </Switch>
                    </main>
                </div>  
            </div>
        </div>

    );

}

export default UserLayout;