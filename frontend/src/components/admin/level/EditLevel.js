import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';


function EditLevel(props) {
    let level_id = props.match.params.id;
    const [checkbox, setCheckbox] = useState();
    const [textInput, setTextInput] = useState({
        name: '',
        level: '',
        percentage: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked);
    };


    const submitLevel = (e) => {
        e.preventDefault();

        
        axios.post(`/api/update-level/${level_id}`, {...textInput, status: checkbox}).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                swal('Error', JSON.stringify(res.data.errors), 'error');
            }
            
        });
    };

    useEffect(() => {       

        axios.get(`/api/get-level/${level_id}`).then((res) => {
            if (res.data.status === 200) {
                setTextInput({...textInput, ...res.data.level});
                setCheckbox(res.data.level.status === 1 ? true : false);
            } else {
                swal('Error', res.data.errors, 'error');
            }
            
        });
    }, [level_id, textInput]);

    return (
        <div className="container-fluid px-4">
            <div className='row'>
                <div className="col-md-6">
                    <div className="card mt-4">
                        
                        <div className="card-header">
                            <h4>
                                Edit Level |
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
                                
                                <div className="form-group mb-3">
                                    <label>Status</label>
                                    <input
                                        type="checkbox"
                                        name="status"
                                        onChange={handleCheckBox}
                                        onClick={handleCheckBox}
                                        defaultChecked={checkbox}
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

export default EditLevel;
