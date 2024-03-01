import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';


function NewPassword(props) {

    const email = props.match.params.email;
    const otp = props.match.params.otp;

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

    const handleSubmit= (e)=>{
        e.preventDefault();

        if( passwordValidator(textInput.password) !== "" ) {
            swal('Error!', passwordValidator(textInput.password), 'error');
            return;
        }
        if(textInput.password !== textInput.password2){
            swal('Error!', "Passwords do not match", 'error');
            return;
        }
        
        
        axios.put(`/api/public/verify-otp-and-reset/`, textInput).then((res) => {
            if (res.data.status === 200) {
                swal('Success!', `You can proceed to login`,'success').then(() => {
                    history.push('/login');
                });
            }else {
                swal('Error!', res.data.errors, 'error');
            }
            
        });
    }
    
    
    const handleResend = (e)=>{
        e.preventDefault();

        
        
        axios.put(`/api/public/password-reset/`, {email: email}).then((res) => {
            if (res.data.status === 200) {
                swal('Success!', `OTP was successfully sent to ${email}`,'success').then(() => {
                    history.push('/admin/dashboard');
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
                            <h4>Regain your account</h4>
                        </Link>                        
                        <div className='card-body'>
                            <form onSubmit={handleSubmit}>
                                <div className='form-group mb-3'>
                                    <label>New Password</label>
                                    <input type='text' name="password" onChange={handleInput} value={textInput.password} className='form-control' ></input>
                                </div>

                                <div className='form-group mb-3'>
                                    <label>New Password (Again*)</label>
                                    <input type='text' name="password2" onChange={handleInput} value={textInput.password2} className='form-control' ></input>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <div>Resend OTP? <Link to="" onClick={handleResend}>Login</Link> </div>
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