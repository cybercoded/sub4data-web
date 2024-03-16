import React from 'react';
import { Link } from 'react-router-dom';
import { Context } from '../../contexts/globalContext';
import { logOutFunction } from '../../util';


const Navbar = () => {

    const { setGlobalValues } = React.useContext(Context);

    const handleSideBar = (e) => {
        e.persist();
        document.body.classList.toggle('sb-sidenav-toggled');
    };

    const logOut = () => {
        const parsedUrl = new URL(window.location.href);
        const path = parsedUrl.pathname + parsedUrl.search;
    
        setGlobalValues({lastPageBeforeLogout: path})

        logOutFunction()
    }

    return (
        <nav className="sb-topnav navbar navbar-expand navbar-dark my-bg-primary">
            
            <Link className="navbar-brand ps-3" to="/admin/dashboard">
                <img src={`${process.env.REACT_APP_URL}img/logo.png`} alt="" style={{ width: 60, height: 50 }} />
            </Link>
            <button className="btn btn-link btn-sm order-1 text-white order-lg-0 me-4 me-lg-0" onClick={handleSideBar}>
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
};

export default Navbar;
