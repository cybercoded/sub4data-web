import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";


function ViewUsers(props){
    const [usersData, setUsersData] = useState([]);

    
    const [textInput, setTextInput] = useState({
        limit: 10,
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleUsersFilter = (e) => {
        e.preventDefault();

        
        axios.post(`/api/filter-users`, textInput).then((res) => {
            if(res.data.status === 200) {
                setUsersData(res.data.users);
            } else {
                swal("Error", res.data.errors, "error");
            }
            
        });

    };

    const handleLoadMoreUsers = (e) => {
        e.preventDefault();
       
        
        axios.post(`api/view-users`).then(res=>{
            if(res.data.status===200)
            {
                setUsersData(res.data.users);
                $(document).ready(function () {
                    $('#table').DataTable();
                });
                setTextInput({...textInput, limit: textInput.limit + 10 });
                
            }
        });

    }

    useEffect(() => {

        
        axios.post(`api/view-users`).then(res=>{
            if(res.data.status===200)
            {
                setUsersData(res.data.users);
                $(document).ready(function () {
                    $('#table').DataTable();
                });
                setTextInput({...textInput, limit: textInput.limit + 10 });
                
            }
        });
    }, [textInput]);


    return(
        <div className="container py-5">
            <div className="card">
                
                <div className="card-header">
                    <h4>View Users | </h4>
                </div>
                <div className="card-body">
                    <form onSubmit={handleUsersFilter}>
                        <div className="row">                            
                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Role:</label>
                                    <select name="role_as" onChange={handleInput} className="form-select">
                                        <option value="">--Choose Role--</option>
                                        <option value={1}>Admin</option>
                                        <option value={0}>User</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Status:</label>
                                    <select name="status" onChange={handleInput} className="form-select">
                                        <option value="">--Choose Status--</option>
                                        <option value={1}>Active</option>
                                        <option value={0}>Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <div className="col-md-3 col-6">
                                <div className="form-group">
                                    <label htmlFor="to">Search</label>                                    
                                    <input type="search" name="search" onChange={handleInput} className="form-control" id="search" placeholder="Search for key words" />
                                </div>                                  
                            </div>
                            <div className="col-12">
                                <div className="form-group">
                                    <button type="submit" onChange={handleInput} className="btn btn-primary">Filter</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div className="table-responsive">
                        <table id="table" className="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Balance</th>
                                    <th>Level</th>
                                    <th>Status</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>
                                {usersData.map((item, index)=> (
                                        <tr key={index}>
                                            <td>{index+1}</td>
                                            <td>{item.name}</td>
                                            <td>{item.email}</td>                                            
                                            <td>₦{ new Intl.NumberFormat().format(item.balance)}</td>                                            
                                            <td><span className="badge bg-success">{item.levels[0]['name']}</span></td>
                                            <td><span className="badge bg-info">{item.status === 1 ? 'Active' : 'Inactive'}</span></td>
                                            <td>
                                                <Link className="btn btn-primary btn-sm float-end" to={`/admin/edit-user/${item.id}`}>View</Link>
                                            </td>
                                        </tr>
                                    ))
                                }
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colSpan={7}>
                                        <button onClick={handleLoadMoreUsers} className="btn btn-primary btn-sm float-end">Load more users</button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default ViewUsers;