import React, {useState} from 'react';
import axios from 'axios';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import { Loader } from '../../Global';

function Register() {

    const [loading, setLoading] = useState(false);

    const history=useHistory();
    const [textInput, setRegister] = useState({
        name:'',
        email:'',
        password: '',
    });

    const handleInput = (e)=>{
        e.persist();
        setRegister({...textInput,[e.target.name]: e.target.value})

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
            errMsg="At least one Uppercase";
        }else if(!lowercasePassword){
            errMsg="At least one Lowercase";
        }else if(!digitsPassword){
            errMsg="At least one digit";
        }else if(!specialCharPassword){
            errMsg="At least one Special Characters";
        }else if(!minLengthPassword){
            errMsg="At least minumum of 8 characters";
        }

        return errMsg;
    }

    const registerSubmit= (e)=>{
        e.preventDefault();

        if( passwordValidator(textInput.password) !== "" ) {
            swal('Error!', passwordValidator(textInput.password), 'error');
            return;
        }
        setLoading(true);
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.put(`/api/send-otp/`, textInput).then((res) => {
                if (res.data.status === 200) {
                    
                    localStorage.setItem("registration_name",textInput.name);
                    localStorage.setItem("registration_email",textInput.email);
                    localStorage.setItem("registration_password",textInput.password);

                    swal('Success!', `Verification code sent to ${textInput.email}`,'success').then(() => {
                        history.push(`/verify-registration`);
                    });
                }else {
                    swal('Error!', res.data.errors, 'error');
                }
                setLoading(false);
            });    
        });    
    }

    return(
        <div className='my-bg-primary'>
            <div className="d-flex align-items-center justify-content-center vh-100">
                <div className='col-md-4 col-lg-3 col-10'>
                    <div className='card'>
                        <Loader isActive={loading} />
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
                            <h4>register new account</h4>
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
                                
                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Register</button>
                                </div>

                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <div>Already have an account? <Link to="/login">Login</Link> or </div>
                                        <div>you forgotten password? <Link to="/reset">Reset</Link></div>
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