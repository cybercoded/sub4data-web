import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import $ from "jquery";
import { Loader } from "../Global";

function Dashboard(){

    const [loading, setLoading] = useState(true);
    const [userData, setUserData] = useState([]);

    useEffect(()=>{

        setLoading(true);
        axios.get(`api/view-users`).then(res=>{
            if(res.status===200){
                setUserData(res.data.users);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }
            setLoading(false);
        })
    },[]);

    return (
        <div className="container-fluid mt-4">                
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
                <div className="col-md-12">
                    <div className="card-body table-responsive">
                        <table className="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>View</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                { userData.map((item, index)=> (
                                        <tr key={index}>
                                            <td>{item.id}</td>
                                            <td>{item.name}</td>
                                            <td>{item.email}</td>
                                            <td>{item.status ===1 ? 'Active' : 'Inactive'}</td>
                                            <td>
                                                <Link to={`view-user/${item.id}`} className="btn btn-info btn-sm">View</Link>
                                            </td>
                                            <td>
                                                <Link to={`edit-user/${item.id}`} className="btn btn-success btn-sm">Edit</Link>
                                            </td>
                                        </tr>
                                    ))
                                }
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
    );
}


export default Dashboard;