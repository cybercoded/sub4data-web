import axios from "axios";
import React, { useState } from "react";
import swal from "sweetalert";
import { useHistory } from 'react-router-dom';
import { Loader } from "../../Global";

function CreatePin(){
    const history = useHistory();
    const [loading, setLoading] = useState(false);
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
            swal('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.newPin.length !== 4) {
            swal('Error!', 'PIN should be 4 Digits', 'error');
            return;
        }
           
        setLoading(true);
        
        axios.put(`/api/update-pin/`, {pin: textInput.newPin}).then((res) => {
            if (res.data.status === 200) {
                swal('Success!', 'Transaction PIN successfully created','success').then((result) => {
                   history.push('/user/dashboard');
                });
            }
            setLoading(false);
        });
    };

    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Transaction</b> PIN /
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />

                <form onSubmit={handleTransactionPIN}>
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