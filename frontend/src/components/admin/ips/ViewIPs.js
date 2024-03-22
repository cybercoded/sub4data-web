import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link } from "react-router-dom";
import $ from "jquery";

function ViewIPs(){
    
    const [apisList, setApisList] = useState([]);

    useEffect(()=>{
        axios.get(`api/get-ips`).then(res=>{
            if(res?.data.status===200){
                setApisList(res?.data.whitelists);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }else if(res?.data.status === 404) {
                setApisList([])
            }            
        })
    },[]);

    return(
        <div className="container px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>Apis list</h4>
                    <Link to="/admin/add-ips" className="btn btn-primary btn-sm float-end">Add IP</Link>
                </div>
                <div className="card-body table-responsive">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>IP</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            { apisList?.map((item, index)=> (
                                    <tr key={index}>
                                        <td>{index+1}</td>
                                        <td>{item.name}</td>
                                        <td>{item.ip}</td>
                                        <td>
                                            <Link to={`/admin/edit-ips/${item.id}`} className="btn btn-primary btn-sm">Edit</Link>
                                        </td>
                                    </tr>
                                ))
                            }
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ViewIPs;