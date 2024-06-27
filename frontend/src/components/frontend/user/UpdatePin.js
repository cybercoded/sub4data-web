import axios from "axios";
import React, { useState } from "react";
import { Link, useHistory } from "react-router-dom";
import Swal from "sweetalert2";
import { Context } from "../../../contexts/globalContext";
import { BreadCombs } from "../../../util";


function UpdatePin(){
    const {globalValues} = React.useContext(Context);

    const history = useHistory();
    const [textInput, setTextInput] = useState({
        oldPin: '',
        newPin: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleReset = (e) => {
        axios.put(`/api/public/send-otp/`, {email: globalValues.user?.email}).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success!',res.data.message,'success').then(() => {
                    history.push(`/user/pin-verify-otp`);
                });
            }else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }
            
        });
    }


    const handleTransactionPIN = (e) => {        
        e.preventDefault();

        if (textInput.oldPin === '' || textInput.newPin === '') {
            Swal.fire('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.oldPin.length !== 4 || textInput.newPin.length !== 4) {
            Swal.fire('Error!', 'PIN should be 4 Digits', 'error');
            return;
        }
           
        axios.get(`/api/verify-pin/${textInput.oldPin}`).then((res) => {
            if (res?.data.status === 200) {
                
                Swal.fire({
                    title: "Are you sure?",
                    text: "Are you sure you want to change your Transaction PIN!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                }).then((res) => {
                    if (res.isConfirmed) {
                        
                        axios.put(`/api/update-pin/`, {pin: textInput.newPin}).then((res) => {
                            if (res?.data.status === 200) {
                                Swal.fire('Success!', 'Transaction PIN successfully updated','success').then((result) => {
                                    window.location.reload();
                                });
                            }
                            
                        });
                    }
                });
            }else {
                Swal.fire('Error!', 'Incorrect Old PIN, try again', 'error');
            }
            
        });
    };

    return (
        <div className="container mt-5">
           <BreadCombs crumbs={['user/dashboard', 'user/update-pin']} />
           <div className="d-flex justify-content-center">
                <form onSubmit={handleTransactionPIN} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">

                    <div className='form-group mb-3'>
                        <label>Current PIN</label>
                        <input type='number' name="oldPin" onChange={handleInput} value={textInput.oldPin} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>New PIN</label>
                        <input type='number' name="newPin" onChange={handleInput} value={textInput.newPin} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Update PIN</button>
                    </div>

                    <Link to="" type="button" onClick={handleReset}>Reset PIN</Link>
                </form>
            </div>
        </div>

    );
}


export default UpdatePin;