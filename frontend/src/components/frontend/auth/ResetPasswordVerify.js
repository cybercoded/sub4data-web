import React, {useState} from 'react';
import Swal from 'sweetalert2';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { toastifyFunction } from '../../../util';

function ResetPasswordVerify(props) {
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
        
        axios.put(`/api/public/api/resend-otp/`, {email: textInput.email}).then((res) => {
            if (res?.data.status === 200) {
                toastifyFunction("OTP was resent to you");
            }else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }            
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
        
        
        axios.put(`/api/public/verify-otp-and-reset/`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire.stopLoading();
                Swal.fire('Success!', "OTP verified",'success').then(() => {
                    history.push(`/new-password/${textInput.email}/${textInput.otp}`);
                });
            }else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }
            
        });
    }


    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='card col-md-4 col-lg-3 col-10'>
                        
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={`${process.env.REACT_APP_URL}img/logo.png`} alt="" style={{ width: 60 }} />
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


export default ResetPasswordVerify;