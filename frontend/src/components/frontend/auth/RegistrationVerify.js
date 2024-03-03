import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import Toastify from 'toastify-js';
import CryptoJS from 'crypto-js';
import { get_local_storage_item, split_errors, store_local_storage_item } from '../../../util';

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
            if (res.data.status === 200 || res.data.status === 201) {
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
            } else {
                swal('Error!', res.data.errors, 'error');
            }

            if(res.data.status === 201) {
                swal('Warning!', `Verification code was not sent, because you are in development mode use ${res.data.otp} as your otp`,'warning').then(() => {
                    history.push(`/verify-registration`);
                });
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
        
        
        axios.put(`/api/public/verify-registration-otp`, textInput).then((res) => {
            if (res.data.status === 200) {
                axios.post(`/api/public/register`, textInput).then(res=>{
                    if(res.data.status===200){
                        store_local_storage_item("auth_token",res.data.token);
                        store_local_storage_item("auth_name",res.data.username);
                        swal("success",res.data.message,"success").then(()=>{
                            history.push("/user/dashboard");
                        })
                    }else{
                        
                        swal('Error!', split_errors(res.data.validation_errors), 'error');
                    }
                    
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