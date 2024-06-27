import axios from "axios";
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";
import { BreadCombs, handleCopy } from "../../../util";


function MerchantAPI(){
    const [merchantKeys, setMerchantKeys] = useState([]);

    const handleNewKeysGeneration = (e) => {
        e.preventDefault();

        axios.put(`/api/generate-merchant-keys`).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success!',  res.data.message,'success').then((result) => {
                    window.location.reload()
                });
            }
            
        });

    }
    useEffect(() => {
        
        axios.get(`/api/get-merchant-keys`).then((res) => {
            if (res?.data.status === 200) {
                setMerchantKeys(res.data.merchant_apis);
            } else {
                Swal.fire('Error', res?.data.errors, 'error');
            }
            
        });
    }, []);


    return (
        <div className="container mt-5">
            <BreadCombs crumbs={['user/dashboard', 'user/merchant-api']} />
            <div className="d-flex justify-content-center"> 
                <form onSubmit={handleNewKeysGeneration} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">
                    <div className='form-group mb-3'>
                        <label className="fw-bold">Private Key:</label>
                        <i role="button" className='fa fa-copy ms-2 text-muted' type="button" onClick={() => handleCopy(merchantKeys.public_key)} ></i>
                        <input value={merchantKeys.public_key} disabled={true} className="form-control" />
                    </div>
                    <hr />
                    <div className='form-group mb-3'>
                        <label className="fw-bold">Public Key:</label>
                        <i role="button" className='fa fa-copy ms-2 text-muted' type="button" onClick={() => handleCopy(merchantKeys.private_key)} ></i>
                        <input value={merchantKeys.private_key} disabled={true} className="form-control" />
                    </div>
                    <div className='form-group mb-3'>
                        <p className="text-danger">If you notice that your keys have been compromised.</p>
                        <button className='btn btn-primary'>Generate New Keys</button>
                    </div>

                    <div className='form-group mb-3'>
                        <Link type='button' to={'www.postman.com'} className='btn btn-success w-100'>
                            <span>View Documentations</span> 
                            <i className="ms-3 fa fa-external-link"></i> 
                        </Link>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default MerchantAPI;