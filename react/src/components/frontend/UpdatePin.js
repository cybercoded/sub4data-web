import axios from "axios";
import React, { useState } from "react";
import ReactjsOverlayLoader from "reactjs-overlay-loader";
import swal from "sweetalert";

function UpdatePin(){

    const [loading, setLoading] = useState(false);
    const [textInput, setTextIput] = useState({
        oldPin: '1111',
        newPin: '1111'
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };

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
           
        setLoading(true);
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
                        setLoading(true);
                        axios.put(`/api/update-pin/`, {pin: textInput.newPin}).then((res) => {
                            if (res.data.status === 200) {
                                swal('Sucess!', 'Transaction PIN successfully updated','success').then((result) => {
                                    window.location.reload();
                                });
                            }
                            setLoading(false);
                        });
                    }
                });
            }else {
                swal('Error!', 'Incorrect Old PIN, try again', 'error');
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
                <ReactjsOverlayLoader isActive={loading} 
                    icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
                />

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
                </form>
            </div>
        </div>

    );
}


export default UpdatePin;