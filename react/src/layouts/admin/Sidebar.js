import axios from 'axios';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';

import $ from 'jquery';

const SideBar = () => {

    
    const handleBackUp = (e) => {
        e.persist();

        
        axios.get(`api/database-backup`).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success');
            }
            
        });
    };

    $('nav#my-admin-sidebar').on('click', function() {
        if ($(window).width() < 768) {
            document.body.classList.remove('sb-sidenav-toggled');            
        }
    });

    return (
        <nav className="sb-sidenav border border-top-0 border-bottom-0 border-secondary sb-sidenav-light" id="my-admin-sidebar" data-bs-target="#navbarDropdown2">
            
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className="sb-sidenav-menu-heading">Menu</div>
                    <Link className="nav-link" to="/admin/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>
                    <Link className="nav-link" to="/admin/transactions">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-list"></i>
                        </div>
                        Transactions
                    </Link>

                    <div className="sb-sidenav-menu-heading">User Settings</div>
                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseUsers"
                        aria-expanded="false"
                        aria-controls="collapseUsers"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-users"></i>
                        </div>
                            Users
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseUsers" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-users">
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
                        data-bs-target="#collapseApis"
                        aria-expanded="false"
                        aria-controls="collapseApis"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-arrow-up-right-from-square"></i>
                        </div>
                            APIs
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseApis" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-apis">
                                View APIs
                            </Link>
                            <Link className="nav-link" to="/admin/add-api">
                                Add API
                            </Link>
                        </nav>
                    </div>

                    <Link
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseLevels"
                        aria-expanded="false"
                        aria-controls="collapseLevels"
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-sitemap"></i>
                        </div>
                            Levels 
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseLevels" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/view-levels">
                                View Levels
                            </Link>
                            <Link className="nav-link" to="/admin/add-level">
                                Add Level
                            </Link>
                        </nav>
                    </div>

                    <div className="sb-sidenav-menu-heading">Admin Settings</div>
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
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/admin/send-message">
                                <div className="sb-nav-link-icon">
                                    <i className="fas fa-envelope"></i>
                                </div>
                                Send message
                            </Link>
                        </nav>
                    </div>
                </div>
            </div>
        </nav>
    );
};
export default SideBar;
