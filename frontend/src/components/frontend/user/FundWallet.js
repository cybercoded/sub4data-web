import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Toastify from 'toastify-js';

function FundWallet() {
    
    const [userDataList, setUserDataList] = useState([]);

    useEffect(() => {
        axios.get(`api/user/`).then((res) => {
            if (res.status === 200) {
                setUserDataList(res.data);
            }
            
        });

    }, []);

    const handleCopy = (value) => {
        navigator.clipboard.writeText(value)

        Toastify({
            text: "Copied to your clipboard",
            duration: 3000,
            className: "info",
            close: true,
            gravity: "top", // `top` or `bottom`
            position: "center", // `left`, `center` or `right`
            stopOnFocus: true, // Prevents dismissing of toast on hover
            offset: {
                y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
            },
        }).showToast();

    }



    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Fund</b> Wallet |
            </div>
            
            <div className="card col-md-4 bg-light" style={{height: '50vh'}}>
                <div className='card-body'>
                    <ol className="list-group list-group-numbered">                  
                        <li className="list-group-item d-flex justify-content-between align-items-start p-4" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <div className="ms-2 me-auto">
                                <div className="fw-bold">Automated Banks</div>
                                Fund your wallet using Automated Banks
                            </div>
                            <i className="fa fa-angle-right text-muted"></i>
                        </li>
                        <br />
                        <Link role="button" to="/user/merchant-pay" className="list-group-item d-flex justify-content-between align-items-start p-4">
                            <div className="ms-2 me-auto">
                                <div className="fw-bold">ATM Card</div>
                                Fund your wallet using accepted ATM Card
                            </div>
                            <i className="fa fa-angle-right text-muted"></i>
                        </Link>
                    </ol>
                </div>
            </div>
            
            
            <div className="modal fade" id="exampleModal" tabIndex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div className="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div className="modal-content">
                        <div className="modal-header">
                            <h5 className="modal-title" id="exampleModalLabel">Automated Banks</h5>
                            <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div className="modal-body">
                            { userDataList.banks?.map((item, index) => (
                                    <div key={index} className='card mb-3'>
                                        <div className='card-body'>
                                            <div className='text-muted mb-2'>
                                                {item.bank_name}
                                                <span className="float-end">
                                                    {item.account_name}
                                                    <i className="fa fa-chevron-circle-right"></i>
                                                </span>                                        
                                            </div>
                                            <div className='h3 font-weight-bold my-3'>{item.account_number}</div>
                                            <div className='mt-3'>
                                                <button className='btn btn-sm btn-primary' onClick={() => handleCopy(item.account_number)} >
                                                    Copy Account Number
                                                </button>
                                            </div>
                                        </div>                                      
                                    </div>
                                ))
                            }
                        </div>
                        <div className="modal-footer">
                            <button type="button" className="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default FundWallet;
