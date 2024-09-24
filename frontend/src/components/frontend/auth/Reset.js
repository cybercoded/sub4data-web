import React, {useState} from 'react';
import Swal from 'sweetalert2';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { csrfToken, store_local_storage_item, url } from '../../../util';

function Reset() {

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
        
        
        axios.get(`/api/public/verify-user-email/${textInput.email}`).then((res) => {
            if (res?.data.status === 200) {
                axios.put(`/api/public/password-reset/`, textInput).then((res) => {
                    if (res?.data.status === 200) {
                        Swal.fire({icon: 'success', html: res.data.message, type: 'success'}).then(() => {
                            store_local_storage_item('otp_email', textInput.email)
                            history.push(`/verify-otp/new-password/${textInput.email}/${res.data.otp || null}`);
                        });
                    }else {
                        Swal.fire('Error!', res.data.errors, 'error');
                    }
                    
                });
            } else {                
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
                            <img src={`${url()}img/logo.png`} alt="" style={{ width: 60 }} />
                            <h4>Regain your account</h4>
                        </Link>                        
                        <div className='card-body'>
                            <form onSubmit={loginSubmit}>
                                <input type="hidden" name="_token" value={csrfToken} />
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