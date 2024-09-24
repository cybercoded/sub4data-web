import React, {useState} from 'react';
import Swal from 'sweetalert2';

import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { get_local_storage_item, passwordValidator, split_errors, store_local_storage_item, url } from '../../../util';


function NewPassword() {

    const email = get_local_storage_item('otp_email') || '';
    const otp = get_local_storage_item('otp') || '';

    const history=useHistory();
    const [textInput, setTextInput] = useState({
        password:'',
        password2:'',
        email: email,
        otp: otp
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});

    }

    const handleSubmit= (e)=>{
        e.preventDefault();

        if( passwordValidator(textInput.password) !== "" ) {
            Swal.fire('Error!', passwordValidator(textInput.password), 'error');
            return;
        }
        if(textInput.password !== textInput.password2){
            Swal.fire('Error!', "Passwords do not match", 'error');
            return;
        }
        
        
        axios.put(`/api/public/set-newPassword/`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success!', `You can proceed to login`,'success').then(() => {
                    history.push('/login');
                });
            }else {
                Swal.fire('Error!', split_errors(res?.data.errors), 'error');
            }
            
        });
    }
    

    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='card col-md-4 col-lg-3 col-10'>
                        
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={`${url()}img/logo.png`} alt="" style={{ width: 60 }} />
                            <h4>Regain your account</h4>
                        </Link>                        
                        <div className='card-body'>
                            <form onSubmit={handleSubmit}>
                                <div className='form-group mb-3'>
                                    <label>New Password</label>
                                    <input type='password' name="password" onChange={handleInput} value={textInput.password} className='form-control' ></input>
                                </div>

                                <div className='form-group mb-3'>
                                    <label>New Password (Again*)</label>
                                    <input type='password' name="password2" onChange={handleInput} value={textInput.password2} className='form-control' ></input>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <div>Resend OTP? <Link to="/login">Login</Link> </div>
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


export default NewPassword;