import axios from "axios";
import React, { useState } from "react";
import Swal from "sweetalert2";
import { Link } from "react-router-dom";
import { BreadCombs, logOutFunction, passwordValidator } from "../../../util";
function UpdatePassword(){

    const [textInput, setTextInput] = useState({
        oldPassword: '',
        newPassword: '',
        newPassword2: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handlePasswordChange = (e) => {        
        e.preventDefault();

        if( passwordValidator(textInput.newPassword) !== "" ) {
            Swal.fire('Error!', passwordValidator(textInput.newPassword), 'error');
            return;
        }

        if (textInput.oldPassword === '' || textInput.newPassword === '') {
            Swal.fire('Error!', 'Please fill all fields', 'error');
            return;
        }

        if (textInput.newPassword !== textInput.newPassword2 ) {
            Swal.fire('Error!', 'Passwords did not match, try again!', 'error');
            return;
        }
        
        axios.get(`/api/verify-password/${textInput.oldPassword}`).then((res) => {
            if (res?.data.status === 200) {
                
                Swal.fire({

                    title: "Are you sure?",
                    text: "Are you sure you want to change your Password!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                }).then((res) => {
                    if (res.isConfirmed) {
                        
                        axios.put(`/api/update-password/`, {password: textInput.newPassword}).then((res) => {
                            if (res?.data.status === 200) {
                                Swal.fire('Success!', 'Password successfully updated','success').then((result) => {
                                    window.location.reload();
                                });
                            }
                            
                        });
                    }
                });
            }else {
                Swal.fire('Error!', 'Incorrect Old Password, try again', 'error');
            }
            
        });
    };

    return (
        <div className="container mt-5">
            <BreadCombs crumbs={['user/dashboard', 'user/update-password']} />
            <div className="d-flex justify-content-center">
                <form onSubmit={handlePasswordChange} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">

                    <div className='form-group mb-3'>
                        <label>Current Password</label>
                        <input type='password' name="oldPassword" onChange={handleInput} value={textInput.oldPassword} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>New Password</label>
                        <input type='password' name="newPassword" onChange={handleInput} value={textInput.newPassword} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>New Password Again</label>
                        <input type='password' name="newPassword2" onChange={handleInput} value={textInput.newPassword2} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Update Password</button>
                    </div>

                    <Link type="button" onClick={() => logOutFunction('reset') } to=''>Forgot my old password</Link>
                </form>
            </div>
        </div>

    );
}


export default UpdatePassword;