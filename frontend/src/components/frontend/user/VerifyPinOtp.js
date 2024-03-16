import React, {useState} from 'react';
import Swal from 'sweetalert2';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { toastifyFunction } from '../../../util';

function VerifyPinOtp(props) {
    const history=useHistory();
    const [textInput, setTextInput] = useState({
        otp:''
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        
        axios.get(`/api/reset-pin/`).then((res) => {
            toastifyFunction("OTP was resent to you");
            
        });
    }
    
    const handleVerify = (e)=>{   
        e.preventDefault();        
       
        if(textInput.otp === ''){
            Swal.fire('Error!', 'Please enter OTP', 'error');
            return;
        }
        if(textInput.otp.length > 5 || textInput.otp.length < 5){
            Swal.fire('Error!', 'OTP must 5 digits', 'error');
            return;
        }
        
        
        axios.put(`/api/verify-otp-and-reset-pin/`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.stopLoading();
                Swal.fire('Success!', "OTP successfully verified",'success').then(() => {
                    history.push(`/user/create-pin`);
                });
            }else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }
            
        });
    }


    return(
        <div className="container mt-5">
            <div className="text-muted mb-4 pb-4 border-bottom">
                <b>OTP</b> Verification |
            </div>
            <div className="bg-light card card-body col-md-6">
                               
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