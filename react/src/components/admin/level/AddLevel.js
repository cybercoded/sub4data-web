import axios from 'axios';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../Global';

function AddLevel() {
    const [loading, setLoading] = useState(false);
    const [textInput, setTextInput] = useState({
        name: '',
        level: '',
        percentage: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };


    const submitLevel = (e) => {
        e.preventDefault();

        setLoading(true);
        axios.post(`/api/store-level`, textInput).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                swal('Error', JSON.stringify(res.data.errors), 'error');
            }
            setLoading(false);
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className='row'>
                <div className="col-md-6">
                    <div className="card mt-4">
                        <Loader isActive={loading} />
                        <div className="card-header">
                            <h4>
                                Add Level |
                                <Link to="/admin/view-levels" className="btn btn-primary btn-sm float-end">
                                    View Levels
                                </Link>
                            </h4>
                        </div>
                        <div className="card-body">
                            <form onSubmit={submitLevel}>                        
                                <div className="form-group mb-3">
                                    <label>Name</label>
                                    <input
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={textInput.name}
                                        className="form-control"
                                        required
                                    />
                                </div>
                                
                                <div className="form-group mb-3">
                                    <label>Level</label>
                                    <input
                                        type="number"
                                        name="level"
                                        onChange={handleInput}
                                        value={textInput.level}
                                        className="form-control"
                                        required
                                    />
                                </div>
                            
                                <div className="form-group mb-3">
                                    <label>Percentage</label>
                                    <input
                                        type="number"
                                        name="percentage"
                                        onChange={handleInput}
                                        value={textInput.percentage}
                                        className="form-control"
                                        required
                                    />
                                </div>

                                <button type="submit" className="btn btn-primary px-4 float-end">
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

export default AddLevel;
