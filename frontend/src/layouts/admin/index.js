import React, { useContext } from "react";
import Navbar from './Navbar.js';
import SideBar from "./Sidebar.js";
import {Route,Switch,Redirect} from 'react-router-dom';
import AdminRouteList from "../../routes/AdminRouteList.js";
import axios from "axios";
import { Context } from "../../contexts/globalContext.js";

const MasterLayout= ()=>{
    const { setGlobalValues } = useContext(Context);

    React.useEffect(() => {
        axios.get(`api/get-permissions`).then(res=>{
            if(res?.status===200){
                let permissions = res.data?.permissions;
                let list_of_permissions = [];
                let setPermissions = permissions?.forEach(permission => {
                    list_of_permissions.push(permission.slug);
                });
    
                setGlobalValues({permissions: list_of_permissions});
            }
        });
    }, [])
    
    
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
                            <Redirect from="/" to="/admin/dashboard" />
                        </Switch>
                    </main>
                </div>
            </div>

        </div>
    );

}

export default MasterLayout;