import axios from "axios";
import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import swal from "sweetalert";


function UpdatePin(){
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
        
        axios.get(`/api/reset-pin/`).then((res) => {
            if (res.data.status === 200) {
                swal('Success!', `Verification code sent to ${textInput.email}`,'success').then(() => {
                    history.push(`/user/pin-verify-otp`);
                });
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            
        });
    }


    const handleTransactionPIN = (e) => {        
        e.preventDefault();

        if (textInput.oldPin === '' || textInput.newPin === '') {
            swal('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.oldPin.length !== 4 || textInput.newPin.length !== 4) {
            swal('Error!', 'PIN should be 4 Digits', 'error');
            return;
        }
           
        
        axios.get(`/api/verify-pin/${textInput.oldPin}`).then((res) => {
            if (res.data.status === 200) {
                
                swal({
                    title: "Are you sure?",
                    text: "Are you sure you want to chnage your Transaction PIN!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                }).then((willDelete) => {
                    if (willDelete) {
                        
                        axios.put(`/api/update-pin/`, {pin: textInput.newPin}).then((res) => {
                            if (res.data.status === 200) {
                                swal('Success!', 'Transaction PIN successfully updated','success').then((result) => {
                                    window.location.reload();
                                });
                            }
                            
                        });
                    }
                });
            }else {
                swal('Error!', 'Incorrect Old PIN, try again', 'error');
            }
            
        });
    };

    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Transaction</b> PIN /
            </div>
            <div className="bg-light card card-body col-md-6">
                

                <form onSubmit={handleTransactionPIN}>

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

                    <button type="button" className="btn btn-secondary" onClick={handleReset}>Reset PIN</button>
                </form>
            </div>
        </div>

    );
}


export default UpdatePin;