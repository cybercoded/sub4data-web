import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link } from "react-router-dom";
import $ from "jquery";
import Swal from "sweetalert2";
import { handleCopy } from "../../../util";

function ViewMerchants(){
    
    const [merchantList, setMerchantList] = useState([]);

    const handleViewKeys = (key) => {

        Swal.fire({
            text: key,
            icon: 'success',
            showCancelButton: true,
            confirmButtonText: 'Copy key',            
            cancelButtonText: 'Close'
        }).then((result) => {
            if (result.isConfirmed) { 
                handleCopy(key)
            }
        })
    }

    useEffect(()=>{
        axios.get(`api/view-merchant-keys`).then(res=>{
            if(res?.data.status===200){
                setMerchantList(res?.data.merchant_apis);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }else if(res?.data.status === 404) {
                setMerchantList([])
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
                <div className="card-body table-responsive col-md-6">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User names</th>
                                <th>Public key</th>
                            </tr>
                        </thead>
                        <tbody>
                            { merchantList?.map((item, index)=> (
                                    <tr key={index}>
                                        <td>{index+1}</td>
                                        <td>{item.name}</td>
                                        <td><button type="button" className="btn btn-primary btn-sm" onClick={() => handleViewKeys(item.public_key)}>View Public Key</button></td>
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

export default ViewMerchants;