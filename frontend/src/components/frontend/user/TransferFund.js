import axios from "axios";
import React, { useState } from "react";
import Swal from "sweetalert2";
import { useHistory } from "react-router-dom";


function TransferFund(){
    const history = useHistory();
    const [textInput, setTextInput] = useState({
        user_id: '',
        email: '',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleDebitTransaction = (e) => {        
        e.preventDefault();

        if (textInput.amount === '' || textInput.email === '') {
            Swal.fire('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.amount > 5000) {
            Swal.fire('Error!', 'Amount should not be greater than 5,000', 'error');
            return;
        }
           
        
        axios.get(`/api/verify-email/${textInput.email}`).then((res) => {
            if (res?.data.status === 200) {                
                Swal.fire({

                    title: res?.data.data.name,
                    text: `Are you sure you want to credit this user with ${textInput.amount}`,
                    icon: "warning",
                    buttons: true,
                    dangerMode: true
                }).then((res) => {
                    if (res.isConfirmed) {
                        
                        axios.put(`/api/transfer-fund/`, {...textInput, user_id: res?.data.data.user_id}).then((res2) => {
                            if (res2.data.status === 200) {
                                Swal.fire('Success!', `${res?.data.data.name} was successfully credited`,'success').then((result) => {
                                    history.push('/user/dashboard');
                                });
                            } else {
                                Swal.fire('Error!', res2.data.errors, 'error');
                            }
                            
                        });
                    }
                });
            } else {                
                Swal.fire('Error!', res?.data.errors, 'error');
            }
            
        });
    };

    return (
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>Transfer</b> Fund /
            </div>
            <div className="bg-light card card-body col-md-6">
                

                <form onSubmit={handleDebitTransaction}>

                    <div className='form-group mb-3'>
                        <label>User Email</label>
                        <input type='email' name="email" onChange={handleInput} value={textInput.email} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>Amount</label>
                        <input type='float' name="amount" onChange={handleInput} value={textInput.amount} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default TransferFund;