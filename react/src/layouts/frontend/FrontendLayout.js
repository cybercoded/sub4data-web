import React from "react";

import {Route,Switch} from 'react-router-dom';
import Navbar from "../../layouts/frontend/Navbar";
import SideBar from "./Sidebar";
import PublicRouteList from "../../routes/PublicRouteList";
const FrontendLayout= ()=>{
    const MySideBar = () => {
        if (localStorage.getItem('auth_token')) {
            return (
                <div id="layoutSidenav_nav">
                    <SideBar />
                </div>
            )
            
        }else {
            return null;
        }
    }
    const MyNavbar = () => {
        if (localStorage.getItem('auth_token')) {
            return (
                <div id="layoutSidenav_nav">
                    <Navbar />
                </div>
            );
            
        }else {
            return null;
        }
    }
    return(
        <div className="sb-nav-fixed">
            <MyNavbar />
            <div id="layoutSidenav">                       
                <MySideBar />
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