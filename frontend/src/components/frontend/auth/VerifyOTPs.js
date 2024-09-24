import React, { useEffect, useState, useRef } from 'react';
import Swal from 'sweetalert2';
import { Link, useHistory } from 'react-router-dom';
import axios from 'axios';
import { get_local_storage_item, split_errors, store_local_storage_item, toastifyFunction, url } from '../../../util';

function VerifyOTPs(props) {
    const email = props.match.params.email || get_local_storage_item('otp_email');
    const otp = props.match.params.otp || get_local_storage_item('otp');
    const destination = props.match.params.destination;
    const history = useHistory();

    const [textInput, setTextInput] = useState({
        email: email,
        otp: otp
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    }

    const handleResend = () => {
        axios.put(`/api/public/send-otp/`, { email: textInput.email }).then((res) => {
            if (res?.data.status === 200) {
                toastifyFunction(res.data.message);
            } else {
                Swal.fire('Error!', res?.data.errors, 'error');
            }
        });
    }

    const handleVerify = (e) => {
        e.preventDefault();

        if (textInput.otp === '') {
            Swal.fire('Error!', 'Please enter OTP', 'error');
            return;
        }
        if (textInput.otp.length !== 5) {
            Swal.fire('Error!', 'OTP must be 5 digits', 'error');
            return;
        }

        axios.put(`/api/public/verify-otp/`, textInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success!', "OTP verified", 'success')
                    .then(() => {
                        store_local_storage_item("otp", otp);
                        store_local_storage_item("otp_email", email);
                        history.push(`/${decodeURIComponent(destination)}`);
                    });
            } else {
                Swal.fire('Error!', split_errors(res?.data.errors), 'error');
            }
        });
    }

    useEffect(() => {
        if (otp !== null) {
            setTextInput(prevState => ({ ...prevState, otp: otp }));
            // Programmatically trigger handleVerify
            handleVerify({ preventDefault: () => {} });
        }
    }, [otp]);

    return (
        <div className='my-bg-primary'>
            <div className="d-flex align-items-center justify-content-center vh-100">
                <div className='card col-md-4 col-lg-3 col-10'>
                    <Link to="/" className='card-header text-center text-decoration-none'>
                        <img src={`${url()}img/logo.png`} alt="Logo" style={{ width: 60 }} />
                        <h4>Enter OTP Sent to <span className='text-info'>{email}</span></h4>
                    </Link>
                    <div className='card-body'>
                        <form onSubmit={handleVerify}>
                            <div className='form-group mb-3'>
                                <label>Enter OTP</label>
                                <input
                                    type='number'
                                    name="otp"
                                    value={textInput.otp}
                                    onChange={handleInput}
                                    className='form-control'
                                    required
                                />
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
    );
}

export default VerifyOTPs;
