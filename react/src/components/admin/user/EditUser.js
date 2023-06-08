import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ReactjsOverlayLoader from "reactjs-overlay-loader";
import swal from "sweetalert";

function EditUser(props){
    const user_id = props.match.params.id;
    const [loading, setLoading] = useState(true);
    const [textInput, setTextIput] = useState({
        status: false
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleProfileUpdate = (e) => {        
        e.preventDefault();

        setLoading(true);

        axios.post(`api/update-user/${textInput.id}`, textInput).then((res) => {
            if (res.data.status === 200) {

                swal('Sucess!', 'Profile data successfully updated', 'success').then(() => {
                    window.location.reload();
                });

            }else {
                swal('Unable to update!', 'Something went wrong, try again', 'error');
            }
            setLoading(false);
        });
    };

    useEffect(() => {

        setLoading(true);
        axios.get(`api/get-user/${user_id}`).then((res) => {
            if (res.data.status === 200) {
                setTextIput(res.data.data);
            }
            setLoading(false);
        });
    }, [user_id]);


    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Profile</b> Update /
            </div>
            <div className="card">
                <div className="card-body">
                    <ul className="nav nav-tabs" id="myTab" role="tablist">
                        <li className="nav-item" role="presentation">
                            <button
                                className="nav-link active"
                                id="home-tab"
                                data-bs-toggle="tab"
                                data-bs-target="#home"
                                type="button"
                                role="tab"
                                aria-controls="home"
                                aria-selected="true"
                            >
                                User profile
                            </button>
                        </li>
                        <li className="nav-item" role="presentation">
                            <Link
                                to={`/admin/transactions/${user_id}`}
                                className="nav-link"
                                id="otherdetails-tab"
                                type="button"
                            >
                                User transactions
                            </Link>
                        </li>
                    </ul>
                    <div className="tab-content" id="myTabContent">
                        <div className="card">
                            <div className="card-body">
                                <ReactjsOverlayLoader isActive={loading} 
                                    icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
                                />

                                <form onSubmit={handleProfileUpdate}>

                                    <div className='form-group mb-3'>
                                        <label>Email ID</label>
                                        <input type='text' name="email"  value={textInput.email} disabled className='form-control' ></input>
                                        <small className="text-info">Your email cannot be changed</small>
                                    </div>

                                    <div className='form-group mb-3'>
                                        <label>Full Name</label>
                                        <input type='text' name="name" onChange={handleInput} value={textInput.name} className='form-control' ></input>
                                        <small className="text-danger">{textInput.error_list?.name}</small>
                                    </div>

                                    <div className="form-group mb-3">
                                        <label>Status</label>
                                        <input 
                                            type="checkbox" 
                                            checked={textInput.status} 
                                            onChange={e => 
                                                setTextIput({...textInput, status: e.target.checked})
                                            } 
                                        />

                                        <br /> 
                                        <small className="text-info">Status checked = Active / Unchecked = Inactive</small>
                                    </div>

                                    <div className='form-group mb-3'>
                                        <button type='submit' className='btn btn-primary w-100'>Update User</button>
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


export default EditUser;