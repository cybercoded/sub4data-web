import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ReactjsOverlayLoader from 'reactjs-overlay-loader';
import Toastify from 'toastify-js';
import PerfectScrollbar from "react-perfect-scrollbar";

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


    return (
        <div className="container mt-5">
            <ReactjsOverlayLoader isActive={loading} />

            <div className='mb-5'>
                <PerfectScrollbar>
                    <div style={{width: 300 * userDataList.banks?.length || 0}}>
                        { userDataList.banks?.map((item, index) => (
                                <div key={index} className='card bg-light float-start' style={{minWidth: 280, marginRight: 10}}>
                                    <div className="card-body py-4">
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
                </PerfectScrollbar>
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

            <div className='mt-5'>
                <div className="text-muted h5 mb-4 pb-4 border-bottom">
                    <b>Transaction</b> records |
                    <Link to="/user/view-transactions" className="btn btn-primary btn-sm float-end">All Transaction</Link>
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
                                <th className='float-end'>View</th>
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
                                            <Link to={`/user/get-transaction/${item.id}`} className="btn btn-primary btn-sm float-end">View</Link>
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
