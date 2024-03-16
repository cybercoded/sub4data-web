import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

import Swal from "sweetalert2";

function EditUser(props){
    const user_id = props.match.params.id;
    
    const [textInput, setTextInput] = useState([]);

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleProfileUpdate = (e) => {        
        e.preventDefault();

        axios.post(`api/update-user/${textInput.id}`, textInput).then((res) => {
            if (res?.data.status === 200) {

                Swal.fire('Success!', 'Profile data successfully updated', 'success').then(() => {
                    window.location.reload();
                });

            }else {
                Swal.fire('Unable to update!', 'Something went wrong, try again', 'error');
            }
            
        });
    };

    useEffect(() => {

        axios.get(`api/get-user/${user_id}`).then((res) => {
            if (res?.data.status === 200) {
                setTextInput(res?.data.data);
            }
            
        });
    }, [user_id]);


    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Profile</b> Update /
            </div>
            <div className="card">
                <div className="card-body">
                    <ul className="nav nav-tabs" id="myTab" role="tablist">
                        <li className="nav-item" role="presentation">
                            <button
                                className="nav-link active"
                                id="home-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#home"
                                type="button"
                                role="tab"
                                aria-controls="home"
                                aria-selected="true"
                            >
                                User profile
                            </button>
                        </li>
                        <li className="nav-item" role="presentation">
                            <Link
                                to={`/admin/transactions/${user_id}`}
                                className="nav-link"
                                id="otherdetails-tab"
                                type="button"
                            >
                                User transactions
                            </Link>
                        </li>
                    </ul>
                    <div className="tab-content" id="myTabContent">
                        <div className="card">
                            <div className="card-body">
                                <form className="row" onSubmit={handleProfileUpdate}>
                                    <div className="col-md-6">
                                        <div className='form-group mb-3'>
                                            <label>Email ID</label>
                                            <input type='text' name="email"  value={textInput.email} onChange={handleInput} className='form-control' ></input>
                                        </div>
                                    </div>

                                     <div className="col-md-6">
                                        <div className='form-group mb-3'>
                                            <label>Full Name</label>
                                            <input type='text' name="name" onChange={handleInput} value={textInput.name} className='form-control' ></input>
                                        </div>
                                    </div>

                                    <div className="col-md-4">
                                        <div className="custom-control custom-checkbox mb-3">
                                            <span>Status</span>
                                            <input 
                                                type="checkbox"
                                                className="custom-control-input" 
                                                name="status"
                                                id="admin-edit-status"
                                                checked={textInput.status === 1} 
                                                onChange={e => 
                                                    setTextInput({...textInput, status: e.target.checked ? 1 : 0})
                                                } 
                                            />
                                            <label htmlFor="admin-edit-status"></label>
                                            <br />
                                            <small className="text-info">Status checked = Active / Unchecked = Inactive</small>
                                        </div>
                                    </div>
                                    
                                    <div className="col-md-4">
                                        <div className="custom-control custom-checkbox mb-3">
                                            <span>Role</span>
                                            <input
                                                name="role_as"
                                                type="checkbox"
                                                id="admin-edit-role"
                                                className="custom-control-input" 
                                                checked={textInput.role_as  === 1} 
                                                onChange={e => 
                                                    setTextInput({...textInput, role_as: e.target.checked ? 1 : 0})
                                                } 
                                            />
                                            <label htmlFor="admin-edit-role"></label>
                                            <br />
                                            <small className="text-info">Status checked = Admin / Unchecked = User</small>
                                        </div>
                                    </div>

                                    <div className="col-md-4">
                                        <div className="custom-control custom-checkbox mb-3">
                                            <span>Password reset</span>
                                            <input
                                                name="password"
                                                type="checkbox"
                                                id="admin-edit-password"
                                                checked={textInput.password} 
                                                className="custom-control-input" 
                                                onChange={(e) => {
                                                    e.preventDefault();
                                                    Swal.fire({

                                                        title: 'Are you sure?',
                                                        text: "Are you sure you want to reset this user's password?",
                                                        icon: 'warning',
                                                        buttons: true,
                                                        dangerMode: true
                                                    }).then((willDelete) => {
                                                        if (willDelete) {
                                                            setTextInput({...textInput, password: true});
                                                        } else {
                                                            setTextInput({...textInput, password: false});
                                                        }
                                                    });
                                                }}
                                            />
                                            <label htmlFor="admin-edit-password"></label>
                                            <br />
                                            <small className="text-info">Password checked = Reset</small>
                                        </div>
                                    </div>

                                    <div className="col-md-12">
                                        <div className='form-group mb-3'>
                                            <button type='submit' className='btn btn-primary'>Update User</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    );
}


export default EditUser;