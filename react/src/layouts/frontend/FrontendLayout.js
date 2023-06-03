import React from "react";

import {Route,Switch} from 'react-router-dom';
import Navbar from "../../layouts/frontend/Navbar";
import SideBar from "./Sidebar";
import PublicRouteList from "../../routes/PublicRouteList";
const FrontendLayout= ()=>{
    const MySideBar = () => {
        if (localStorage.getItem('auth_token')) {
            return <SideBar />
        }else {
            return null;
        }
    }
    return(
        <div className="sb-nav-fixed">
           <Navbar /> 
           <div id="layoutSidenav">
                <div id="layoutSidenav_nav">
                    <MySideBar />
                </div>
                <div id="layoutSidenav_content">
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
                </div>                    
            </div>
        </div>

    );

}

export default FrontendLayout;