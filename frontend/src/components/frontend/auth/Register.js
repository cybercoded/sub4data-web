import React, {useState} from 'react';
import axios from 'axios';
import Swal from 'sweetalert2';

import { Link, useHistory } from 'react-router-dom';
import { encrypt, passwordValidator, split_errors, store_local_storage_item, url } from '../../../util';


function Register() {

    const history=useHistory();
    const [textInput, setTextInput] = useState({
        name:'',
        email:'',
        password: '',
        encrypted_password: '',
        checkbox: false
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value})
    }

    const handlePassword = (e)=>{
        e.persist();
        setTextInput({...textInput,password: e.target.value, encrypted_password: encrypt(e.target.value)})
    }
    
    const handleCheckBox = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.checked})
    }

    const registerSubmit= (e)=>{
        e.preventDefault();
        if(!textInput.checkbox) {
            Swal.fire('Error!', 'Agree with our Terms and Condition before continuing', 'error');
            return;
        }

        if( passwordValidator(textInput.password) !== "" ) {
            Swal.fire('Error!', passwordValidator(textInput.password), 'error');
            return;
        }        
        
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.put(`/api/public/send-registration-otp/`, textInput).then((res) => {
                let  encryptedPassword = encrypt(textInput.password);

                store_local_storage_item("registration_name",textInput.name);
                store_local_storage_item("registration_email",textInput.email);
                store_local_storage_item("registration_otp",res.data.otp || '');
                store_local_storage_item("registration_password", encryptedPassword);
                    
                if (res?.data.status === 200) {                    
                    Swal.fire('Success!', res.data.message,'success').then(() => {
                        history.push(`/verify-registration`);
                    });
                }else if(res?.data.status === 201) {
                    Swal.fire('Warning!', `Verification code was not sent, because you are in development mode use ${res.data.otp} as your otp`,'warning').then(() => {
                        history.push(`/verify-registration`);
                    });
                }else {
                    Swal.fire('Error!', split_errors(res?.data?.errors), 'error');
                }
                
            });    
        });    
    }

    return(
        <div className='my-bg-primary'>
            <div className="d-flex align-items-center justify-content-center vh-100">
                <div className='col-md-6 col-sm-8 col-lg-5 col-xl-4'>
                    <div className='card'>
                        
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={`${url()}img/logo.png`} alt="" style={{ width: 60 }} />
                            <h4>Register new account</h4>
                        </Link>
                        <div className='card-body'>
                            <form onSubmit={registerSubmit}>
                                <div className='form-group mb-3'>
                                    <label>Full Name</label>
                                    <input type='text' name="name" onChange={handleInput} value={textInput.name} className='form-control' required ></input>
                                    <span>{textInput.error_list?.name}</span>
                                </div>
                                <div className='form-group mb-3'>
                                    <label>Email ID</label>
                                    <input type='email' name="email" onChange={handleInput} value={textInput.email} className='form-control' required ></input>
                                    <span>{textInput.error_list?.email}</span>
                                </div>
                                <div className='form-group mb-3'>
                                    <label>Password</label>
                                    <input type='password' name="password" onChange={handlePassword} value={textInput.password} className='form-control' required ></input>
                                    <input type='hidden' name="encrypted_password" value={textInput.encrypted_password} className='form-control' required ></input>
                                    <span>{textInput.error_list?.password}</span>
                                </div>
                                
                                <div className="mb-4">
                                    <input type="checkbox" onChange={handleCheckBox} className='me-4' name="checkbox" id="checkbox" />
                                    <label htmlFor="checkbox"></label>
                                    <span>I Agree with the <Link to="terms-and-condition"> terms and conditions.</Link></span>
                                </div>

                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Register</button>
                                </div>

                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <div>Already have an account? <Link to="/login">Login</Link> or </div>
                                        <div>you forgot password? <Link to="/reset">Reset</Link></div>
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


export default Register;