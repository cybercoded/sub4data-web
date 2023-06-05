import axios from "axios";
import React, { useEffect, useState } from "react";
import ReactjsOverlayLoader from "reactjs-overlay-loader";
import swal from "sweetalert";

function Profile(){

    const [loading, setLoading] = useState(true);
    const [profileList, setProfileList] = useState([]);
    const [textInput, setTextIput] = useState({
        product: '',
        serviceId: '',
        smartcard_number: '7023687567',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleProfileUpdate = (e) => {        
        e.persist();

        setLoading(true);
        axios.post(`api/smartcard-verification`, {smartcard_number: textInput.smartcard_number, product_code: textInput.serviceId}).then((res) => {
            if (res.data.status === 200) {                    
                swal('Sucess!', 'Profile data successfully updated', 'success');
            }else {
                swal('Unable to update!', 'Something went wrong, try again', 'error');
            }
            setLoading(false);
        });
    };

    useEffect(() => {
        axios.get(`api/view-user/`).then((res) => {
            if (res.status === 200) {
                setProfileList(res.data.product);
            }
            setLoading(false);
        });
    }, []);


    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Bill</b> Payment /
            </div>
            <div className="bg-light card card-body col-md-6">
                <ReactjsOverlayLoader isActive={loading} 
                    icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
                />

                <form onSubmit={handleProfileUpdate}>
                    <div className='form-group mb-3'>
                        <label>Full Name</label>
                        <input type='' name="name" onChange={handleInput} value={profileList.name} className='form-control' ></input>
                        <span>{profileList.error_list?.name}</span>
                    </div>
                    <div className='form-group mb-3'>
                        <label>Email ID</label>
                        <input type='' name="email" onChange={handleInput} value={profileList.email} className='form-control' ></input>
                        <span>{profileList.error_list?.email}</span>
                    </div>
                    <div className='form-group mb-3'>
                        <label>Password</label>
                        <input type='password' name="password" onChange={handleInput} value={profileList.password} className='form-control' ></input>
                        <span>{profileList.error_list?.password}</span>
                    </div>
                    
                    <div className='form-group mb-3'>
                        <button type='submit' className='btn btn-primary w-100'>Register</button>
                    </div>
                </form>
            </div>
        </div>

    );
}


export default Profile;