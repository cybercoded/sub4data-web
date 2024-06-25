import axios from 'axios';
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import Swal from 'sweetalert2';
import { getPermission, split_errors } from '../../../util';
import { Context } from '../../../contexts/globalContext';

function AddDiscount() {
    const [formInput, setFormInput] = useState({
        percentage: '',
        discount_to_user_email: '',
        all_user: true
    });
    const { globalValues } = React.useContext(Context);

    const handleInput = (e) => {
        const { name, value, type, checked } = e.target;
        setFormInput({
            ...formInput,
            [name]: type === 'checkbox' ? checked : value
        });
    };

    const submitDiscount = (e) => {
        e.preventDefault();

        axios.post(`/api/store-discount`, formInput).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error', split_errors(res?.data.errors), 'error');
            }
        });
    };

    return (
        <div className="container-fluid px-4">
            <div className='row'>
                <div className="col-md-6">
                    <div className="card mt-4">
                        <div className="card-header">
                            <h4>
                                Add Discount |
                                <Link to="/admin/view-discounts" className="btn btn-primary btn-sm float-end">
                                    View Discounts
                                </Link>
                            </h4>
                        </div>
                        <div className="card-body">
                            <form onSubmit={submitDiscount}>
                                <div className="form-group mb-3">
                                    <label>Percentage</label>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_discount')}
                                        type="float"
                                        name="percentage"
                                        onChange={handleInput}
                                        value={formInput.percentage}
                                        className="form-control"
                                        required
                                        min={1}
                                        max={100}
                                    />
                                </div>
                                {!formInput.all_user && (
                                    <div className="form-group mb-3">
                                        <label>Discount to User Email</label>
                                        <input
                                            disabled={!getPermission(globalValues.permissions, 'create_discount')}
                                            type="email"
                                            name="discount_to_user_email"
                                            onChange={handleInput}
                                            value={formInput.discount_to_user_email}
                                            className="form-control"
                                        />
                                    </div>
                                )}
                                <div className="form-group mb-3">
                                    <span>Apply to All Users</span>
                                    <input
                                        disabled={!getPermission(globalValues.permissions, 'create_discount')}
                                        type="checkbox"
                                        name="all_user"
                                        id="admin-discount-to-all"
                                        onChange={handleInput}
                                        checked={formInput.all_user}
                                    />
                                    <label htmlFor="admin-discount-to-all"></label>
                                </div>
                                <button type="submit" disabled={!getPermission(globalValues.permissions, 'create_discount')} className="btn btn-primary px-4">
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default AddDiscount;
