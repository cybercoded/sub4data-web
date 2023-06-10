import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { Loader } from '../Global';
import Toastify from 'toastify-js';

function VerifyPinOtp(props) {
    const [loading, setLoading] = useState(false);
    const history=useHistory();
    const [textInput, setTextIput] = useState({
        otp:''
    });

    const handleInput = (e)=>{
        e.persist();
        setTextIput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        setLoading(true);
        if(loading === false){
            axios.get(`/api/reset-pin/`).then((res) => {
                Toastify({
                    text: "OTP was resent to you",
                    duration: 3000,
                    className: "info",
                    close: true,
                    gravity: "top", // `top` or `bottom`
                    position: "center", // `left`, `center` or `right`
                    stopOnFocus: true, // Prevents dismissing of toast on hover
                    offset: {
                        y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
                    },
                }).showToast();
                setLoading(false);
            });
        }
    }
    
    const handleVerify = (e)=>{   
        e.preventDefault();        
       
        if(textInput.otp === ''){
            swal('Error!', 'Please enter OTP', 'error');
            return;
        }
        if(textInput.otp.length > 5 || textInput.otp.length < 5){
            swal('Error!', 'OTP must 5 digits', 'error');
            return;
        }
        
        setLoading(true);
        axios.put(`/api/verify-otp-and-reset-pin/`, textInput).then((res) => {
            if (res.data.status === 200) {
                swal.stopLoading();
                swal('Sucess!', "OTP successfully verified",'success').then(() => {
                    history.push(`/user/create-pin`);
                });
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            setLoading(false);
        });
    }


    return(
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>OTP</b> Verification |
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />               
                <div className='card-body'>
                    <form onSubmit={handleVerify}>
                        <div className='form-group mb-3'>
                            <label>Enter OTP</label>
                            <input type='number' name="otp" onChange={handleInput} value={textInput.otp} className='form-control' ></input>
                        </div>
                        
                        <div className='form-group mb-3'>
                            <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                        </div>
                        
                        <div className='form-group mb-3'>
                            <div className="">
                                <Link to="#" onClick={handleResend}>Resend OTP</Link>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}


export default VerifyPinOtp;