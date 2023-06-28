import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";


function ViewProduct(){

    const [productList, setProduct] = useState([]);

    
    useEffect(() => {
        let isMounted= true;
        document.title="View product";
        axios.get(`api/view-product`).then(res=>{
            if(isMounted)
            {
                if(res.data.status===200)
                {
                    setProduct(res.data.product);
                    

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
    
    return(
        <div className="card px-3">
            
            <div className="card-header">
                <h4>View product | 
                    <Link to="add-product" className="btn btn-primary btn-sm float-end">Add product</Link>
                </h4>
            </div>
            <div className="card-body">
                <div className="table-responsive">
                    <table className="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Status</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            {productList?.map((item, index)=> (
                                <tr key={index}>
                                    <td>{item.id}</td>
                                    <td>{item.category.name}</td>
                                    <td>{item.name}</td>
                                    <td>{item.status === 1 ? 'Shown' : 'Hidden'}</td>
                                    <td><img src={`${process.env.REACT_APP_URL}${item.image}`} width="50" height="50" alt={item.name}/></td>
                                    <td>
                                        <Link to={`/admin/edit-product/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
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