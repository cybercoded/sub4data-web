import axios from 'axios';
import React, { useEffect, useState } from "react";
import {Redirect} from 'react-router-dom';


function Index () {
    const [userPermissionsList, setUserPermissionsList] = useState(
        JSON.parse(localStorage.getItem('userPermissionsList')) || []
    );

    useEffect(()=>{

        axios.get(`api/view-permissions`).then(res=>{
            if(res.status===200){
                localStorage.setItem('userPermissionsList', JSON.stringify(res.data.permissions));
            }
        });
    }, []);

    return (
        <>
            <Redirect from="/" to="/admin/dashboard" />
        </>
    )
}

export default Index;