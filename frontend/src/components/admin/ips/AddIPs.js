import axios from 'axios';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { getPermission, split_errors } from '../../../util';
import { Context } from '../../../contexts/globalContext';

function AddIPs() {
    const [textInput, setTextInput] = useState([]);
    const { globalValues } = React.useContext(Context);

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };


    const submitIP = (e) => {
        e.preventDefault();
        
        axios.post(`/api/store-ips`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error', split_errors(res?.data.errors), 'error');
            }
            
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className='row'>
                <div className="col-md-6">
                    <div className="card mt-4">
                        
                        <div className="card-header">
                            <h4>
                                Add IP |
                                <Link to="/admin/view-IPs" className="btn btn-primary btn-sm float-end">
                                    View APIs
                                </Link>
                            </h4>
                        </div>
                        <div className="card-body">
                            <form onSubmit={submitIP}>                        
                                <div className="form-group mb-3">
                                    <label>User's email address</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_ips')}
                                        type="text"
                                        name="email"
                                        onChange={handleInput}
                                        value={textInput.email}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                <div className="form-group mb-3">
                                    <label>IP address</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_ips')}
                                        type="text"
                                        name="ip"
                                        onChange={handleInput}
                                        value={textInput.ip}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                <button type="submit" disabled={!getPermission(globalValues.permissions, 'create_ips')} className="btn btn-primary px-4">
                                    Whitelist this IP
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default AddIPs;
