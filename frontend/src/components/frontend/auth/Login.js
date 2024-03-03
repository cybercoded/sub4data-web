import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { get_local_storage_item, store_local_storage_item } from '../../../util';

function Login() {

    const history=useHistory();
    const [loginInput, setLogin] = useState({
        email:'',
        password:'',
        error_list:[]
    });
    
    const [notification] = useState(
        get_local_storage_item('notification') || ''
    );

    const handleInput = (e)=>{
        e.persist();
        setLogin({...loginInput,[e.target.name]: e.target.value});
    }

    const loginSubmit= (e)=>{
        e.preventDefault();

        const data={
            email: loginInput.email,
            password: loginInput.password,
        }

        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.post(`api/public/login`,data).then(res =>{
                if(res.data.status === 200){
                    store_local_storage_item("auth_token",res.data.token);
                    store_local_storage_item("auth_name",res.data.username);
                    store_local_storage_item("auth_role",res.data.role);
                    if(res.data.role==='admin'){
                        history.push("/admin/dashboard");
                    }else{
                        swal({
                            icon: 'success',
                            title: 'Success',
                            text: res.data.message,
                            timer: 2000
                        }).then(() => {
                            swal(notification.message)
                        });
                        
                        history.push("/user/dashboard");
                    }
                }else if(res.data.status === 401) {
                    swal('Warning', res.data.errors,'warning');
                }else{
                    setLogin({...loginInput,error_list: res.data.validation_erros});
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
                                <img src={process.env.REACT_APP_LOGO} alt="" style={{ width: 60 }} />
                                <h4>Login your account</h4>
                            </Link>                        
                            <div className='card-body'>
                                <form onSubmit={loginSubmit}>
                                    <div className='form-group mb-3'>
                                        <label>Email ID</label>
                                        <input type='email' name="email" onChange={handleInput} value={loginInput.email} className='form-control' ></input>
                                        <span>{loginInput.error_list?.email}</span>
                                    </div>
                                    <div className='form-group mb-3'>
                                        <label>Password</label>
                                        <input type='password' name="password" onChange={handleInput} value={loginInput.password} className='form-control' ></input>
                                        <span>{loginInput.error_list?.password}</span>
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