import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link, useHistory } from "react-router-dom";
import Swal from "sweetalert2";
import $ from "jquery";

function ViewServices(props){

    const [serviceList, setService] = useState([]);
    const product_id = props.match.params.id;
    const history=useHistory();

    useEffect(() => {
        document.title="View service";
        axios.get(`api/view-services${product_id ? '/' + product_id : ''}`).then(res=>{
            if(res?.data.status===200) {
                setService(res?.data.services);
                $(document).ready(function () {
                    $('table').DataTable();
                });
            } else {
                Swal.fire('Warning', res?.data.message, 'warning').then(() => {
                    history.push(`/admin/dashboard`);
                });
            } 
        });
    }, [product_id, history]);

    const deleteService = (e,id)=>{
        e.preventDefault();

        const thisClicked=e.currentTarget;
        thisClicked.innerText="Deleting";
        
        axios.delete(`api/delete-services/${id}`).then(res=>{
            if(res?.data.status===200)
            {
                Swal.fire("Success",res?.data.message,"success");
                thisClicked.closest("tr").remove();
            }
            else if(res?.data.status=== 404){
                Swal.fire("Warning",res?.data.message,"warning");
                thisClicked.innerText="Delete";
            }
        })
    }
    
    return(
        <div className="card px-3">
            
            <div className="card-header">
                <h4>View service | 
                    <Link to="/admin/add-services" className="btn btn-primary btn-sm float-end">Add service</Link>
                </h4>
            </div>
            <div className="card-body">
                <div className="table-responsive">
                    <table className="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Service Name</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            {serviceList?.map((item)=> (
                                    <tr key={item.id}>
                                        <td>{item.id}</td>
                                        <td>{item.product?.name}</td>
                                        <td>{item.name}</td>                    
                                        <td>{item.status ===1 ? 'Shown' : 'Hidden'}</td>
                                        <td>
                                            <Link to={`/admin/edit-services/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
                                        </td>
                                        <td>
                                            <button type="button" onClick={(e)=>deleteService(e,item.id)} className="btn btn-danger btn-sm">Delete</button>
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

export default ViewServices;