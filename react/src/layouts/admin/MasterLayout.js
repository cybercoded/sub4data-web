import React from "react";
import Navbar from './Navbar';
import SideBar from "./Sidebar";
import {Route,Switch,Redirect} from 'react-router-dom';
import AdminRouteList from "../../routes/AdminRouteList.js";

const MasterLayout= ()=>{
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
                            {AdminRouteList.map((route,idx)=>{
                                return (
                                    route.component && (
                                        <Route key={idx}  
                                        path={route.path}
                                        exact={route.exact}
                                        name={route.name}
                                        render={(props) =>(
                                            <route.component {...props}/>
                                        )}
                                        />
                                    
                                    )
                                )
                            })}
                            <Redirect from="/admin" to="/admin/dashboard" />
                        </Switch>
                    </main>
                </div>
            </div>

        </div>
    );

}

export default MasterLayout;