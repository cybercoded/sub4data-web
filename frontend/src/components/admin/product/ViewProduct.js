import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link, useHistory } from "react-router-dom";
import Swal from "sweetalert2";
import $ from "jquery";


function ViewProduct(props){

    const [productList, setProduct] = useState([]);
    const category_id = props.match.params.id;
    const history=useHistory();

    useEffect(() => {
        document.title="View product";
        axios.get(`api/view-product${category_id ? '/' + category_id : ''}`).then(res=>{
            if(res?.data.status===200) {
                setProduct(res?.data.product);                    

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }else {
                Swal.fire('Warning', res?.data.message, 'warning').then(() => {
                    history.push(`/admin/dashboard`);
                });
            }
        });
    }, [category_id, history]);
    
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
                                <th>Status</th>
                                <th>Image</th>
                                <th>Actions&nbsp;&nbsp;&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            {productList?.map((item, index)=> (
                                <tr key={index}>
                                    <td>{item.id}</td>
                                    <td><Link to={`/admin/edit-product/${item.id}`}>{item.category?.name}</Link></td>
                                    <td>{item.name}</td>
                                    <td>{item.status === 1 ? 'Shown' : 'Hidden'}</td>
                                    <td><img src={`${process.env.REACT_APP_URL}${item.image}`} width="50" className="img-thumbnail" height="50" alt={item.name}/></td>
                                    <td>
                                        <Link to={`/admin/view-services/${item.id}`} className="btn btn-primary btn-sm">View services</Link>
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