import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link, useHistory } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";


function ViewCategory(){
    
    const [categoryList, setCategoryList] = useState([]);
    const history=useHistory();

    useEffect(()=>{
        axios.get(`api/view-category`).then(res=>{
            if(res.status===200){
                setCategoryList(res.data.category);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }else {
                swal('Warning', res.data.message, 'warning').then(() => {
                    history.push(`/admin/dashboard`);
                });
            }
        })
    },[history]);

    return(
        <div className="container px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>Category list</h4>
                    <Link to="/admin/add-category" className="btn btn-primary btn-sm float-end">Add category</Link>
                </div>
                <div className="card-body table-responsive">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Slug</th>                                
                                <th>Image</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>View</th>
                            </tr>
                        </thead>
                        <tbody>
                            { categoryList.map((item)=> (
                                    <tr key={item.id}>
                                        <td>{item.id}</td>
                                        <td><Link to={`edit-category/${item.id}`}>{item.name}</Link></td>
                                        <td>{item.slug}</td>
                                        <td><img src={`${process.env.REACT_APP_URL}${item.image}`} width="50" className="img-thumbnail" height="50" alt={item.name}/></td>
                                        <td>{item.status === 1 ? 'Shown' : 'Hidden'}</td>
                                        <td>
                                            <Link to={`edit-category/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
                                        </td>
                                        <td>
                                            <Link to={`/admin/view-product/${item.id}`} className="btn btn-primary btn-sm">View products</Link>
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

export default ViewCategory;