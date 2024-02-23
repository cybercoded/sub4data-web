import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import swal from 'sweetalert';


function AddProduct() {

    
    const [categoryList, setCategoryList] = useState([]);
    const [errorList, setError] = useState([]);
    const [productInput, setProduct] = useState({
        category_id: '3',
        api_product_id: '',
        name: '',
        description: '',
        discount: '',
        charges: '',
        status: true
    });

    const [picture, setPicture] = useState([]);

    const handleInput = (e) => {
        e.persist();
        setProduct({ ...productInput, [e.target.name]: e.target.value });
    };

    const handleImage = (e) => {
        setPicture({ image: e.target.files[0] });
    };

    useEffect(() => {
        axios.get(`api/all-category`).then((res) => {
            if (res.data.status === 200) {
                setCategoryList(res.data.category);

                
            }
        });

        return () => {};
    }, []);

    const handleSubmit = (e) => {
        e.preventDefault();

        const formData = new FormData();

        formData.append('image', picture.image);
        formData.append('category_id', productInput.category_id);
        formData.append('api_product_id', productInput.api_product_id);
        formData.append('name', productInput.name);
        formData.append('description', productInput.description);
        formData.append('discount', productInput.discount);
        formData.append('charges', productInput.charges);
        formData.append('status', productInput.status);

        
        axios.post(`api/store-product`, formData).then((res) => {
            if (res.data.status === 200) {
                swal('Success', res.data.message, 'success').then(() =>{                    
                    window.location.reload();
                });
                
            } else if (res.data.status === 422) {
                swal('All fields are mandatory', '', 'error');
                setError(res.data.errors);
            }
            
        });
    };

    return (
        <div className="container px-4">            
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>
                        Add product |
                        <Link to={"/admin/view-product"} className="btn btn-primary btn-sm float-end">
                            View product
                        </Link>
                    </h4>
                </div>
                <form encType="multipart/form-data" onSubmit={handleSubmit} id="add_product_form">
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
                                    <label>Select Category</label>
                                    <select
                                        name="category_id"
                                        onChange={handleInput}
                                        value={productInput.category_id}
                                        defaultValue={productInput.category_id}
                                        className="form-select"
                                    >
                                        <option>Select Category</option>
                                        {categoryList.map((item) => {
                                            return (
                                                <option value={item.id} key={item.id}>
                                                    {item.name}
                                                </option>
                                            );
                                        })}
                                    </select>
                                    <small className="text-danger">{errorList?.category_id}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>api_product_id</label>
                                    <input
                                        type="text"
                                        name="api_product_id"
                                        onChange={handleInput}
                                        value={productInput.api_product_id}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.api_product_id}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Name</label>
                                    <input
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={productInput.name}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.name}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Description (Optional)</label>
                                    <textarea
                                        name="description"
                                        onChange={handleInput}
                                        value={productInput.description}
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
                                <div className="form-group mb-3">
                                    <label>Discount</label>
                                    <input
                                        type="text"
                                        name="discount"
                                        step="any"
                                        onChange={handleInput}
                                        value={productInput.discount}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.discount}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Charges</label>
                                    <input
                                        type="number"
                                        step="any"
                                        name="charges"
                                        onChange={handleInput}
                                        value={productInput.charges}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.discount}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Image</label>
                                    <input type="file" onChange={handleImage} name="image" className="form-control" />
                                    <small className="text-danger">{errorList?.image}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Status (Checked=avialable)</label>
                                    <input
                                        type="checkbox"
                                        name="status"
                                        onChange={handleInput}
                                        value={productInput.status}
                                        defaultChecked={productInput.status}
                                    />
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

export default AddProduct;
