import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import { Loader } from "../../Global";
import $ from "jquery";

function ViewServices(){

    const [serviceList, setservice] = useState([]);

    const [loading, setLoading] = useState(true);
    useEffect(() => {
        let isMounted= true;
        document.title="View service";
        axios.get(`api/view-services`).then(res=>{
            if(isMounted)
            {
                if(res.data.status===200)
                {
                    setservice(res.data.service);
                    $(document).ready(function () {
                        $('table').DataTable();
                    });
                }
            }
            setLoading(false);
        });
        return ()=>{
            isMounted = false;
        }
    }, []);

    const deleteService = (e,id)=>{
        e.preventDefault();

        const thisClicked=e.currentTarget;
        thisClicked.innerText="Deleting";
        
        axios.delete(`api/delete-services/${id}`).then(res=>{
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
        <div className="card px-3">
            <Loader isActive={loading} />
            <div className="card-header">
                <h4>View service | 
                    <Link to="/admin/add-services" className="btn btn-primary btn-sm float-end">Add service</Link>
                </h4>
            </div>
            <div className="card-body">
                <div className="table-responsive">
                    <table className="table table-boardered table-striped">
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
                            {serviceList.map((item)=> (
                                    <tr key={item.id}>
                                        <td>{item.id}</td>
                                        <td>{item.product.name}</td>
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