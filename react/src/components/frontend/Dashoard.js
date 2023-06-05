import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ReactjsOverlayLoader from "reactjs-overlay-loader";

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

    return (
        <div className="container mt-5">
            <ReactjsOverlayLoader isActive={loading} 
                icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
            />
            <div className="row">
                {   categoryList.map((item, index) => (
                    <Link to={`services/${item.slug}/${item.id}`} key={index} className="col-md-3 col-6 text-muted text-decoration-none">
                        <div className="card bg-light rd-5 mb-4">
                            <div className="card-body text-center">
                                <div>
                                    <img src={`http://localhost:8000/${item.image}`} className="mb-2" width="50" height="50" alt={item.name}/>
                                </div>
                                <div className="h5">
                                    {item.name}
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