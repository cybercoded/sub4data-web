import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";
import { Loader } from "../../Global";

function ViewProduct(){

    const [productList, setProduct] = useState([]);

    const [loading, setLoading] = useState(true);
    useEffect(() => {
        let isMounted= true;
        document.title="View product";
        axios.get(`api/view-product`).then(res=>{
            if(isMounted)
            {
                if(res.data.status===200)
                {
                    setProduct(res.data.product);
                    setLoading(false);

                    $(document).ready(function () {
                        $('table').DataTable();
                    });
                }
            }
      });
      return ()=>{
          isMounted = false;
      }
    }, []);

    const deleteProduct = (e,id)=>{
        e.preventDefault();

        const thisClicked=e.currentTarget;
        thisClicked.innerText="Deleting";

        axios.delete(`api/delete-product/${id}`).then(res=>{
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
                <h4>View product | 
                    <Link to="add-product" className="btn btn-primary btn-sm float-end">Add product</Link>
                </h4>
            </div>
            <div className="card-body">
                <div className="table-responsive">
                    <table className="table table-boardered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Edit</th>
                                <th>Delete</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            {productList?.map((item, index)=> (
                                <tr key={index}>
                                    <td>{item.id}</td>
                                    <td>{item.category.name}</td>
                                    <td>{item.name}</td>
                                    <td>{item.status === 1 ? 'Shown' : 'Hidden'}</td>
                                    <td><img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name}/></td>
                                    <td>
                                        <Link to={`/admin/edit-product/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
                                    </td>                    
                                    <td>
                                        <button type="button" onClick={(e)=>deleteProduct(e,item.id)} className="btn btn-danger btn-sm">Delete</button>
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

export default ViewProduct;