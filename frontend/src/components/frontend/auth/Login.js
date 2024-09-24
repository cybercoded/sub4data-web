import React, {useEffect, useState} from 'react';
import Swal from 'sweetalert2';

import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { get_local_storage_item, setCookie, store_local_storage_item, url } from '../../../util';
import { Context } from '../../../contexts/globalContext';

function Login(props) {
    const auto_login = props.match.params.auto_login;
    const history=useHistory();
    const { globalValues } = React.useContext(Context);

    const [loginInput, setLogin] = useState({
        rememberMe: false,
        email:'',
        password:'',
        error_list:[]
    });

    const handleCheckBox = (e)=>{
        e.persist();
        setLogin({...loginInput,[e.target.name]: e.target.checked})
    }
    
    const [notification] = useState(
        get_local_storage_item('notification') || ''
    );

    const handleInput = (e)=>{
        e.persist();
        setLogin({...loginInput,[e.target.name]: e.target.value});
    }

    useEffect(() => {
        if (auto_login) {
            let email = get_local_storage_item('otp_email');
            let password = get_local_storage_item('user_pass');
            if (email && password) {
                axios.get('/sanctum/csrf-cookie').then(() => {
                    axios.post(`api/public/login`,{email: email, password: password, auto: 1}).then(res =>{
                        localStorage.clear();
                        if(loginInput.rememberMe) {
                            setCookie("auth_token", res?.data.token, 30);
                        } else {
                            setCookie("auth_token", res?.data.token);
                        }
                        store_local_storage_item("auth_role", res?.data.role);

                        history.push(globalValues.lastPageBeforeLogout || `/${res?.data.role}/dashboard`);
                    })
                });
            }
        }
    }, [])

    const loginSubmit= (e)=>{
        e.preventDefault();

        const data={
            email: loginInput.email,
            password: loginInput.password,
            auto: 0
        }
        
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.post(`api/public/login`,data).then(res =>{
                if(res?.data?.status === 200){
                    localStorage.clear();
                    if(res.data.mfa === 1) {
                        store_local_storage_item("otp_email",loginInput.email);
                        store_local_storage_item("user_pass",loginInput.password);
                        Swal.fire('Success', res.data.message, 'success').then(() => {
                            history.push(`/verify-otp/${encodeURIComponent('login/true')}`); 
                        });
                    } 
                    else {
                        if(loginInput.rememberMe === true) {
                            setCookie("auth_token", res?.data.token, 30);
                        } else {
                            setCookie("auth_token", res?.data.token);
                        }
                        store_local_storage_item("auth_role",res?.data.role);
                        if(res?.data.role==='admin'){
                            history.push(globalValues.lastPageBeforeLogout || '/admin/dashboard');
                        }
                        else{
                            Swal.fire({icon: 'success',title: 'Success',text: res?.data?.message,timer: 2000}).then(() => {
                                notification.message ? Swal.fire(notification.message).then(() => {
                                    
                                    window.location.reload()
                                
                                }) : window.location.reload();
                            });
                            history.push(`${globalValues.lastPageBeforeLogout || '/user/dashboard'}`);
                        }
                    }
                }else if(res?.data?.status === 401) {
                    Swal.fire('Warning', res?.data?.errors,'warning');
                }else{
                    setLogin({...loginInput,error_list: res?.data.validation_erros});
                }
            });
        });
    }

    return(
        <div>
            <div className='my-bg-primary'>                
                <div className="d-flex align-items-center justify-content-center vh-100">                                 
                    <div className='col-md-6 col-sm-8 col-lg-5 col-xl-4'>
                        <div className='card'>
                            <Link to="/" className='card-header text-center text-decoration-none'>                            
                                <img src={`${url()}img/logo.png`} alt="" style={{ width: 60 }} />
                                <h4>Login your account</h4>
                            </Link>                        
                            <div className='card-body'>
                                <form onSubmit={loginSubmit}>
                                    <div className='form-group mb-3'>
                                        <label>Email ID</label>
                                        <input type='email' name="email" onChange={handleInput} value={loginInput.email} className='form-control' required ></input>
                                        <span>{loginInput.error_list?.email}</span>
                                    </div>
                                    <div className='form-group mb-3'>
                                        <label>Password</label>
                                        <input type='password' name="password" onChange={handleInput} value={loginInput.password} className='form-control' required ></input>
                                        <span>{loginInput.error_list?.password}</span>
                                    </div>

                                    <div className="mb-4 p-2 bg-light d-flex align-items-center">
                                        <span className="me-2">Stay logged in</span>
                                        <input type="checkbox" onChange={handleCheckBox} className="me-3" name="rememberMe" id="rememberMe" />
                                        <label htmlFor="rememberMe"></label>
                                    </div>

                                        
                                    <div className='form-group mb-3'>
                                        <button type='submit' className='btn btn-primary w-100'>Login</button>
                                    </div>
                                    
                                    <div className='form-group mb-3'>
                                        <div className="text-center mb-0">
                                            <div>Don't have an account? <Link to="/register">Register</Link> or <br />
                                            <Link to="/reset">Reset password</Link></div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}


export default Login;