import axios from "axios";
import React, { useEffect, useState } from "react";
import Swal from "sweetalert2";


function Profile(){

    const [checkboxes, setCheckboxes] = useState(false);
    const [textInput, setTextInput] = useState({
        name: '',
        email: ''
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

        
        axios.post(`api/update-user`, {name: textInput.name, mfa: checkboxes}).then((res) => {
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
                setTextInput(res?.data.data);
            }            
        });
    }, [textInput.mfa]);


    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Profile</b> Update /
            </div>
            <div className="bg-light card card-body col-md-6">
                

                <form onSubmit={handleProfileUpdate}>
                    <div>
                        <input type='checkbox' id='mfa' title='Select this role' name='mfa' onChange={handleCheckBox} defaultChecked={textInput.mfa === 1} />
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