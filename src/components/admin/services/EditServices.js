import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Link, useHistory } from 'react-router-dom';
import swal from 'sweetalert';


function EditServices(props) {
    const history = useHistory();
    
    const [checkbox, setCheckbox] = useState();
    const [servicesInput, setservices] = useState([]);
    const [productData, setProductData] = useState([]);
    const [error, setError] = useState([]);

    useEffect(() => {
        
        axios.get(`api/view-product`).then((res) => {
            if (res.data.status === 200) {
                setProductData(res.data.product);
            }
            
        });

        const services_id = props.match.params.id;
        axios.get(`/api/edit-services/${services_id}`).then((res) => {
            if (res.data.status === 200) {
                setservices(res.data.service);
                setCheckbox(res.data.service.status === 1? true : false);
            } else if (res.data.status === 404) {
                swal('Error', res.data.message, 'error');
                history.pushState('/admin/view-services');
            }
            
        });
    }, [props.match.params.id, history]);

    const handleInput = (e) => {
        e.persist();
        setservices({ ...servicesInput, [e.target.name]: e.target.value });
    };
   
    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked);
    };

    const updateservices = (e) => {
        e.preventDefault();
        const services_id = props.match.params.id;

        
        axios.put(`api/update-services/${services_id}`, {...servicesInput, status: checkbox}).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success').then(() =>{
                    window.location.reload();
                });
            } else if (res.data.status === 422 ) {
                swal('All fields are mandatory', '', 'error');
                setError(res.data.errors);
            }
            else if (res.data.status === 409 ) {
                swal('Error', res.data.errors, 'warning');
                setError(res.data.errors);
            } else if (res.data.status === 404) {
                setError([]);
                swal('Error', res.data.message, 'error');
                history.push('admin/view-services');
            }
            
        });
    };

    return (
        <div className="container px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>
                        Edit services |
                        <Link to="/admin/view-services" className="btn btn-primary btn-sm float-end">
                            Back
                        </Link>
                    </h4>
                </div>
                <div className="card-body">
                    <form onSubmit={updateservices} id="EDIT_services_FORM">
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
                                    Home
                                </button>
                            </li>
                            <li className="nav-item" role="presentation">
                                <button
                                    className="nav-link"
                                    id="otherdetails-tab"
                                    data-bs-toggle="tab"
                                    data-bs-target="#otherdetails"
                                    type="button"
                                    role="tab"
                                    aria-controls="otherdetails"
                                    aria-selected="false"
                                >
                                    Other details
                                </button>
                            </li>
                        </ul>
                        <div className="tab-content" id="myTabContent">
                            <div
                                className="tab-pane card-body border show active"
                                id="home"
                                role="tabpanel"
                                aria-labelledby="home-tab"
                            >
                                <div className="form-group mb-3">
                                    <label>Select product</label>
                                    <select
                                        name="product_id"
                                        onChange={handleInput}
                                        className="form-select"
                                        value={servicesInput.product_id}
                                    >
                                        <option>Select product</option>
                                        {productData.map((item) => {
                                            return (
                                                <option value={item.id} key={item.id}>
                                                    {item.name}
                                                </option>
                                            );
                                        })}
                                    </select>
                                    <small className="text-danger">{error?.product_id}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Name</label>
                                    <input
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={servicesInput?.name}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{error?.name}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Description (Optional)</label>
                                    <textarea
                                        name="description"
                                        onChange={handleInput}
                                        value={servicesInput?.description}
                                        className="form-control"
                                    ></textarea>
                                </div>
                            </div>
                            <div
                                className="tab-pane card-body border fade"
                                id="otherdetails"
                                role="tabpanel"
                                aria-labelledby="otherdetails-tab"
                            >
                                <div className="row">
                                    <div className="col-md-4 form-group mb-3">
                                        <label>API service id</label>
                                        <input
                                            type="text"
                                            onChange={handleInput}
                                            value={servicesInput?.api_service_id}
                                            name="api_service_id"
                                            className="form-control"
                                        />
                                        <small className="text-info">
                                            {error.price ? error.price : "Copy this from the API server's end"}
                                        </small>
                                    </div>
                                    <div className="col-md-4 form-group mb-3">
                                        <label>Price</label>
                                        <input
                                            type="number"
                                            step="any"
                                            onChange={handleInput}
                                            name="price"
                                            value={servicesInput?.price}
                                            className="form-control"
                                        />
                                        <small className="text-danger">{error?.price}</small>
                                    </div>
                                    <div className="col-md-4 form-group mb-3">
                                        <label>Status (Checked=available)</label>
                                        <input
                                            type="checkbox"
                                            name="status"
                                            onChange={handleCheckBox}
                                            onClick={handleCheckBox}
                                            defaultChecked={checkbox}
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" className="btn btn-primary px-4 float-end">
                            Update
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default EditServices;
