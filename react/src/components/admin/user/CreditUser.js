import axios from "axios";
import React, { useState } from "react";
import swal from "sweetalert";
import { Loader } from "../../Global";

function CreditUser(){

    const [loading, setLoading] = useState(false);
    const [textInput, setTextIput] = useState({
        id: '',
        email: 'cafeat9ja@gmail.com',
        amount: '100'
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleInputEmail = (e) => {
        e.persist();
        setLoading(true);
        axios.get(`/api/verify-email/${textInput.email}`).then((res) => {
            setTextIput({ ...textInput, user_id: res.data.user_id });
        });
    };

    const handleTransactionPIN = (e) => {        
        e.preventDefault();

        if (textInput.amount === '' || textInput.email === '') {
            swal('Error!', 'Please fill all fields', 'error');
            return;
        }
        if (textInput.amount > 5000) {
            swal('Error!', 'Amount should not be greater than 5,000', 'error');
            return;
        }
           
       
        swal({
            title: "Are you sure?",
            text: "Are you sure you want to credit this user with ".textInput.amount,
            icon: "warning",
            buttons: true,
            dangerMode: true
        }).then((willDelete) => {
            if (willDelete) {
                setLoading(true);
                axios.put(`/api/credit-user/`, {pin: textInput.newPin}).then((res) => {
                    if (res.data.status === 200) {
                        swal('Sucess!', `${textInput.email} was successfully credired`,'success').then((result) => {
                            window.location.reload();
                        });
                    }
                    setLoading(false);
                });
            }
        });
    };

    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Credit</b> User /
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />

                <form onSubmit={handleTransactionPIN}>

                    <div className='form-group mb-3'>
                        <label>User Email</label>
                        <input type='email' name="email" onChange={handleInputEmail} value={textInput.email} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <label>Amount</label>
                        <input type='float' name="amount" onChange={handleInput} value={textInput.amount} className='form-control' ></input>
                    </div>

                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Credit User</button>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default CreditUser;