import axios from "axios";
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";
import { handleCopy } from "../../../util";


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
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Merchant APIs</b> 
            </div>
            <div className="bg-light card card-body col-md-6">
                <form onSubmit={handleNewKeysGeneration}>
                    <div className='form-group mb-3'>
                        <label className="fw-bold">Private Key:</label>
                        <div disabled={true} className='form-control alert' >
                            <button className='btn btn-sm float-end btn-secondary' type="button" onClick={() => handleCopy(merchantKeys.public_key)} >Copy</button>
                            {merchantKeys.private_key}
                        </div>
                    </div>
                    <hr />
                    <div className='form-group mb-3'>
                        <label className="fw-bold">Public Key:</label>
                        <div disabled={true} className='form-control alert' >
                            <button className='btn btn-sm float-end btn-secondary' type="button" onClick={() => handleCopy(merchantKeys.private_key)} >Copy</button>
                            {merchantKeys.public_key}
                        </div>
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