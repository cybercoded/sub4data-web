import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ReactjsOverlayLoader from 'reactjs-overlay-loader';
import Toastify from 'toastify-js';
import PerfectScrollbar from "react-perfect-scrollbar";
import swal from 'sweetalert';

function Dashboard() {
    const [loading, setLoading] = useState(true);
    const [categoryList, setCategoryList] = useState([]);
    const [transactionList, setTransactionList] = useState([]);
    const [userDataList, setUserDataList] = useState([]);

    useEffect(() => {
        axios.get(`api/view-category`).then((res) => {
            if (res.data.status === 200) {
                setCategoryList(res.data.category);
            }
            setLoading(false);
        });

        axios.get(`api/view-transactions`).then((res) => {
            if (res.data.status === 200) {
                setTransactionList(res.data.data);
            }
        });

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

    const handleViewTransaction = (e) => {
        e.preventDefault();
        var dataArray = e.target.dataset;
        console.log(dataArray);
        var table = document.createElement("div");
        table.style.textAlign = "left";
        table.innerHTML = (`<table class="table align-left table-striped table-hover">
            <body style="align-text: left;">
                <tr>
                    <th>Refernce</th>
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
                    <td>${dataArray.product}</td>
                </tr>
                <tr>
                    <th>Service</th>
                    <td>${dataArray.service}</td>
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
                    <td>${dataArray.date}</td>
                </tr>
            </body>
        </table>`);
        swal({
            content: table,
            buttons: {
                confirm: true,
                cancel: false,
            }
        });
    };


    return (
        <div className="container mt-5">
            <ReactjsOverlayLoader isActive={loading} />

            <div className='mb-4'>
                <div className='row'>
                    <div className='col-md-3 mb-2'>
                        <div className='card text-white my-bg-primary'>
                            <div className="card-body">
                                <div className='mb-2 font-weight-bold'>
                                    {userDataList.name}
                                    <span className="float-end">                                       
                                        <i className={`fa ${userDataList.level === 1 ? 'fa-user-o' : 'fa-certificate'}`}></i>
                                    </span>
                                </div>
                                <div className='h1 font-weight-bold my-3'>₦{ new Intl.NumberFormat().format(userDataList.balance)}</div>
                                <div className='mt-3'>
                                    <button className='btn btn-sm btn-secondary' style={{marginRight: 5}}>
                                        Fund wallet
                                    </button>
                                    <button className='btn btn-sm btn-light'>
                                        Transer fund
                                    </button>
                                </div>                                        
                            </div>
                        </div>
                    </div>
                    <div className='col-md-9'>
                        <PerfectScrollbar>
                            <div style={{width: 300 * userDataList.banks?.length || 0}}>
                                { userDataList.banks?.map((item, index) => (
                                        <div key={index} className='card bg-light float-start' style={{minWidth: 280, marginRight: 10}}>
                                            <div className="card-body">
                                                <div className='text-muted mb-2'>
                                                    {item.bank_name}
                                                    <span className="float-end">
                                                        {item.account_name}
                                                        <i className="fa fa-chevron-circle-right"></i>
                                                    </span>
                                                </div>
                                                <div className='h1 font-weight-bold my-3'>{item.account_number}</div>
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
                        </PerfectScrollbar>
                    </div>
                </div>
            </div>
            
            <div>
                <div className="text-muted h5 mb-4 pb-4 border-bottom">
                    <b>Instant</b> | Services
                </div>
                <div className="row">
                    {categoryList.map((item, index) => (
                        <Link to={`services/${item.slug}/${item.id}`} key={index} className="col-md-3 col-6 text-muted text-decoration-none">
                            <div className="card bg-light rd-5 mb-4">
                                <div className="card-body text-center">
                                    <div>
                                        <img
                                            src={`http://localhost:8000/${item.image}`}
                                            className="mb-2"
                                            width="50"
                                            height="50"
                                            alt={item.name}
                                        />
                                    </div>
                                    <div className="h5">{item.name}</div>
                                </div>
                            </div>
                        </Link>
                    ))}
                </div>
            </div>

            <div className='mt-2'>
                <div className="text-muted h5 mb-4 pb-4 border-bottom">
                    <b>Transaction</b> records |
                    <Link to="/user/transactions" className="btn btn-primary btn-sm float-end">All Transaction</Link>
                </div>
                <div className="table-responsive">
                    <table className="table table-boardered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Status</th>
                                <th>Amount</th>
                                <th>Reference</th>
                                <th>Description</th>
                                <th><span className='float-end'>View</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            {transactionList.map((item, index)=> {
                                let formater = new Intl.NumberFormat();
                                return (
                                    <tr key={index}>
                                        <td>{index+1}</td>
                                        <td><span className='badge bg-info'>{item.status}</span></td>
                                        <td>₦{formater.format(item.amount)}</td>
                                        <td>{item.reference}</td>
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
