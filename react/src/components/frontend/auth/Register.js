import React, {useState} from 'react';
import axios from 'axios';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import CryptoJS from 'crypto-js';


function Register() {

    const history=useHistory();
    const [textInput, setTextInput] = useState({
        name:'',
        email:'',
        password: '',
        checkbox: ''
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value})
    }
    
    const handleCheckBox = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.chcked})
    }

    const passwordValidator = (passwordInputValue) => {
        const uppercaseRegExp   = /(?=.*?[A-Z])/;
        const lowercaseRegExp   = /(?=.*?[a-z])/;
        const digitsRegExp      = /(?=.*?[0-9])/;
        const specialCharRegExp = /(?=.*?[#?!@$%^&+_*-])/;
        const minLengthRegExp   = /.{8,}/;
        const passwordLength =      passwordInputValue.length;
        const uppercasePassword =   uppercaseRegExp.test(passwordInputValue);
        const lowercasePassword =   lowercaseRegExp.test(passwordInputValue);
        const digitsPassword =      digitsRegExp.test(passwordInputValue);
        const specialCharPassword = specialCharRegExp.test(passwordInputValue);
        const minLengthPassword =   minLengthRegExp.test(passwordInputValue);
        let errMsg = "";
        if(passwordLength===0){
            errMsg="Password is empty";
        }else if(!uppercasePassword){
            errMsg="Password should at least have one Uppercase";
        }else if(!lowercasePassword){
            errMsg="Password should at least have one Lowercase";
        }else if(!digitsPassword){
            errMsg="Password should at least have one Digit";
        }else if(!specialCharPassword){
            errMsg="Password should at least have one Special Characters";
        }else if(!minLengthPassword){
            errMsg="Password should at least have minimum of 8 characters";
        }

        return errMsg;
    }

    const registerSubmit= (e)=>{
        e.preventDefault();

        if( passwordValidator(textInput.password) !== "" ) {
            swal('Error!', passwordValidator(textInput.password), 'error');
            return;
        }
        if( textInput.checkbox ) {
            swal('Error!', 'Agree with our Terms and Condition before continuing', 'error');
            return;
        }
        
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.put(`/api/send-otp/`, textInput).then((res) => {
                let  encryptedPassword = CryptoJS.AES.encrypt(textInput.password, 'secret_key').toString();

                localStorage.setItem("registration_name",textInput.name);
                localStorage.setItem("registration_email",textInput.email);
                localStorage.setItem("registration_password", encryptedPassword);
                    
                if (res.data.status === 200) {                    
                    swal('Success!', `Verification code sent to ${textInput.email}`,'success').then(() => {
                        history.push(`/verify-registration`);
                    });
                }else if(res.data.status === 201) {
                    swal('Warning!', `Verification code was not sent, because you are in development mode use ${res.data.otp} as your otp`,'warning').then(() => {
                        history.push(`/verify-registration`);
                    });
                }else {
                    swal('Error!', res.data.errors, 'error');
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
                            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
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
                                    <input type='password' name="password" onChange={handleInput} value={textInput.password} className='form-control' required ></input>
                                    <span>{textInput.error_list?.password}</span>
                                </div>
                                
                                <div className="mb-4">
                                    <input type="checkbox" onChange={handleCheckBox} className='me-4' name="checkbox" id="checkbox" required />
                                    <label for="checkbox">
                                        <span>I Agree with the <Link to="terms-and-condition"> terms and conditions.</Link></span>
                                    </label>
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