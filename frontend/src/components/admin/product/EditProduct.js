import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import Swal from 'sweetalert2';
import { Context } from '../../../contexts/globalContext';
import { getPermission, url } from '../../../util';



function EditProduct(props) {
    const history = useHistory();
    const [categoryList, setCategoryList] = useState([]);
    const [errorList, setError] = useState([]);
    const { globalValues } = React.useContext(Context);
    const [checkbox, setCheckbox] = useState();
    const [productInput, setProduct] = useState({
        category_id: '',
        api_product_id: '',
        name: '',
        description: '',
        discount: '',
        charges: ''
    });

    const handleInput = (e) => {
        e.persist();
        setProduct({ ...productInput, [e.target.name]: e.target.value });
    };

    const [picture, setPicture] = useState([]);
    const handleImage = (e) => {
        setPicture({ image: e.target.files[0] });
    };

    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked);
    };

    useEffect(() => {
        axios.get(`api/all-category`).then((res) => {
            if (res?.data.status === 200) {
                setCategoryList(res?.data.category);
            }
        });

        const product_id = props.match.params.id;

        axios.get(`api/view-product/${product_id}`).then((res) => {
            if (res?.data.status === 200) {
                setProduct(res?.data.product);
                setCheckbox(res?.data.product.status === 1 ? true : false);
            } else if (res?.data.status === 404) {
                Swal.fire('Error', res?.data.message, 'error');
                history.push('admin/view-product');
            }
            
        });
    }, [props.match.params.id, history]);

    const updateProduct = (e) => {
        e.preventDefault();

        const formData = new FormData();

        formData.append('image', picture.image);
        formData.append('category_id', productInput.category_id);
        formData.append('api_product_id', productInput.api_product_id);
        formData.append('name', productInput.name);
        formData.append('description', productInput.description);
        formData.append('discount', productInput.discount);
        formData.append('charges', productInput.charges);
        formData.append('status', checkbox);

        const product_id = props.match.params.id;

        axios.post(`api/update-product/${product_id}`, formData).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else if (res?.data.status === 422) {
                Swal.fire('All fields are mandatory', '', 'error');
                setError(res?.data.errors);
            } else if (res?.data.status === 404) {
                Swal.fire('Erro', res?.data.message, 'error');
                history.push('admin/view-product');
            }
            
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>
                        Edit product |
                        <Link to="/admin/view-product" className="btn btn-primary btn-sm float-end">
                            View product
                        </Link>
                    </h4>
                </div>
                <form encType="multipart/form-data" onSubmit={updateProduct} id="add-product-form">
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
                                className="tab-pane fade show active"
                                id="home"
                                role="tabpanel"
                                aria-labelledby="home-tab"
                            >
                                <div className="form-group mb-3">
                                    <label>Select Category</label>
                                    <select
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
                                        name="category_id"
                                        onChange={handleInput}
                                        value={productInput.category_id}
                                        className="form-select"
                                    >
                                        <option>Select Category</option>
                                        {categoryList?.map((item) => {
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
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
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
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={productInput.name}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.name}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Description</label>
                                    <textarea
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
                                        name="description"
                                        onChange={handleInput}
                                        value={productInput.description}
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
                                <div className="form-group mb-3">
                                    <label>Discount</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
                                        type="number"
                                        step="any"
                                        name="discount"
                                        onChange={handleInput}
                                        value={productInput.discount}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{errorList?.discount}</small>
                                </div>
                                
                                <div className="form-group mb-3">
                                    <label>Charges</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
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
                                    <img src={`${url()}${productInput.image}`} width="50" height="50" alt="img" />
                                    <small className="text-danger">{errorList?.image}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Status (Checked=available)</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'update_products')}
                                        type="checkbox"
                                        name="status"
                                        onChange={handleCheckBox}
                                        defaultChecked={checkbox}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>                    
                </form>
                <div className='card-footer'>
                    <button form='add-product-form' disabled={!getPermission(globalValues.permissions, 'update_products')} className="btn btn-primary px-4 mt-2" type="submit">Submit</button>
                </div>
            </div>
        </div>
    );
}

export default EditProduct;
