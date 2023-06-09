import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { Loader } from '../../Global';
import Toastify from 'toastify-js';
import $ from 'jquery';

function Reset() {

    const imgRoot = 'http://localhost/sub4data-web/react/src/assets/admin/assets/img/';
    const [loading, setLoading] = useState(false);
    const history=useHistory();
    const [textInput, setTextIput] = useState({
        email:'',
        otp:'',
    });

    const handleInput = (e)=>{
        e.persist();
        setTextIput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        setLoading(true);
        if(loading === false){
            axios.get(`/api/verify-user-email/${textInput.email}`).then((res) => {
                Toastify({
                    text: "OTP was successfully resent to you",
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
        
        let otp = $('#otp-input').val();

        setLoading(true);
        if(otp === ''){
            swal('Error!', 'Please enter OTP', 'error');
            return;
        }
        if(otp > 5 || otp < 5){
            swal('Error!', 'OTP must 5 digits', 'error');
            return;
        }
        axios.put(`/api/verify-otp-and-reset/`, otp).then((res) => {
            if (res.data.status === 200) {
                swal.stopLoading();
                swal('Sucess!', `OTP was successfully sent to ${textInput.email}`,'success').then(() => {
                    history.push(`/new-passpord/${textInput.email}`);
                });
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            setLoading(false);
        });
    }

    $('#resend-btn').off().on('click', handleResend);
    $('#verify-btn').off().on('submit', handleVerify);    

    const loginSubmit= (e)=>{
        e.preventDefault();
        
        setLoading(true);
        axios.get(`/api/verify-user-email/${textInput.email}`).then((res) => {
            if (res.data.status === 200) {     
                axios.put(`/api/password-reset/`, textInput).then((res) => {
                    if (res.data.status === 200) { 
                        history.push(`/verify-otp/${textInput.email}`);
                    }else {
                        swal('Error!', res.data.errors, 'error');
                    }
                });
            } else {                
                swal('Error!', res.data.errors, 'error');
            }
            setLoading(false);
        });
    }

    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='card col-md-4 col-lg-3 col-10'>
                        <Loader isActive={loading} />
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={`${imgRoot}logo.jpg`} alt="" style={{ width: 60 }} />
                            <h4>Regain your account</h4>
                        </Link>                        
                        <div className='card-body'>
                            <form onSubmit={loginSubmit}>
                                <div className='form-group mb-3'>
                                    <label>Email ID</label>
                                    <input type='email' name="email" onChange={handleInput} value={textInput.email} className='form-control' ></input>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <div>Remembered password? <Link to="/login">Login</Link> </div>
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


export default Reset;