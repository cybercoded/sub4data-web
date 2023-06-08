import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import $ from "jquery";
import { Loader } from "../Global";

function Dashboard(){

    const [loading, setLoading] = useState(true);
    const [userData, setUserData] = useState([]);
    const [transactionData, setTransactionData] = useState([]);
    

    useEffect(()=>{

        setLoading(true);
        axios.get(`api/view-users`).then(res=>{
            if(res.status===200){
                setUserData(res.data.users);
            }
            setLoading(false);
        });

        axios.get(`api/view-transactions`).then(res=>{
            if(res.status===200){
                setTransactionData(res.data.data);
            }
            setLoading(false);
        });
    },[]);

    return (
        <div className="container-fluid my-5">                
            <section className="row mb-5">
                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-users fa-4x text-danger"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">200</div>
                            <small className="text-muted font-weight-bold">
                                Users
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-list-alt fa-4x text-success"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">200</div>
                            <small className="text-muted font-weight-bold">
                                Transactions
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-wallet fa-4x text-info"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">200</div>
                            <small className="text-muted font-weight-bold">
                                Total
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="far fa-bell fa-4x text-primary"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">200</div>
                            <small className="text-muted font-weight-bold">
                                Notification
                            </small>
                        </div>
                    </Link>
                </div>
            </section>

            <Loader isActive={loading} />

            <section className="row">
                <div className="col-md-4">
                    <div className="card">
                        <div className="card-body table-responsive">
                            <div className="text-muted h5 py-4 border-bottom">
                                <b>Latest</b> Users |
                                <Link to="/admin/transactions" className="h6 float-end">View All</Link>
                            </div>
                            <table className="table">
                                <tbody>
                                    { userData.map((item, index)=> (
                                            <tr key={index}>                                               
                                                <td><span className="badge bg-info">{item.status ===1 ? 'Active' : 'Inactive'}</span></td>
                                                <td>{item.name}</td>
                                                <td>
                                                    <Link to={`edit-user/${item.id}`} className="btn btn-primary btn-sm">View</Link>
                                                </td>
                                            </tr>
                                        ))
                                    }
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div className="col-md-8">
                    <div className="card">                    
                        <div className="card-body table-responsive">
                            <div className="text-muted h5 py-4 border-bottom">
                                <b>Latest</b> Transactions |
                                <Link to="/admin/transactions" className="h6 float-end">View All</Link>
                            </div>
                            <table className="table">
                                <tbody>
                                    { transactionData.map((item, index)=> (
                                            <tr key={index}>
                                                <td><span className="badge bg-info">{item.status}</span></td>                                            
                                                <td>{item.user.name}</td>
                                                <td>{item.description}</td>                                                
                                            </tr>
                                        ))
                                    }
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}


export default Dashboard;