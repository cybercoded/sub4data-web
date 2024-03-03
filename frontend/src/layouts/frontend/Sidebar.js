import React from 'react';
import { Link } from 'react-router-dom';

import $ from 'jquery';
import { get_local_storage_item } from '../../util';

const SideBar = () => {

    const [categoryList] = React.useState(
        get_local_storage_item('category') || []
    );

    $('#my-sidebar').on('click', function() {
        if ($(window).width() < 768 ) {
            document.body.classList.remove('sb-sidenav-toggled');            
        }
    });

    return (
        <nav className="sb-sidenav border border-top-0 border-bottom-0 border-secondary sb-sidenav-light" id='my-sidebar'>
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <Link className={`nav-link ${ 'dashboard' === window.location.href.split('/')[4] && 'active' }`} to="/user/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>

                    <div className="sb-sidenav-menu-heading">
                        Our Services
                    </div>
                    {   categoryList?.map((item, index) => (
                        <div className="nav-item" key={index}>
                            <Link className={`nav-link ${ item.slug === window.location.href.split('/')[5] && 'active' }`}to={`/user/services/${item.slug}/${item.id}`} >
                                <div className="sb-nav-link-icon">
                                    <img src={`${process.env.REACT_APP_URL}${item.image}`} width="20" height="20" alt={item.name}/>
                                </div>
                                {item.name}
                            </Link>
                        </div>
                        ))
                    }

                    <div className="sb-sidenav-menu-heading">
                        Menu
                    </div>
                    <Link className={`nav-link ${ 'upgrade-account' === window.location.href.split('/')[4] && 'active' }`} to="/user/upgrade-account">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-user-plus"></i>
                        </div>
                        Upgrade Account
                    </Link>
                    <Link className={`nav-link ${ 'fund-wallet' === window.location.href.split('/')[4] && 'active' }`} to="/user/fund-wallet">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-bank"></i>
                        </div>
                        Fund Wallet
                    </Link>
                    {/* <Link className={`nav-link ${ 'withdraw-fund' === window.location.href.split('/')[4] && 'active' }`} to="/user/withdraw-fund">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-wallet"></i>
                        </div>
                        Withdraw Funds
                    </Link> */}
                    
                    <Link className={`nav-link ${ 'transfer-fund' === window.location.href.split('/')[4] && 'active' }`} to="/user/transfer-fund">
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-arrow-right"></i>
                        </div>
                        Transfer Funds
                    </Link>
                    <Link className={`nav-link ${ 'transactions' === window.location.href.split('/')[4] && 'active' }`} to="/user/transactions">
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-list"></i>
                        </div>
                        Transactions
                    </Link>

                    <div className="sb-sidenav-menu-heading">
                        Others
                    </div>
                    <Link
                        className={`nav-link  
                            ${window.location.href.split('/')[4] === 'profile' && 'active'}
                            ${window.location.href.split('/')[4] === 'update-pin' && 'active'}
                            ${window.location.href.split('/')[4] === 'update-password' && 'active'}
                        }`}
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseSettings"
                        aria-expanded="false"
                        aria-controls="collapseSettings"
                        id='settings-nav'
                    >
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-cog"></i>
                        </div>
                            Settings
                        <div className="sb-sidenav-collapse-arrow">
                            <i className="fas fa-angle-down"></i>
                        </div>
                    </Link>
                    <div className="collapse" id="collapseSettings" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav className="sb-sidenav-menu-nested nav">
                            <Link className="nav-link" to="/user/profile">
                                Update Profile
                            </Link>
                            <Link className="nav-link" to="/user/update-pin">
                                Update Transaction PIN
                            </Link>
                            <Link className="nav-link" to="/user/update-password">
                                Update Password
                            </Link>
                        </nav>
                    </div>
                </div>
            </div>
        </nav>
    );
};
export default SideBar;
