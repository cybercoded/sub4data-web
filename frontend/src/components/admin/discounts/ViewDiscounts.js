import axios from "axios";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import Swal from "sweetalert2";
import $ from "jquery";
import { Context } from "../../../contexts/globalContext";
import { getPermission, handleCopy, split_errors } from "../../../util";

function ViewDiscounts() {
    const [discountsList, setDiscountsList] = useState([]);
    const [filter, setFilter] = useState({all: 1});
    const { globalValues } = React.useContext(Context);

    const handleFilter = (key, value) => {
        setFilter(prevFilter => ({ [key]: value }));
    };

    const handleActivate_Deactivate = (status, id) => {
        const actions = { 0: 'Activate', 1: 'Deactivate' };
        let text = actions[status];

        Swal.fire({
            title: `${text} code`,
            text: `Are you sure you want to ${text} the discount code?`,
            icon: "warning",
            buttons: true,
            showCancelButton: true,
            dangerMode: true
        }).then((res) => {
            if (res.isConfirmed) {
                axios.put(`api/update-discount/${id}`).then(res => {
                    if (res?.data.status === 200) {
                        Swal.fire("Deleted!", `The discount has been ${text === 'activate' ? 'activated' : 'deactivated'}`, "success");
                        setDiscountsList(prevList => 
                            prevList.map(item => 
                                item.id === id ? { ...item, status: status === 1 ? 0 : 1 } : item
                            )
                        );
                    } else {
                        Swal.fire("Error", split_errors(res.data.errors), "error");
                    }
                });
            } else {
                Swal.fire("Cancelled", "The discount is safe :)", "error");
            }
        });
    };

    useEffect(() => {
        axios.post(`api/view-discounts`, filter ).then(res => {
            if (res?.data.status === 200) {
                setDiscountsList(res?.data.discounts);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }
        }).catch(error => {
            console.error("Error fetching discounts:", error);
            // Handle error gracefully, e.g., show a message to the user
        });
    }, [filter]);

    return (
        <div className="container px-4">
            <div className="card mt-4">
                <div className="card-header d-flex justify-content-between align-items-center">
                    <h4>Discounts List</h4>
                    <div>
                        <button className={`btn btn-${filter.used === 1 ? 'primary' : 'secondary'} me-2`} onClick={() => handleFilter("used", 1)}>Used codes</button>
                        <button className={`btn btn-${filter.used === 0 ? 'primary' : 'secondary'} me-2`} onClick={() => handleFilter("used", 0)}>Unused codes</button>
                        <button className={`btn btn-${filter.status === 1 ? 'primary' : 'secondary'} me-2`} onClick={() => handleFilter("status", 1)}>Active codes</button>
                        <button className={`btn btn-${filter.status === 0 ? 'primary' : 'secondary'} me-2`} onClick={() => handleFilter("status", 0)}>Inactive codes</button>
                        <button className={`btn btn-${filter.all === 1 ? 'primary' : 'secondary'} me-2`} onClick={() => handleFilter("all", 1)}>All codes</button>
                    </div>
                </div>
                <div className="card-body table-responsive">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Code</th>
                                <th>Percentage</th>
                                <th>User Email</th>
                                {getPermission(globalValues.permissions, 'update_discount') && (
                                    <th>Action</th>
                                )}
                            </tr>
                        </thead>
                        <tbody>
                            {discountsList.map((item, index) => (
                                <tr key={index}>
                                    <td>{item.id}</td>
                                    <td>
                                        {item.code}
                                        <button className='btn btn-sm float-end btn-secondary' type="button" onClick={() => handleCopy(item.code)}>Copy</button>
                                    </td>
                                    <td>{item.percentage}</td>
                                    <td>{item.email || 'Everyone'}</td>
                                    {getPermission(globalValues.permissions, 'update_discount') && (
                                        <td>
                                            <button onClick={() => handleActivate_Deactivate(item.status, item.id)} disabled={!getPermission(globalValues.permissions, 'update_discount')} data-id={item.id} className="btn btn-danger btn-sm">{item.status === 1 ? 'Deactivate' : 'Activate'}</button>
                                        </td>
                                    )}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ViewDiscounts;
