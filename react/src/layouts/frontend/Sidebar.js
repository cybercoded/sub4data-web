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
        <nav className="sb-sidenav d-visible navbar-collapse accordion border border-top-0 border-bottom-0 border-secondary sb-sidenav-light" id="sidenavAccordion" data-bs-target="#navbarDropdown">
            <div className="sb-sidenav-menu">
                <div className="nav">
                    <div className="sb-sidenav-menu-heading">
                        Menu
                    </div>
                    <Link className={`nav-link ${ 'dashboard' === window.location.href.split('/')[3] && 'active' }`} to="/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-tachometer-alt"></i>
                        </div>
                        Dashboard
                    </Link>
                    <Link className={`nav-link ${ 'profile' === window.location.href.split('/')[3] && 'active' }`} to="/profile">
                        <div className="sb-nav-link-icon">
                            <i className="far fa-user"></i>
                        </div>
                        Profile
                    </Link>

                    <div className="sb-sidenav-menu-heading">
                        Our Services
                    </div>
                    {   categoryList.map((item, index) => (
                        <div className="nav-item" key={index}>
                            <Link className={`nav-link ${ item.slug === window.location.href.split('/')[4] && 'active' }`}to={`/services/${item.slug}/${item.id}`} >
                                <div className="sb-nav-link-icon">
                                    <img src={`http://localhost:8000/${item.image}`} width="20" height="20" alt={item.name}/>
                                </div>
                                {item.name}
                            </Link>
                        </div>
                        ))
                    }

                    <div className="sb-sidenav-menu-heading">Menu</div>
                    <Link className={`nav-link ${ 'dashboard' === window.location.href.split('/')[3] && 'active' }`} to="/dashboard">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-bank"></i>
                        </div>
                        Fund Wallet
                    </Link>
                    <Link className={`nav-link ${ 'profile' === window.location.href.split('/')[3] && 'active' }`} to="/profile">
                        <div className="sb-nav-link-icon">
                            <i className="fas fa-wallet"></i>
                        </div>
                        Withdraw Funds
                    </Link>
                    
                    <Link className={`nav-link ${ 'profile' === window.location.href.split('/')[3] && 'active' }`} to="/profile">
                        <div className="sb-nav-link-icon">
                            <i className="fa fa-arrow-right"></i>
                        </div>
                        Transfer Funds
                    </Link>
                </div>
            </div>
        </nav>
    );
};
export default SideBar;
