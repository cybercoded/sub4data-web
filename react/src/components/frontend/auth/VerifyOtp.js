import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import Toastify from 'toastify-js';

function VerifyOtp(props) {
    const email = props.match.params.email;
    const history=useHistory();
    const [textInput, setTextInput] = useState({
        email: email,
        otp:'',
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        
        axios.put(`/api/api/resend-otp/`, {email: textInput.email}).then((res) => {
            if (res.data.status === 200) {
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
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            
        });
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
        
        
        axios.put(`/api/verify-otp-and-reset/`, textInput).then((res) => {
            if (res.data.status === 200) {
                swal.stopLoading();
                swal('Success!', "OTP verified",'success').then(() => {
                    history.push(`/new-password/${textInput.email}/${textInput.otp}`);
                });
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            
        });
    }


    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='card col-md-4 col-lg-3 col-10'>
                        
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
                            <h4>Enter OTP Sent to <span className='text-info'> {email}</span></h4>
                        </Link>                        
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
                                    <div className="text-center mb-0">
                                        <Link to="#" onClick={handleResend}>Resend OTP</Link>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}


export default VerifyOtp;