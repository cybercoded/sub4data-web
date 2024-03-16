import axios from 'axios';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { getPermission, split_errors } from '../../../util';
import { Context } from '../../../contexts/globalContext';


function AddCategory() {

    const { globalValues } = React.useContext(Context);
    const [categoryInput, setCategory] = useState({
        slug: '',
        name: '',
        description: '',
        status: true,
        meta_title: '',
        meta_keyword: '',
        meta_description: '',
        error_list: []
    });

    const [checkbox, setCheckbox] = useState(true)

    const handleInput = (e) => {
        e.persist();
        setCategory({ ...categoryInput, [e.target.name]: e.target.value });
    };

    const handleCheckbox = (e) => {
        e.persist();
        setCheckbox(e.target.checked)
    };

    const [picture, setPicture] = useState([]);
    const handleImage = (e) => {
        setPicture({ image: e.target.files[0] });
    };

    const submitCategory = (e) => {
        e.preventDefault();
        const formData = new FormData();

        formData.append('image', picture.image);
        formData.append('slug', categoryInput.slug);
        formData.append('name', categoryInput.name);
        formData.append('description', categoryInput.description);
        formData.append('status', categoryInput.status);
        formData.append('meta_title', categoryInput.meta_title);
        formData.append('meta_description', categoryInput.meta_description);
        formData.append('meta_keyword', categoryInput.meta_keyword);

        
        axios.post(`/api/store-category`, formData).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else if (res?.data.status === 400) {
                Swal.fire({
                    title: 'Warning!',
                    html: split_errors(res?.data?.errors),
                    icon: 'error'
                });
            }
            
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>
                        Add Category |
                        <Link to="/admin/view-category" className="btn btn-primary btn-sm float-end">
                            View Categories
                        </Link>
                    </h4>
                </div>
                <div className="card-body">
                    <form onSubmit={submitCategory} id="CATEGORY_FORM">
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
                                    id="seo-tags-tab"
                                    data-bs-toggle="tab"
                                    data-bs-target="#seo-tags"
                                    type="button"
                                    role="tab"
                                    aria-controls="seo-tags"
                                    aria-selected="false"
                                >
                                    SEO Tags
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
                                    <label>Slug</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        type="text"
                                        name="slug"
                                        onChange={handleInput}
                                        value={categoryInput.slug}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{categoryInput?.error_list.slug}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Name</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        type="text"
                                        name="name"
                                        onChange={handleInput}
                                        value={categoryInput.name}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{categoryInput?.error_list.name}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Description (Optional)</label>
                                    <textarea
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        name="description"
                                        onChange={handleInput}
                                        value={categoryInput.description}
                                        className="form-control"
                                    />
                                </div>
                                <div className="form-group mb-3">
                                    <input disabled={!getPermission(globalValues.permissions, 'create_categories')} type="checkbox" id="checkbox-add-category" name="status" onChange={handleCheckbox} defaultChecked={checkbox} />
                                    <label htmlFor="checkbox-add-category"></label>
                                    <span>Status (Optional)</span>
                                </div>
                            </div>
                            <div className="tab-pane fade" id="seo-tags" role="tabpanel" aria-labelledby="seo-tags-tab">
                                <div className="form-group mb-3">
                                    <label>Meta Title</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        type="text"
                                        name="meta_title"
                                        onChange={handleInput}
                                        value={categoryInput.meta_title}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{categoryInput?.error_list.meta_title}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Meta Keywords (Optional)</label>
                                    <textarea
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        name="meta_keyword"
                                        onChange={handleInput}
                                        value={categoryInput.meta_keyword}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{categoryInput?.error_list.meta_keyword}</small>
                                </div>
                                <div className="form-group mb-3">
                                    <label>Meta Description (Optional)</label>
                                    <textarea
                                        disabled={!getPermission(globalValues.permissions, 'create_categories')}
                                        name="meta_description"
                                        onChange={handleInput}
                                        value={categoryInput.meta_description}
                                        className="form-control"
                                    />
                                    <small className="text-danger">{categoryInput?.error_list.meta_description}</small>
                                </div>

                                <div className="form-group mb-3">
                                    <label>Image</label>
                                    <input type="file" disabled={!getPermission(globalValues.permissions, 'create_categories')} onChange={handleImage} name="image" className="form-control" />
                                    <img src={`${process.env.REACT_APP_URL}${categoryInput.image}`} width="50" height="50" alt="Img" />
                                    <small className="text-danger">{categoryInput?.error_list.image}</small>
                                </div>
                            </div>
                        </div>                        
                    </form>
                </div>
                <div className='card-footer'>
                    <button type="submit" disabled={!getPermission(globalValues.permissions, 'create_categories')} className="btn btn-primary px-4">Add category</button>
                </div>
            </div>
        </div>
    );
}

export default AddCategory;
