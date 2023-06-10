import axios from 'axios';
import React, { useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../components/Global';

const Navbar = (ref) => {

    const [loading, setLoading] = useState();
    const history = useHistory();

    const logoutSubmit = (e) => {
        e.preventDefault();

        setLoading(true);
        axios.get('/sanctum/csrf-cookie').then((response) => {
            axios.post(`api/logout`).then((res) => {
                if (res.data.status === 200) {
                    localStorage.removeItem('auth_token');
                    localStorage.removeItem('auth_name');
                    swal('Success', res.data.message, 'success');
                    history.push('/login');
                }
                setLoading(false);
            });
        });
    };

    const handleSideBar = (e) => {
        e.persist();
        
        document.body.classList.toggle('sb-sidenav-toggled');
    };

    return (
        <nav className="sb-topnav navbar navbar-expand navbar-dark my-bg-primary">
            <Loader isActive={loading} />
            <Link className="navbar-brand ps-3" to="/collections">
                Home
            </Link>
            <button className="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" onClick={handleSideBar}>
                <i className="fas fa-bars"></i>
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
                                <Link className="dropdown-item" to="#!">
                                    Settings
                                </Link>
                            </li>
                            <li>
                                <Link className="dropdown-item" to="#!">
                                    Activity Log
                                </Link>
                            </li>
                            <li>
                                <hr className="dropdown-divider" />
                            </li>
                            <li>
                                <Link className="dropdown-item" to="#!" onClick={logoutSubmit}>
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
