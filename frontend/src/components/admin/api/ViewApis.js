import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";
import $ from "jquery";
import { Context } from "../../../contexts/globalContext";
import { getPermission } from "../../../util";

function ViewApis(){
    
    const [apisList, setApisList] = useState([]);
    const { globalValues } = React.useContext(Context);

    const handleDelete = (e)=>{
        e.preventDefault();
        Swal.fire({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary api!",
            icon: "warning",
            buttons: true,
            dangerMode: true
        })
        .then((willDelete) => {
            if (willDelete) {
                
                axios.delete(`api/delete-api/${e.target.dataset.id}`).then(res=>{
                    if(res?.data.status===200){
                        Swal.fire("Deleted!", "Your imaginary api has been deleted.", "success");
                        setApisList(apisList.filter(item=>item.id!==parseInt(e.target.dataset.id)));
                    } else {
                        Swal.fire("Cancelled", "Your imaginary api is safe :)", "error");

                    }
                });
                
            } else {
                Swal.fire("Your imaginary api is safe :)", "Your imaginary api is safe :)", "error");
                
            }
        });
    };            

    useEffect(()=>{
        axios.get(`api/view-apis`).then(res=>{
            if(res?.data.status===200){
                setApisList(res?.data.apis);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }
            
        })
    },[]);

    return(
        <div className="container px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>Apis list</h4>
                    <Link to="/admin/add-api" className="btn btn-primary btn-sm float-end">Add Api</Link>
                </div>
                <div className="card-body table-responsive">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>URL</th>
                                {getPermission(globalValues.permissions, 'delete_apis') && (
                                    <th>Delete</th>
                                )}
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            { apisList.map((item, index)=> (
                                    <tr key={index}>
                                        <td>{item.id}</td>
                                        <td>{item.api_name}</td>
                                        <td>{item.api_url}</td>
                                        {getPermission(globalValues.permissions, 'delete_apis') && (
                                            <td>
                                                <button onClick={handleDelete} disabled={!getPermission(globalValues.permissions, 'delete_apis')}  data-id={item.id} className="btn btn-danger btn-sm">Delete</button>
                                            </td>
                                        )}
                                        <td>
                                            <Link to={`/admin/edit-api/${item.id}`} className="btn btn-primary btn-sm">Edit</Link>
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

export default ViewApis;