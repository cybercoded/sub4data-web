import axios from 'axios';
import React from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';

function Navbar() {

    return (
        <nav className="navbar navbar-light border-bottom sticky-top">
            <div className="container">
                <Link className="navbar-brand" to="#">
                    <h3>Quick Sub</h3>
                </Link>
            </div>
        </nav>
    );
}

export default Navbar;
