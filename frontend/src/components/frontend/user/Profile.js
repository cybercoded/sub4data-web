import axios from "axios";
import React, { useEffect, useState } from "react";
import Swal from "sweetalert2";
import { BreadCombs } from "../../../util";


function Profile(){

    const [checkboxes, setCheckboxes] = useState(false);
    const [textInput, setTextInput] = useState({
        name: '',
        email: '',
        mfa: 0
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleCheckBox = (e) => {
        e.persist();
        setCheckboxes(e.target.checked);
    };

    const handleProfileUpdate = (e) => {        
        e.preventDefault();
        
        axios.post(`api/update-user`, {name: textInput.name, email: textInput.email, mfa: textInput.mfa}).then((res) => {
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
        axios.get(`api/user/`).then((res) => {
            if (res?.status === 200) {
                setTextInput(res.data.data);
            }
        });
    }, []);  


    return (
        <div className="container mt-5">
            <BreadCombs crumbs={['user/dashboard', 'user/profile']} />
            <div className="d-flex justify-content-center">
                <form onSubmit={handleProfileUpdate} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">
                    <div className="alert border-bottom d-flex align-items-center">
                        <span>Enable Multi-factor Authentication</span>
                        <input 
                            type='checkbox' 
                            id='mfa' 
                            title='Select this role' 
                            name='mfa'  
                            checked={textInput.mfa === 1}
                            onChange={e => 
                                setTextInput({...textInput, mfa: e.target.checked ? 1 : 0})
                            } 
                        />
                        <label htmlFor='mfa'></label>
                    </div>
                    <div className='form-group mb-3'>
                        <label>Email ID</label>
                        <input type='text' name="email"  value={textInput.email} disabled className='form-control' ></input>
                        <small className="text-info">Your email cannot be changed</small>
                    </div>

                    <div className='form-group mb-3'>
                        <label>Full Name</label>
                        <input type='text' name="name" onChange={handleInput} value={textInput.name} className='form-control' ></input>
                        <small className="text-danger">{textInput.error_list?.name}</small>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Update profile</button>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default Profile;