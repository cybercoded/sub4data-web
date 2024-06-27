import axios from 'axios';
import React, { useEffect } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { handleCopy, url } from '../../../util';
import { Context } from '../../../contexts/globalContext';


function Dashboard() {
    
    const {globalValues} = React.useContext(Context);

    const handleViewTransaction = (e) => {
        e.preventDefault();
        var dataArray = e.target.dataset;
        var table = document.createElement("div");
        table.style.textAlign = "left";
        table.innerHTML = (`<table cellpadding="10" className="table align-left table-striped table-hover">
            <body style="align-text: left;">
                <tr>
                    <th>Reference</th>
                    <td>${dataArray.reference}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${dataArray.name}</td>
                </tr>
                <tr>
                    <th>Amount</th>
                    <td>${dataArray.amount}</td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>${dataArray.product || ''}</td>
                </tr>
                <tr>
                    <th>Service</th>
                    <td>${dataArray.service || ''}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>${dataArray.description}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${dataArray.status}</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td>${dataArray?.date}</td>
                </tr>
            </body>
        </table>`);
        Swal.fire({

            html: table,
            buttons: {
                confirm: true,
                cancel: false,
            }
        });
    };


    return (
        <div className="container mt-2">           

            <div className='mb-4'>
                <div className='row'>
                    <div className='col-md-4 mb-2'>
                        <div className='card text-white my-bg-primary'>
                            <div className="card-body">
                                <div className='mb-2 d-flex justify-content-between  font-weight-bold'>
                                    <div className='text-truncate me-3 fw-bold'>{globalValues.user?.name}</div>
                                    <div className="float-end">                                       
                                        { globalValues.user?.levels?.map((item, index) => (
                                            <span key={index} className='badge bg-secondary'>
                                                <i className={`fa ${item.level === 1 ? 'fa-user' : 'fa-certificate'}`}></i><br />
                                                {item.name}
                                            </span>
                                        ))}
                                    </div>
                                </div>
                                <div className='h1 font-weight-bold my-3'>{ globalValues.user?.balance && '₦'+ new Intl.NumberFormat().format(globalValues.user.balance)}</div>
                                <div className='mt-3'>
                                    <Link to="/user/fund-wallet" className='btn btn-sm btn-secondary' style={{marginRight: 5}}>
                                        Fund wallet
                                    </Link>
                                    <Link to="/user/transfer-fund" className='btn btn-sm btn-light'>
                                        Transfer fund
                                    </Link>
                                </div>                                        
                            </div>
                        </div>
                    </div>
                        { globalValues.user?.banks?.map((item, index) => (
                                <div className='col-md-3 mb-2 d-none d-md-block'>
                                    <div key={index} className='card bg-light'>
                                        <div className="card-body py-4">
                                            <div className='text-muted mb-2'>
                                                {item.bank_name}
                                                <span className="float-end">
                                                    <span className='me-4'>{item.account_name}</span>
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
                                </div>
                            ))
                        }
                </div>
            </div>            
            
            <div>
                <div className="text-muted mb-4 pb-4 border-bottom d-none d-md-block">
                    <b>Instant</b> | Services
                </div>
                <div className="row">
                    {globalValues.category?.map((item, index) => (
                        <Link to={`services/${item.slug}/${item.slug}`} key={index} className="col-md-3 col-6 text-muted text-decoration-none">
                            <div className="card bg-light rd-5 mb-4">
                                <div className="card-body text-center">
                                    <div>
                                        <img
                                            src={`${url()}${item.image}`}
                                            className="mb-2"
                                            width="50"
                                            height="50"
                                            alt={item.name}
                                        />
                                    </div>
                                    <div className="h5 text-truncate">{item.name}</div>
                                </div>
                            </div>
                        </Link>
                    ))}
                </div>
            </div>

            <div className='mt-2'>
                <div className="text-muted mb-4 md:fs-5 pb-4 border-bottom">
                    <b>Recent</b> transactions |
                    <Link to="/user/transactions" className="float-end">View All</Link>
                </div>
                <div className="table-responsive">
                    <table className="table">
                        <tbody>
                            {globalValues.transactions?.map((item, index)=> {
                                return (
                                    <tr key={index}>
                                        <td className='d-none d-md-block' >{item.reference}</td>
                                        <td>{item.description}</td>
                                        <td>
                                            <button onClick={handleViewTransaction} 
                                                    className="btn btn-primary btn-sm float-end"
                                                    data-reference={item.reference}
                                                    data-amount={item.amount}
                                                    data-name={item.user.name}
                                                    data-product={item.product?.name}
                                                    data-service={item.service?.name}
                                                    data-status={item.status}
                                                    data-description={item.description}
                                                    data-date={item.created_at}
                                                >
                                                View
                                            </button>
                                        </td>
                                    </tr>
                                )})
                            }
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default Dashboard;
