import axios from 'axios';
import React from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';
function Navbar() {
    const history = useHistory();

    const [notification, setNotification] = React.useState(
        JSON.parse(localStorage.getItem('notification')) || ''
    );

    const logoutSubmit = (e) => {
        e.preventDefault();
        
        axios.post(`api/logout`).then((res) => {
            if (res.data.status === 200) {
                localStorage.removeItem('auth_token');
                localStorage.removeItem('auth_name');
                swal({
                    icon: 'success',
                    title: 'Success',
                    text: "Account successfully logged out",
                    timer: 2000
                }).then(() => {
                    history.push('/login');
                });
            } else {
                swal('Error', res.data.errors, 'error');
            }            
        });
    };

    const handleSideBar = (e) => {
        e.persist();

        document.body.classList.toggle('sb-sidenav-toggled');
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
                            <li role='button' onClick={() => swal(notification.message) } className="dropdown-item">
                                {notification.title}
                            </li>
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
                                <Link className="dropdown-item" to="#" onClick={logoutSubmit}>
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
