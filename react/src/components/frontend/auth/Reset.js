import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { Loader } from '../../Global';
import Toastify from 'toastify-js';
import $ from 'jquery';

function Reset() {

    const [loading, setLoading] = useState(false);
    const history=useHistory();
    const [textInput, setTextInput] = useState({
        email:'',
        otp:'',
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});
    }

    const loginSubmit= (e)=>{
        e.preventDefault();
        
        setLoading(true);
        axios.get(`/api/verify-user-email/${textInput.email}`).then((res) => {
            if (res.data.status === 200) {
                axios.put(`/api/password-reset/`, textInput).then((res) => {
                    if (res.data.status === 200) {
                        swal('Success!', `Verification code sent to ${textInput.email}`,'success').then(() => {
                            history.push(`/verify-otp/${textInput.email}`);
                        });
                    }else {
                        swal('Error!', res.data.errors, 'error');
                    }
                    setLoading(false);
                });
            } else {                
                swal('Error!', res.data.errors, 'error');
                setLoading(false);
            }
            
        });
    }

    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='card col-md-4 col-lg-3 col-10'>
                        <Loader isActive={loading} />
                        <Link to="/" className='card-header text-center text-decoration-none'>                            
                            <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
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