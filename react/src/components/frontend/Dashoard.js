import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

function Dashboard(){

    const [loading, setLoading] = useState(true);
    const [categoryList, setCategoryList] = useState([]);

    useEffect(()=>{
        axios.get(`api/view-category`).then(res=>{
            if(res.status===200){
                setCategoryList(res.data.category);
            }
            setLoading(false);
        })
    },[]);

    if(loading){
        return <h4>Loading category...</h4>
    }

    return (
        <div className="container-fluid">
            <div className="row">
                {   categoryList.map((item, index) => (
                    <Link to={`services/${item.slug}/${item.id}`} key={index} className="col-md-4 text-decoration-none">
                        <div className="bg-light rd-5" style={{border: '2px solid #f1f1f1', borderRadius: 5 }}>
                            <div className="p-1">
                                <div className="row">                                
                                    <div className="col-md-3">                                    
                                        <div className="">
                                            <i className="fas fa-user fa-fw"></i>
                                            <img src={`http://localhost:8000/${item.image}`} width="50" height="70" alt={item.name}/>
                                        </div>
                                    </div>
                                    <div className="col-md-9">
                                        <div className="">
                                            <div className="h5">{item.name}</div>
                                            <small  className="text-muted">{item.description}</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </Link>
                    ))
                }
                
            </div>
        </div>

    );
}


export default Dashboard;