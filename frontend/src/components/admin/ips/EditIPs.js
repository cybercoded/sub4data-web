import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { Context } from '../../../contexts/globalContext';
import { getPermission, split_errors } from '../../../util';

function EditIPs(props) {
    let api_id = props.match.params.id;
    const [textInput, setTextInput] = useState([]);
    const [checkbox, setCheckbox] = useState();
    const { globalValues } = React.useContext(Context);

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked);
        console.log(e.target.checked)
    };


    const submitIP = (e) => {
        e.preventDefault();
        
        axios.put(`/api/update-ip/${api_id}`, {...textInput, status: checkbox}).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error', split_errors(res?.data.errors), 'error');
            }
            
        });
    };

    useEffect(() => {       

        axios.get(`/api/view-ip/${api_id}`).then((res) => {
            if (res?.data.status === 200) {
                setTextInput({...textInput, ...res.data.whitelist});
                setCheckbox(res.data.whitelist.status === 1 ? true : false);
            } else {
                Swal.fire('Error', res?.data.errors, 'error');
            }
            
        });
    }, [api_id]);

    return (
        <div className="container-fluid px-4">
            <div className='row'>
                <div className="col-md-6">
                    <div className="card mt-4">
                        
                        <div className="card-header">
                            <h4>
                                Edit Api |
                                <Link to="/admin/view-apis" className="btn btn-primary btn-sm float-end">
                                    View Apis
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
                                <div className="form-group mb-3">
                                    <span>Block / Unblock</span>
                                    <input
                                        name="status"
                                        type="checkbox"
                                        id="block-or-unblock"
                                        className="custom-control-input" 
                                        onChange={handleCheckBox}
                                        defaultChecked={checkbox}
                                    />
                                    <label htmlFor="block-or-unblock"></label>
                                </div>
                                <button type="submit" disabled={!getPermission(globalValues.permissions, 'create_ips')} className="btn btn-primary px-4">
                                    Update this IP whitelist
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default EditIPs;
