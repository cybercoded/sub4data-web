import axios from "axios";
import React from "react";
import { Link } from "react-router-dom";
import { Context } from "../../contexts/globalContext";

function Dashboard(){
    const {globalValues} = React.useContext(Context);

    return (
        <div className="container-fluid my-5">                
            <section className="row mb-5">
                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="/admin/view-users">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-users fa-4x text-primary"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">{globalValues?.admin_panels?.users_count}</div>
                            <small className="text-muted font-weight-bold">
                                Registered Users
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="/admin/transactions">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-list-alt fa-4x text-success"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">
                                { globalValues?.admin_panels?.users_balance && '₦' + new Intl.NumberFormat().format(globalValues?.admin_panels?.users_balance)}
                            </div>
                            <small className="text-muted font-weight-bold">
                                Users Balance
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link to="https://smartrechargeapi.com/v/login/" className="card text-decoration-none">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fas fa-wallet fa-4x text-info"></i>
                            </div>
                            <small className="text-muted font-weight-bold">
                                Click to check API Balance
                            </small>
                        </div>
                    </Link>
                </div>

                <div className="col-md-3 col-6 mb-3">
                    <Link className="card text-decoration-none" to="/admin/transactions">
                        <div className="card-body text-center">
                            <div className="mb-3">
                                <i className="fa fa-triangle-exclamation text-danger fa-4x"></i>
                            </div>
                            <div className="h3 text-secondary font-weight-bold mb-0">{globalValues?.admin_panels?.unsuccessful_transactions}</div>
                            <small className="text-muted font-weight-bold">
                                Unsuccessful Transactions
                            </small>
                        </div>
                    </Link>
                </div>
            </section>

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
                                    { globalValues?.users?.map((item, index)=> (
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
                                    { globalValues?.admin_transactions?.map((item, index)=> (
                                            <tr key={index}>
                                                <td><span className="badge bg-info">{item.status}</span></td>                                            
                                                <td>{item.user?.name}</td>
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