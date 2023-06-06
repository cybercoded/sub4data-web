import React, {useState} from 'react';
import Navbar from "../../../layouts/frontend/Navbar";
import axios from 'axios';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import { Loader } from '../../Global';

function Register() {

    const imgRoot = 'http://localhost/sub4data-web/react/src/assets/admin/assets/img/';
    const [loading, setLoading] = useState(false);

    const history=useHistory();
    const [registerInput, setRegister] = useState({
        name:'',
        email:'',
        password: '',
    });

    const handleInput = (e)=>{
        e.persist();
        setRegister({...registerInput,[e.target.name]: e.target.value})

    }

    const registerSubmit= (e)=>{
        e.preventDefault();

        const data={
            name: registerInput.name,
            email: registerInput.email,
            password: registerInput.password,
            error_list:[]
        }

        setLoading(true);
        axios.get('/sanctum/csrf-cookie').then(response => {
            axios.post(`/api/register`,data).then(res=>{
                if(res.data.status===200){
                    localStorage.setItem("auth_token",res.data.token);
                    localStorage.setItem("auth_name",res.data.username);
                    swal("success",res.data.message,"success");
                    history.push("/user");
                }else{
                    
                    setRegister({ ...registerInput, error_list:res.data.validation_errors})
                }
                setLoading(false);
            })
        });
    }

    return(
        <div className='my-bg-primary'>
            <div className="d-flex align-items-center justify-content-center vh-100">
                <div className='card col-md-3'>
                    <Loader isActive={loading} />
                    <Link to="/" className='card-header text-center text-decoration-none'>                            
                        <img src={`${imgRoot}logo.jpg`} alt="" style={{ width: 60 }} />
                        <h4>register new account</h4>
                    </Link>
                    <div className='card-body'>
                        <form onSubmit={registerSubmit}>
                            <div className='form-group mb-3'>
                                <label>Full Name</label>
                                <input type='' name="name" onChange={handleInput} value={registerInput.name} className='form-control' ></input>
                                <span>{registerInput.error_list?.name}</span>
                            </div>
                            <div className='form-group mb-3'>
                                <label>Email ID</label>
                                <input type='' name="email" onChange={handleInput} value={registerInput.email} className='form-control' ></input>
                                <span>{registerInput.error_list?.email}</span>
                            </div>
                            <div className='form-group mb-3'>
                                <label>Password</label>
                                <input type='password' name="password" onChange={handleInput} value={registerInput.password} className='form-control' ></input>
                                <span>{registerInput.error_list?.password}</span>
                            </div>
                            
                            <div className='form-group mb-3'>
                                <button type='submit' className='btn btn-primary w-100'>Register</button>
                            </div>

                            <div className='form-group mb-3'>
                                <div className="text-center mb-0">
                                    <div>Already have an account? <Link to="/login">Login</Link> or </div>
                                    <div>you forgotten passwor? <Link to="/reset">Reset</Link></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    );
}


export default Register;