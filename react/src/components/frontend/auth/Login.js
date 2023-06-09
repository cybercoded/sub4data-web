import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { Loader } from '../../Global';

function Login() {

    const imgRoot = 'http://localhost/sub4data-web/react/src/assets/admin/assets/img/';
    const [loading, setLoading] = useState(false);
    const history=useHistory();
    const [loginInput, setLogin] = useState({
        email:'',
        password:'',
        error_list:[]
    });

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

        setLoading(true);
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`api/login`,data).then(res =>{
                if(res.data.status === 200){
                    localStorage.setItem("auth_token",res.data.token);
                    localStorage.setItem("auth_name",res.data.username);
                    swal("success",res.data.message,"success");
                    if(res.data.role==='admin'){
                        history.push("/admin/dashboard");
                    }else{
                        history.push("/user/dashboard");
                    }
                }else if(res.data.status === 401) {
                    swal('Warning', res.data.message,'warning');
                }else{
                    setLogin({...loginInput,error_list: res.data.validation_erros});
                }
                setLoading(false);
            });
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
    );
}


export default Login;