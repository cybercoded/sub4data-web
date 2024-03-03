import axios from "axios";
import React,{useEffect, useState} from "react";
import swal from "sweetalert";


function ViewActivities(){
    
    const [activityList, setActivityList] = useState([]);
    const [textInput, setTextInput] = useState({
        limit: 10,
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleViewLog = (log)=>{
        let view = "";
        let divElement = document.createElement("div");
        divElement.style.textAlign = 'left';
        for (const [key, value] of Object.entries(log)) {
            view += (`
                    <tr>
                        <th>${key}</th>
                        <td>${value}</td>
                    </tr>                
            `);
        }        
        divElement.innerHTML = (`
            <table className="table table-bordered">
                <tbody>
                    ${view}
                </tbody>
                </thead>
            </table>
        `);

        swal(divElement);
    }

    const handleLoadMoreLogs = ()=>{
        
        axios.get(`api/get-activities`, textInput).then(res=>{
            if(res.status===200){
                setActivityList([...activityList,...res.data.activities]);
                setTextInput({...textInput, limit: textInput.limit + 10 });
            }
            
        })
    }

    const handleUsersFilter = (e) => {
        e.preventDefault();

        
        axios.post(`/api/filter-activities`, textInput).then((res) => {
            if(res.data.status === 200) {
                setActivityList([...activityList,...res.data.activities]);
            } else {
                swal("Error", res.data.errors, "error");
            }
            
        });

    };

    useEffect(()=>{
        axios.get(`api/get-activities`).then(res=>{
            if(res.status===200){
                setActivityList(res.data.activities);
            }
            
        })
    },[]);
    return(
    
        <div className="container px-4">
            <div className="card mt-4">
                
                <div className="card-header">
                    <h4>Activity Logs</h4>
                </div>
                <div className="card-body">
                    <form onSubmit={handleUsersFilter}>
                        <div className="row">                            
                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Type:</label>
                                    <select name="type" onChange={handleInput} className="form-select">
                                        <option value="">--Choose Types--</option>
                                        <option value="bulk_email">Bulk Mail</option>
                                        <option value="registration">Registration</option>
                                        <option value="verification">Verification</option>
                                        <option value="transaction">Transaction</option>
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
                    <table className="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Title</th>                                
                                <th><span className="float-end">View</span></th>
                            </tr>
                        </thead>
                        <tbody>
                            { activityList.map((item, index)=> (
                                    <tr key={index}>
                                        <td>{index+1}</td>
                                        <td>{item.title}</td>
                                        <td>{item.type}</td>
                                        <td>
                                            <button onClick={() => handleViewLog(item.log)} 
                                                className="btn btn-primary btn-sm float-end"
                                            >
                                                View
                                            </button>
                                        </td>
                                    </tr>
                                ))
                            }
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colSpan={4}>
                                    <button onClick={handleLoadMoreLogs} className="btn btn-primary btn-sm float-end">Load more</button>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    );
}

export default ViewActivities;