import axios from 'axios';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import $ from 'jquery';
import { getPermission, get_local_storage_item } from '../../util';
import React from 'react';
import { Context } from '../../contexts/globalContext';

const SideBar = () => {

    const { globalValues } = React.useContext(Context);

    const handleBackUp = (e) => {
        e.persist();
        axios.get(`api/database-backup`).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success');
            }            
        });
    };

    $('.custom-toggler').each(function() {
        $(this).on('click', function() {
            if ($(window).width() <= 768) {
                document.body.classList.remove('sb-sidenav-toggled');
            }
        });
    });

    return (
        <nav className="sb-sidenav border border-top-0 border-bottom-0 border-secondary sb-sidenav-light" id="my-admin-sidebar" data-bs-target="#navbarDropdown2">
            
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className='bg-secondary p-2'>
                        <div className="fw-bold">Admin</div>
                    </div>
                    <div className="sb-sidenav-menu-heading">Menu</div>
                    <Link className="nav-link custom-toggler" to="/admin/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>
                    {getPermission(globalValues.permissions, 'read_transactions') && (
                        <Link className="nav-link custom-toggler" to="/admin/transactions">
                            <div className="sb-nav-link-icon">
                                <i className="fas fa-list"></i>
                            </div>
                            Transactions
                        </Link>
                    )}   


                    {getPermission(globalValues.permissions, 'read_acls') && (
                        <div>
                            <div className="sb-sidenav-menu-heading">Administrative settings</div>

                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseACLs" aria-expanded="false" aria-controls="collapseACLs">
                                <div className="sb-nav-link-icon">
                                    <i className="fa fa-list"></i>
                                </div>
                                    Access Controls
                                <div className="sb-sidenav-collapse-arrow">
                                    <i className="fas fa-angle-down"></i>
                                </div>
                            </Link>
                            <div className="collapse" id="collapseACLs" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav className="sb-sidenav-menu-nested nav">
                                    <Link className="nav-link custom-toggler" to="/admin/view-admins">
                                        View ACLs
                                    </Link>
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_users') && (
                        <div>
                            <Link className="nav-link custom-toggler collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseUsers" aria-expanded="false" aria-controls="collapseUsers">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-users">
                                        View users
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_transactions') && (
                                        <Link className="nav-link custom-toggler" to="/admin/credit-user">
                                            Credit user
                                        </Link>
                                    )}
                                    {getPermission(globalValues.permissions, 'create_transactions') && (
                                        <Link className="nav-link custom-toggler" to="/admin/debit-user">
                                            Debit user
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}
                    
                    {getPermission(globalValues.permissions, 'read_categories') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseCategory" aria-expanded="false" aria-controls="collapseCategory">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-category">
                                        View category
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_categories') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-category">
                                            Add category
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_products') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseProduct" aria-expanded="false" aria-controls="collapseProduct">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-product">
                                        View product
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_products') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-product">
                                            Add product
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_services') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseServices" aria-expanded="false" aria-controls="collapseServices">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-services">
                                        View Services
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_services') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-services">
                                            Add Services
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_apis') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseApis" aria-expanded="false" aria-controls="collapseApis">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-apis">
                                        View APIs
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_apis') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-api">
                                            Add API
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_discounts') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseDiscount" aria-expanded="false" aria-controls="collapseDiscount">
                                <div className="sb-nav-link-icon">
                                    <i className="fa fa-arrow-up-right-from-square"></i>
                                </div>
                                    discount
                                <div className="sb-sidenav-collapse-arrow">
                                    <i className="fas fa-angle-down"></i>
                                </div>
                            </Link>
                            <div className="collapse" id="collapseDiscount" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav className="sb-sidenav-menu-nested nav">
                                    <Link className="nav-link custom-toggler" to="/admin/view-discounts">
                                        View Discounts
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_discount') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-discount">
                                            Add Discount
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_ips') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseips" aria-expanded="false" aria-controls="collapseips">
                                <div className="sb-nav-link-icon">
                                    <i className="fa fa-arrow-up-right-from-square"></i>
                                </div>
                                    IPs
                                <div className="sb-sidenav-collapse-arrow">
                                    <i className="fas fa-angle-down"></i>
                                </div>
                            </Link>
                            <div className="collapse" id="collapseips" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav className="sb-sidenav-menu-nested nav">
                                    <Link className="nav-link custom-toggler" to="/admin/view-ips">
                                        View IPs
                                    </Link>
                                    {getPermission(globalValues.permissions, 'update_ips') && (
                                        <Link className="nav-link custom-toggler" to="/admin/edit-ips">
                                            Edit IP
                                        </Link>
                                    )}
                                    {getPermission(globalValues.permissions, 'create_ips') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-ip">
                                            Add IP
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_levels') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseLevels" aria-expanded="false" aria-controls="collapseLevels">
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
                                    <Link className="nav-link custom-toggler" to="/admin/view-levels">
                                        View Levels
                                    </Link>
                                    {getPermission(globalValues.permissions, 'create_levels') && (
                                        <Link className="nav-link custom-toggler" to="/admin/add-level">
                                            Add Level
                                        </Link>
                                    )}
                                </nav>
                            </div>
                        </div>
                    )}

                    {getPermission(globalValues.permissions, 'read_merchants') && (
                        <div>
                            <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseLevels" aria-expanded="false" aria-controls="collapseLevels">
                                <div className="sb-nav-link-icon">
                                    <i className="fab fa-dev"></i>
                                </div>
                                    Merchants 
                                <div className="sb-sidenav-collapse-arrow">
                                    <i className="fas fa-angle-down"></i>
                                </div>
                            </Link>
                            <div className="collapse" id="collapseLevels" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav className="sb-sidenav-menu-nested nav">
                                    <Link className="nav-link custom-toggler" to="/admin/view-merchants">
                                        View Merchants
                                    </Link>
                                </nav>
                            </div>
                        </div>
                    )}

                    <div className="sb-sidenav-menu-heading">Other Settings</div>
                    <Link className="nav-link collapsed" to="#" data-bs-toggle="collapse" data-bs-target="#collapseSettings" aria-expanded="false" aria-controls="collapseSettings">
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
                            {getPermission(globalValues.permissions, 'read_db_backups') && (
                                <Link className="nav-link custom-toggler" to="/admin/view-dbs">
                                    <div className="sb-nav-link-icon">
                                        <i className="fas fa-database"></i>
                                    </div>
                                    View DB Backups
                                </Link>
                            )}
                            {getPermission(globalValues.permissions, 'create_db_backups') && (
                                <Link className="nav-link custom-toggler" to="#" onClick={handleBackUp}>
                                    <div className="sb-nav-link-icon">
                                        <i className="fas fa-database"></i>
                                    </div>
                                    Make a Backup
                                </Link>
                            )}
                            {getPermission(globalValues.permissions, 'read_messages') && (
                                <Link className="nav-link custom-toggler" to="/admin/view-messages">
                                    <div className="sb-nav-link-icon">
                                        <i className="fas fa-envelope-open"></i>
                                    </div>
                                    View messages
                                </Link>
                            )}
                            {getPermission(globalValues.permissions, 'create_messages') && (
                                <Link className="nav-link custom-toggler" to="/admin/send-message">
                                    <div className="sb-nav-link-icon">
                                        <i className="fas fa-envelope"></i>
                                    </div>
                                    Send message
                                </Link>
                            )}
                        </nav>
                    </div>
                </div>
            </div>
        </nav>
    );
};
export default SideBar;
