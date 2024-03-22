import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { Context } from '../../../contexts/globalContext';
import { getPermission, split_errors } from '../../../util';

function EditApi(props) {
    let api_id = props.match.params.id;
    const [textInput, setTextInput] = useState([]);
    const { globalValues } = React.useContext(Context);

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };


    const submitApi = (e) => {
        e.preventDefault();

        
        axios.post(`/api/update-api/${api_id}`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error',split_errors(res?.data.errors), 'error');
            }
            
        });
    };

    useEffect(() => {
        

        axios.get(`/api/get-api/${api_id}`).then((res) => {
            if (res?.data.status === 200) {
                setTextInput({...textInput, ...res?.data.api});
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
                            <form onSubmit={submitApi}>                        
                                <div className="form-group mb-3">
                                    <label>Api Name</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="text"
                                        name="api_name"
                                        onChange={handleInput}
                                        value={textInput.api_name}
                                        className="form-control"
                                        required
                                    />
                                </div>

                                <div className="form-group mb-3">
                                    <label>Api Key</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="text"
                                        name="api_key"
                                        onChange={handleInput}
                                        value={textInput.api_key}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                <div className="form-group mb-3">
                                    <label>Api Secrete</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="text"
                                        name="api_secret"
                                        onChange={handleInput}
                                        value={textInput.api_secret}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                
                                <div className="form-group mb-3">
                                    <label>Api URL</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="url"
                                        name="api_url"
                                        onChange={handleInput}
                                        value={textInput.api_url}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                
                                <div className="form-group mb-3">
                                    <label>Api Contract Code</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="text"
                                        name="api_contract_code"
                                        onChange={handleInput}
                                        value={textInput.api_contract_code}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                
                                <div className="form-group mb-3">
                                    <label>API Charges</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_apis')}
                                        type="number"
                                        name="api_payment_charges"
                                        onChange={handleInput}
                                        value={textInput.api_payment_charges}
                                        className="form-control"
                                        required
                                    />
                                </div>

                                <button type="submit" disabled={!getPermission(globalValues.permissions, 'update_apis')} className="btn btn-primary px-4">
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default EditApi;
