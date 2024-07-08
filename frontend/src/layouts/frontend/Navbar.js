import React from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';

import { Context } from '../../contexts/globalContext';
import { logOutFunction } from '../../util';
function Navbar() {

    const { setGlobalValues } = React.useContext(Context);

    const [notification] = React.useState(
        JSON.parse(localStorage.getItem('notification')) || ''
    );

    const logOut = () => {
        const parsedUrl = new URL(window.location.href);
        const path = parsedUrl.pathname + parsedUrl.search;
    
        setGlobalValues({lastPageBeforeLogout: path})

        logOutFunction()
    }

    const handleSideBar = (e) => {
        e.persist();

        document.body.classList.toggle('sb-sidenav-toggled');
        document.getElementById('layoutSidenav_content').classList.toggle('overlay-all');
    };

    return (
        <nav className="sb-topnav navbar navbar-expand navbar-dark my-bg-primary fixed-top">
            
            <div className="container">
                <button className="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" onClick={handleSideBar}>
                    <i className="fas fa-bars fa-2x"></i>
                </button>
            </div>
            <div className="container">
                <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li className="nav-item dropdown">
                        <span
                            className="nav-link dropdown-toggle"
                            id="navbarNotification"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <i className="fas fa-bell fa-lg"></i>
                        </span>
                        <ul className="dropdown-menu dropdown-menu-end" data-bs-target="#navbarNotification" aria-labelledby="navbarNotification">
                            {notification.message ?
                                <li role='button' onClick={() => Swal.fire(notification.message) } className="dropdown-item">
                                    {notification.title}
                                </li>
                                :
                                <li role='button' className="dropdown-item">
                                    0 notification
                                </li>
                            }
                        </ul>
                    </li>
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
                                <Link className="dropdown-item" to="/user/profile">
                                    Settings
                                </Link>
                            </li>
                            <li>
                                <hr className="dropdown-divider" />
                            </li>
                            <li>
                                <Link className="dropdown-item" onClick={logOut} to="/login">
                                    Logout
                                </Link>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    );
}

export default Navbar;
