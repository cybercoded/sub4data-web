import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link, useHistory} from 'react-router-dom';
import swal from 'sweetalert';
const SideBar = () => {

    const history = useHistory();

    const [categoryList, setCategoryList] = useState([]);

    useEffect(()=>{
        axios.get(`api/view-category`).then(res=>{
            if(res.status===200){
                setCategoryList(res.data.category);
            }
        })
    },[]);

    return (
        <nav className="sb-sidenav border border-top-0 border-bottom-0 border-secondary sb-sidenav-light">
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
                    {   categoryList.map((item, index) => (
                        <div className="nav-item" key={index}>
                            <Link className={`nav-link ${ item.slug === window.location.href.split('/')[5] && 'active' }`}to={`/user/services/${item.slug}/${item.id}`} >
                                <div className="sb-nav-link-icon">
                                    <img src={`http://localhost:8000/${item.image}`} width="20" height="20" alt={item.name}/>
                                </div>
                                {item.name}
                            </Link>
                        </div>
                        ))
                    }

                    <div className="sb-sidenav-menu-heading">
                        Menu
                    </div>
                    <Link className={`nav-link ${ 'fund-wallet' === window.location.href.split('/')[4] && 'active' }`} to="/user/fund-wallet">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-bank"></i>
                        </div>
                        Fund Wallet
                    </Link>
                    <Link className={`nav-link ${ 'withdraw-fund' === window.location.href.split('/')[4] && 'active' }`} to="/user/withdraw-fund">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-wallet"></i>
                        </div>
                        Withdraw Funds
                    </Link>
                    
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
                        className="nav-link collapsed"
                        to="#"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapseSettings"
                        aria-expanded="false"
                        aria-controls="collapseSettings"
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
                            <Link className="nav-link" to="/profile">
                                Update Profile
                            </Link>
                            <Link className="nav-link" to="/update-pin">
                                Update Transaction PIN
                            </Link>
                            <Link className="nav-link" to="/update-password">
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
