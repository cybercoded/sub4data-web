import React from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';


const Navbar = () => {


    const handleSideBar = (e) => {
        e.persist();
        
        document.body.classList.toggle('sb-sidenav-toggled');
    };

    return (
        <nav className="sb-topnav navbar navbar-expand navbar-dark my-bg-primary">
            
            <Link className="navbar-brand ps-3" to="/collections">
            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60, height: 50 }} />
            </Link>
            <button className="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" onClick={handleSideBar}>
                <i className="fas fa-bars fa-2x"></i>
            </button>
            <div className='container'>
                <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li className="nav-item dropdown">
                    <span
                            className="nav-link dropdown-toggle"
                            id="navbarDropdown"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <i className="fas fa-user fa-fw"></i>
                        </span>
                        <ul className="dropdown-menu dropdown-menu-end" data-bs-target="#navbarDropdown" aria-labelledby="navbarDropdown">
                            <li>
                                <Link className="dropdown-item" to="/admin/activities">
                                    Activity Logs
                                </Link>
                            </li>
                            <li>
                                <hr className="dropdown-divider" />
                            </li>
                            <li>
                                <Link className="dropdown-item" to="/logout">
                                    Logout
                                </Link>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    );
};

export default Navbar;
