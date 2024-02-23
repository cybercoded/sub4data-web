import axios from "axios";
import React, { useState } from "react";
import swal from "sweetalert";
import { Link } from "react-router-dom";
function UpdatePassword(){

    const [textInput, setTextInput] = useState({
        oldPassword: '',
        newPassword: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleTransactionPassword = (e) => {        
        e.preventDefault();

        if (textInput.oldPassword === '' || textInput.newPassword === '') {
            swal('Error!', 'Please fill all fields', 'error');
            return;
        }
           
        
        axios.get(`/api/verify-password/${textInput.oldPassword}`).then((res) => {
            if (res.data.status === 200) {
                
                swal({
                    title: "Are you sure?",
                    text: "Are you sure you want to change your Transaction Password!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                }).then((willDelete) => {
                    if (willDelete) {
                        
                        axios.put(`/api/update-password/`, {password: textInput.newPassword}).then((res) => {
                            if (res.data.status === 200) {
                                swal('Success!', 'Password successfully updated','success').then((result) => {
                                    window.location.reload();
                                });
                            }
                            
                        });
                    }
                });
            }else {
                swal('Error!', 'Incorrect Old Password, try again', 'error');
            }
            
        });
    };

    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Paswword</b> update /
            </div>
            <div className="bg-light card card-body col-md-6">

                <form onSubmit={handleTransactionPassword}>

                    <div className='form-group mb-3'>
                        <label>Current Password</label>
                        <input type='text' name="oldPassword" onChange={handleInput} value={textInput.oldPassword} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>New Password</label>
                        <input type='text' name="newPassword" onChange={handleInput} value={textInput.newPassword} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Update Password</button>
                    </div>

                    <Link to='/reset'>Forgot my old password</Link>
                </form>
            </div>
        </div>

    );
}


export default UpdatePassword;