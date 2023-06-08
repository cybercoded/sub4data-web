import axios from 'axios';
import React, { useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../components/Global';
const SideBar = () => {

    const history = useHistory();

    const [loading, setLoading] = useState();
    const handleBackUp = (e) => {
        e.persist();

        setLoading(true);
        axios.get(`api/database-backup`).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success');
            }
            setLoading(false);
        });
    };

    return (
        <nav className="sb-sidenav border border-top-0 border-bottom-0 border-secondary sb-sidenav-light" id="sidenavAccordion" data-bs-target="#navbarDropdown2">
            <Loader isActive={loading} />
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className="sb-sidenav-menu-heading">Core</div>
                    <Link className="nav-link" to="/admin/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>

                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseCategory"
                        aria-expanded="false"
                        aria-controls="collapseCategory"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-users"></i>
                        </div>
                            Users
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseCategory" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-category">
                                View users
                            </Link>
                            <Link className="nav-link" to="/admin/credit-user">
                                Credit user
                            </Link>
                            <Link className="nav-link" to="/admin/debit-user">
                                Debit user
                            </Link>
                        </nav>
                    </div>
                    
                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseCategory"
                        aria-expanded="false"
                        aria-controls="collapseCategory"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-list-alt"></i>
                        </div>
                            Categories
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseCategory" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-category">
                                View category
                            </Link>
                            <Link className="nav-link" to="/admin/add-category">
                                Add category
                            </Link>
                        </nav>
                    </div>
                    
                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseProduct"
                        aria-expanded="false"
                        aria-controls="collapseProduct"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-shopping-cart"></i>
                        </div>
                        Products
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseProduct" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-product">
                                View product
                            </Link>
                            <Link className="nav-link" to="/admin/add-product">
                                Add product
                            </Link>
                        </nav>
                    </div>

                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseServices"
                        aria-expanded="false"
                        aria-controls="collapseServices"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-briefcase"></i>
                        </div>
                        Services
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseServices" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-services">
                                View Services
                            </Link>
                            <Link className="nav-link" to="/admin/add-services">
                                Add Services
                            </Link>
                        </nav>
                    </div>

                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseSettings"
                        aria-expanded="false"
                        aria-controls="collapseSettings"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-cog"></i>
                        </div>
                            Settings
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseSettings" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="#" onClick={handleBackUp}>
                                <div className="sb-nav-link-icon">
                                    <i className="fas fa-database"></i>
                                </div>
                                Database Backup
                            </Link>
                        </nav>
                    </div>
                </div>
            </div>
            <div className="sb-sidenav-footer">
                {/* <div className="small">Logged in as:</div>
                        Start Bootstrap */}
            </div>
        </nav>
    );
};
export default SideBar;
