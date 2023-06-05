import axios from 'axios';
import React from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';
const SideBar = () => {

    const history = useHistory();

    const handleBackUp = (e) => {
        e.persist();
        axios.get(`api/database-backup`).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success');
            }
        });
    };
    return (
        <nav className="sb-sidenav accordion sb-sidenav-light" id="#navbarDropdown">
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className="sb-sidenav-menu-heading">Core</div>
                    <Link className="nav-link" to="/admin/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>
                    <Link className="nav-link" to="/admin/profile">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Profile
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
                            <i className="fas fa-columns"></i>
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
                            <i className="fas fa-columns"></i>
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
                            <i className="fas fa-columns"></i>
                        </div>
                        Services
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseServices" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-services">
                                View Services
                            </Link>
                            <Link className="nav-link" to="/admin/add-services">
                                Add Services
                            </Link>
                        </nav>
                    </div>

                    <Link className="nav-link" to="#" onClick={handleBackUp}>
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Database Backup
                    </Link>
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
