import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";
import { Loader } from "../../Global";

function ViewCategory(){

    const [loading, setLoading] = useState(true);
    const [categoryList, setCategoryList] = useState([]);

    useEffect(()=>{
        axios.get(`api/view-category`).then(res=>{
            if(res.status===200){
                setCategoryList(res.data.category);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }
            setLoading(false);
        })
    },[]);

    const deleteCategory = (e,id)=>{
        e.preventDefault();

        const thisClicked=e.currentTarget;
        thisClicked.innerText="Deleting";

        axios.delete(`api/delete-category/${id}`).then(res=>{
            if(res.data.status===200)
            {
                swal("Success",res.data.message,"success");
                thisClicked.closest("tr").remove();
            }
            else if(res.data.status=== 404){
                swal("Warning",res.data.message,"warning");
                thisClicked.innerText="Delete";
            }
        })
    }
    return(
        <div className="container px-4">
            <div className="card mt-4">
                <Loader isActive={loading} />
                <div className="card-header">
                    <h4>Category list</h4>
                    <Link to="/admin/add-category" className="btn btn-primary btn-sm float-end">Add category</Link>
                </div>
                <div className="card-body">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Slug</th>                                
                                <th>Image</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            { categoryList.map((item)=> (
                                    <tr key={item.id}>
                                        <td>{item.id}</td>
                                        <td>{item.name}</td>
                                        <td>{item.slug}</td>
                                        <td><img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name}/></td>
                                        <td>{item.status ===1 ? 'Shown' : 'Hidden'}</td>
                                        <td>
                                            <Link to={`edit-category/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
                                        </td>
                                        <td>
                                            <button type="button" onClick={(e)=>deleteCategory(e,item.id)} className="btn btn-danger btn-sm">Delete</button>
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