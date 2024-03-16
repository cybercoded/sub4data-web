import axios from 'axios';
import React, { useState, useEffect } from 'react';
import { Link, useHistory } from 'react-router-dom';
import Swal from 'sweetalert2';
import { getPermission } from '../../../util';
import { Context } from '../../../contexts/globalContext';



function EditServices(props) {
    const history = useHistory();
    const { globalValues } = React.useContext(Context);
    const [checkbox, setCheckbox] = useState();
    const [servicesInput, setServices] = useState([]);
    const [productData, setProductData] = useState([]);
    const [error, setError] = useState([]);

    useEffect(() => {
        
        axios.get(`api/view-product`).then((res) => {
            if (res?.data.status === 200) {
                setProductData(res?.data.product);
            }
            
        });

        const services_id = props.match.params.id;
        axios.get(`/api/get-services/${services_id}`).then((res) => {
            if (res?.data?.status === 200) {
                setServices(res.data.service);
                console.log(res.data.service.status === 1)
                setCheckbox(res.data.service.status === 1 ? true : false);
            } else if (res?.data?.status === 404) {
                Swal.fire('Error', res.data.message, 'error');
                history.goBack();
            }
            
        });
    }, [props.match.params.id, history]);

    const handleInput = (e) => {
        e.persist();
        setServices({ ...servicesInput, [e.target.name]: e.target.value });
    };
   
    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked);
    };

    const updateServices = (e) => {
        e.preventDefault();
        const services_id = props.match.params.id;

        axios.put(`api/update-services/${services_id}`, {...servicesInput, status: checkbox}).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() =>{
                    window.location.reload();
                });
            } else if (res?.data.status === 422 ) {
                Swal.fire('All fields are mandatory', '', 'error');
                setError(res?.data.errors);
            }
            else if (res?.data.status === 409 ) {
                Swal.fire('Error', res?.data.errors, 'warning');
                setError(res?.data.errors);
            } else if (res?.data.status === 404) {
                setError([]);
                Swal.fire('Error', res?.data.message, 'error');
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
                    <form onSubmit={updateServices} id="edit-service-form">
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
                                        disabled={!getPermission(globalValues.permissions, 'update_services')}
                                        name="product_id"
                                        onChange={handleInput}
                                        className="form-select"
                                        value={servicesInput?.product_id}
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
                                        disabled={!getPermission(globalValues.permissions, 'update_services')}
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
                                        disabled={!getPermission(globalValues.permissions, 'update_services')}
                                        name="description"
                                        onChange={handleInput}
                                        value={servicesInput?.description}
                                        className="form-control"
                                    ></textarea>
                                </div>
                            </div>
                            <div
                                className="tab-pane fade"
                                id="otherdetails"
                                role="tabpanel"
                                aria-labelledby="otherdetails-tab"
                            >
                                <div className="row">
                                    <div className="col-md-4 form-group mb-3">
                                        <label>API service id</label>
                                        <input
                                            disabled={!getPermission(globalValues.permissions, 'update_services')}
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
                                            disabled={!getPermission(globalValues.permissions, 'update_services')}
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
                                        <p>Status (Checked=available)</p>
                                        <input
                                            disabled={!getPermission(globalValues.permissions, 'update_services')}
                                            id='edit-service-checkbox'
                                            type="checkbox"
                                            name="status"
                                            onChange={handleCheckBox}
                                            defaultChecked={checkbox}
                                        />
                                        <label htmlFor='edit-service-checkbox'></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div className='card-footer'>
                    <button disabled={!getPermission(globalValues.permissions, 'update_services')} form='edit-service-form' type="submit" className="btn btn-primary px-4">Update service</button>
                </div>
            </div>
        </div>
    );
}

export default EditServices;
