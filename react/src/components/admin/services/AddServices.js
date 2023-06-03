import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';

function AddServices() {
    const [productList, setproductList] = useState([]);

    const [errorList, setError] = useState([]);

    const [servicesInput, setservices] = useState({
        product_id: '',
        slug: '',
        name: '',
        description: '',
        price: '',
        status: ''
    });


    const handleInput = (e) => {
        e.persist();
        setservices({ ...servicesInput, [e.target.name]: e.target.value });
    };

    useEffect(() => {
        axios.get(`api/view-services`).then((res) => {
            if (res.data.status === 200) {
                setproductList(res.data.product);
            }
        });

        return () => {};
    }, []);

    const handleSubmit = (e) => {
        e.preventDefault();

        axios.post(`api/store-services`, servicesInput).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success');
                setError([]);
                setservices([]);
            } else if (res.data.status === 422) {
                swal('All fields are mandatory', '', 'error');
                setError(res.data.errors);
            }
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className="card mt-4">
                <div className="card-header">
                    <h4>
                        Add services |
                        <Link to="/admin/view-services" className="btn btn-primary btn-sm float-end">
                            View services
                        </Link>
                    </h4>
                </div>
                <form encType="multipart/form-data" onSubmit={handleSubmit} id="add_services_form">
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
                                    Home
                                </button>
                            </li>
                            <li className="nav-item" role="presentation">
                                <button
                                    className="nav-link"
                                    id="seotags-tab"
                                    data-bs-toggle="tab"
                                    data-bs-target="#seotags"
                                    type="button"
                                    role="tab"
                                    aria-controls="seotags"
                                    aria-selected="false"
                                >
                                    SEO Tags
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
                                className="tab-pane card-body border fade show active"
                                id="home"
                                role="tabpanel"
                                aria-labelledby="home-tab"
                            >
                                <div className="form-group mb-3">
                                    <label>Select product</label>
                                    <select
                                        name="product_id"
                                        onChange={handleInput}
                                        value={servicesInput.product_id}
                                        className="form-control"
                                    >
                                        <option>Select product</option>
                                        {productList.map((item) => {
                                            return (
                                                <option value={item.id} key={item.id}>
                                                    {item.name}
                                                </option>
                                            );
                                        })}
                                    </select>
                                    <small className="text-danger">{errorList?.product_id}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Slug</label>
                                    <input
                                        type="text"
                                        name="slug"
                                        onChange={handleInput}
                                        value={servicesInput.slug}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.slug}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Name</label>
                                    <input
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={servicesInput.name}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.name}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Description (Optional)</label>
                                    <textarea
                                        name="description"
                                        onChange={handleInput}
                                        value={servicesInput.description}
                                        className="form-control"
                                    ></textarea>
                                </div>
                            </div>
                            <div className="tab-pane card-body border fade" id="seotags" role="tabpanel" aria-labelledby="seotags-tab">
                                <div className="form-group mb-3">
                                    <label>Meta Title</label>
                                    <input
                                        type="text"
                                        name="meta_title"
                                        onChange={handleInput}
                                        value={servicesInput.meta_title}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.meta_title}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Meta Keywords (Optional)</label>
                                    <textarea
                                        name="meta_keyword"
                                        onChange={handleInput}
                                        value={servicesInput.meta_keyword}
                                        className="form-control"
                                    />
                                </div>
                                <div className="form-group mb-3">
                                    <label>Meta Description (Optional)</label>
                                    <textarea
                                        name="meta_description"
                                        onChange={handleInput}
                                        value={servicesInput.meta_description}
                                        className="form-control"
                                    />
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
                                        <label>Image</label>
                                        <input type="number" onChange={handleInput} name="price" className="form-control" />
                                        <small className="text-danger">{errorList?.price}</small>
                                    </div>
                                    <div className="col-md-4 form-group mb-3">
                                        <label>Status (Checked=avialable)</label>
                                        <input
                                            type="checkbox"
                                            name="status"
                                            onChange={handleInput}
                                            value={servicesInput.status}
                                            className="w-50 h-50"
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button className="btn btn-primary px-4 mt-2 float-end" type="submit">
                        {' '}
                        Submit
                    </button>
                </form>
            </div>
        </div>
    );
}

export default AddServices;
