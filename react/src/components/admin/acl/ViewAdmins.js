import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";


function ViewAdmins(){
    const [adminLists, setAdminLists] = useState([]);

    useEffect(() => {

        axios.post(`api/filter-users`, {'role_as': 1}).then(res=>{
            if(res.data.status===200)
            {
                setAdminLists(res.data.users);
                $(document).ready(function () {
                    $('#table').DataTable();
                });                
            }
        });
    }, []);


    return(
        <div className="container py-5">
            <div className="card">
                
                <div className="card-header">
                    <h4>View Users | </h4>
                </div>
                <div className="card-body">
                    <div className="table-responsive">
                        <table id="table" className="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>View</th>
                                    <th>View permissions</th>
                                </tr>
                            </thead>
                            <tbody>
                                {adminLists.map((item, index)=> (
                                        <tr key={index}>
                                            <td>{index+1}</td>
                                            <td>{item.name}</td>
                                            <td>{item.email}</td>                                            
                                            <td><span className="badge bg-info">{item.status === 1 ? 'Active' : 'Inactive'}</span></td>
                                            <td>
                                                <Link className="btn btn-primary btn-sm" to={`/admin/edit-user/${item.id}`}>View</Link>
                                            </td>
                                            <td>
                                                <Link className="btn btn-warning btn-sm" to={`/admin/edit-acls/${item.id}`}>View permissions</Link>
                                            </td>
                                        </tr>
                                    ))
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ViewAdmins;