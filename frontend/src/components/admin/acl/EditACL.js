import axios from 'axios';
import React, { useEffect, useState } from 'react';
import Swal from 'sweetalert2';
import { Context } from '../../../contexts/globalContext';
import { getPermission } from '../../../util';


function EditACLs(props) {
    let user_id = props.match.params.id;
    const [acls, setAcls] = useState([]);
    const [checkboxes, setCheckboxes] = useState({});
    const { globalValues } = React.useContext(Context);

    const updateACLs = (e) => {
        e.preventDefault();

        axios.put(`/api/update-acls/${user_id}`, checkboxes).then((res) => {
            if (res?.data.status === 200) {
                Swal.fire('Success', res?.data.message, 'success').then(() => {
                    window.location.reload();
                });
            } else {
                Swal.fire('Error', JSON.stringify(res?.data.errors), 'error');
            }
            
        });
    };

    const handleCheckBox = (e) => {
        e.persist();
        setCheckboxes(prevCheckboxes => ({ ...prevCheckboxes, [e.target.name]: e.target.checked }));
    };

    const handleCheckAllBoxes = (e) => {
        e.persist();
    
        var checkboxes = document.querySelectorAll('input.permission-box');
        checkboxes.forEach(function(checkbox) {
            checkbox.checked = e.target.checked; // Mark the checkbox as checked
            setCheckboxes(prevCheckboxes => ({ ...prevCheckboxes, [checkbox.name]: e.target.checked }));
        });
    };

    useEffect(() => {        

        axios.get(`api/view-acls/${user_id}`).then(res=>{
            if(res?.data.status===200){
                let permissionLists = res?.data.permissions
                setAcls(permissionLists);
            }
            
        })
    }, [user_id]);

    return (
        <div className="container px-4">
            <div className='col-lg-5 col-md-6'>
                <div className="card mt-4">
                    <form onSubmit={updateACLs} className="card-body table-responsive">
                        <table className="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Role</th>
                                    <th>
                                        Actions 
                                        <span>
                                            <input type='checkbox' id='checkbox-all-permissions' title='Select or unselect all roles' onChange={handleCheckAllBoxes} />
                                            <label htmlFor='checkbox-all-permissions'></label>
                                        </span>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                { acls?.map((item, index)=> (
                                        <tr key={index}>
                                            <td>{index+1}</td>
                                            <td>{item.name}</td>
                                            <td>
                                                <input type='checkbox' disabled={!getPermission(globalValues.permissions, 'update_acls')} id={item.slug} title='Select this role' className='permission-box' name={`${item?.slug}`} onChange={handleCheckBox} defaultChecked={item.status === 1} />
                                                <label htmlFor={item.slug}></label>
                                            </td>
                                        </tr>
                                    ))
                                }
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colSpan={3}>
                                        <button onClick={updateACLs} disabled={!getPermission(globalValues.permissions, 'update_acls')} className="btn btn-primary btn-sm float-end">Update permissions</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default EditACLs;
