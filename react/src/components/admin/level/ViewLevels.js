import axios from "axios";
import React,{useEffect, useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";
import { Loader } from "../../Global";

function ViewLevels(){

    const [loading, setLoading] = useState(true);
    const [levelsList, setLevelsList] = useState([]);

    useEffect(()=>{
        axios.get(`api/view-levels`).then(res=>{
            if(res.status===200){
                setLevelsList(res.data.levels);

                $(document).ready(function () {
                    $('table').DataTable();
                });
            }
            setLoading(false);
        })
    },[]);

    return(
        <div className="container px-4">
            <div className="card mt-4">
                <Loader isActive={loading} />
                <div className="card-header">
                    <h4>Levels list</h4>
                    <Link to="/admin/add-level" className="btn btn-primary btn-sm float-end">Add level</Link>
                </div>
                <div className="card-body table-responsive">
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Level</th>                                
                                <th>Percentage</th>
                                <th>Status</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                            { levelsList.map((item, index)=> (
                                    <tr key={index}>
                                        <td>{item.id}</td>
                                        <td>{item.name}</td>
                                        <td>{item.level}</td>
                                        <td>{item.percentage}</td>
                                        <td>{item.status ===1 ? 'Shown' : 'Hidden'}</td>
                                        <td>
                                            <Link to={`/admin/edit-level/${item.id}`} className="btn btn-primary btn-sm">Edit</Link>
                                        </td>
                                    </tr>
                                ))
                            }
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ViewLevels;