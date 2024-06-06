import React, {useState} from 'react';
import Swal from 'sweetalert2';

import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import CryptoJS from 'crypto-js';
import { get_local_storage_item, split_errors, store_local_storage_item, toastifyFunction } from '../../../util';

function RegistrationVerify(props) {
    var encryptedPassword = get_local_storage_item("registration_password");
    var decryptedPassword = CryptoJS.AES.decrypt(encryptedPassword, 'secret_key').toString(CryptoJS.enc.Utf8);
    const history=useHistory();
    const [textInput, setTextInput] = useState({
        email: get_local_storage_item('registration_email'),
        name: get_local_storage_item('registration_name'),
        password: decryptedPassword,
        otp:'',
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        
        axios.put(`/api/public/send-otp/`, textInput).then((res) => {
            if (res?.data.status === 200 || res?.data.status === 201) {
                toastifyFunction("OTP was resent to you");                   
            } else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }

            if(res?.data.status === 201) {
                Swal.fire('Warning!', `Verification code was not sent, because you are in development mode use ${res?.data.otp} as your otp`,'warning').then(() => {
                    history.push(`/verify-registration`);
                });
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
        
        
        axios.put(`/api/public/verify-registration-otp`, textInput).then((res) => {
            if (res?.data.status === 200) {
                axios.post(`/api/public/register`, textInput).then(res=>{
                    if(res?.data.status===200){
                        store_local_storage_item("auth_role","user");
                        store_local_storage_item("auth_token",res?.data.token);
                        localStorage.removeItem("registration_password");
                        localStorage.removeItem("registration_name");
                        Swal.fire("success",res?.data.message,"success").then(()=>{
                            history.push("/user/dashboard");
                        })
                    }else{
                        
                        Swal.fire('Error!', split_errors(res?.data.validation_errors), 'error');
                    }
                    
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
                            <h4>Enter OTP Sent to <span className='text-info'> {textInput.email}</span></h4>
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


export default RegistrationVerify;