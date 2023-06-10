import React, {useState} from 'react';
import swal from 'sweetalert';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { Loader } from '../../Global';
import Toastify from 'toastify-js';

function RegistrationVerify(props) {
    const email = props.match.params.email;
    const imgRoot = 'http://localhost/sub4data-web/react/src/assets/admin/assets/img/';
    const [loading, setLoading] = useState(false);
    const history=useHistory();
    const [textInput, setTextInput] = useState({
        email: localStorage.getItem('registration_emil'),
        name: localStorage.getItem('registration_name'),
        password: localStorage.getItem('registration_password'),
        otp:'',
    });

    const handleInput = (e)=>{
        e.persist();
        setTextInput({...textInput,[e.target.name]: e.target.value});
    }

   const handleResend = (e)=>{                   
        setLoading(true);
        if(loading === false){
            axios.put(`/api/send-otp/`, textInput).then((res) => {
                if (res.data.status === 200) {
                    Toastify({
                        text: "OTP was resent to you",
                        duration: 3000,
                        className: "info",
                        close: true,
                        gravity: "top", // `top` or `bottom`
                        position: "center", // `left`, `center` or `right`
                        stopOnFocus: true, // Prevents dismissing of toast on hover
                        offset: {
                            y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
                        },
                    }).showToast();                    
                }else {
                    swal('Error!', res.data.errors, 'error');
                }
                setLoading(false);
            });
        }
    }
    
    const handleVerify = (e)=>{   
        e.preventDefault();        
       
        if(textInput.otp === ''){
            swal('Error!', 'Please enter OTP', 'error');
            return;
        }
        if(textInput.otp.length > 5 || textInput.otp.length < 5){
            swal('Error!', 'OTP must 5 digits', 'error');
            return;
        }
        
        setLoading(true);
        axios.put(`/api/verify-registration-otp`, textInput).then((res) => {
            if (res.data.status === 200) {
                axios.get('/sanctum/csrf-cookie').then(() => {
                    axios.post(`/api/register`, textInput).then(res=>{
                        if(res.data.status===200){
                            localStorage.setItem("auth_token",res.data.token);
                            localStorage.setItem("auth_name",res.data.username);
                            swal("success",res.data.message,"success").then(()=>{
                                history.push("/user/dashboard");
                            })
                        }else{
                            swal('Error!', res.data.validation_errors, 'error');
                        }
                        setLoading(false);
                    })
                });
            }else {
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
                            <img src={`${imgRoot}logo.jpg`} alt="" style={{ width: 60 }} />
                            <h4>Enter OTP Sent to <span className='text-info'> {textInput.email}</span></h4>
                        </Link>                        
                        <div className='card-body'>
                            <form onSubmit={handleVerify}>
                                <div className='form-group mb-3'>
                                    <label>Enter OTP</label>
                                    <input type='number' name="otp" onChange={handleInput} value={textInput.otp} className='form-control' ></input>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <button type='submit' className='btn btn-primary w-100'>Proceed</button>
                                </div>
                                
                                <div className='form-group mb-3'>
                                    <div className="text-center mb-0">
                                        <Link to="#" onClick={handleResend}>Resend OTP</Link>
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


export default RegistrationVerify;