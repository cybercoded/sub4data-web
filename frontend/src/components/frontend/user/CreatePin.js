import axios from "axios";
import React, { useState } from "react";
import Swal from "sweetalert2";
import { useHistory } from 'react-router-dom';
import { BreadCombs } from "../../../util";


function CreatePin(){
    const history = useHistory();
    const [textInput, setTextInput] = useState({
        newPin: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleTransactionPIN = (e) => {        
        e.preventDefault();

        if (textInput.newPin === '') {
            Swal.fire('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.newPin.length !== 4) {
            Swal.fire('Error!', 'PIN should be 4 Digits', 'error');
            return;
        }
           
        
        
        axios.put(`/api/update-pin/`, {pin: textInput.newPin}).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success!', 'Transaction PIN successfully created','success').then((result) => {
                   history.push('/user/dashboard');
                });
            }
            
        });
    };

    return (
        <div className="container mt-5">
            <BreadCombs crumbs={['user/dashboard', 'user/create-pin']} />
            <div className="d-flex justify-content-center">             
                <form onSubmit={handleTransactionPIN} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">
                    <div className='form-group mb-3'>
                        <label>New PIN</label>
                        <input type='number' name="newPin" onChange={handleInput} value={textInput.newPin} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Create PIN</button>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default CreatePin;