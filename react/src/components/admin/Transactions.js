import axios from "axios";
import React, {useEffect,useState} from "react";
import { Link } from "react-router-dom";
import swal from "sweetalert";
import $ from "jquery";
import { Loader } from "../Global";

function Transactions(props){
    const user_id = props.match.params.id;

    const [transactionData, setTransactionData] = useState([]);
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);

    const [loading, setLoading] = useState(true);
    const [textInput, setTextInput] = useState({
        limit: 10,
        user_id: user_id
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleTransactionFilter = (e) => {
        e.preventDefault();

        setLoading(true);
        axios.post(`/api/filter-transactions`, textInput).then((res) => {
            if(res.data.status === 200) {
                setTransactionData(res.data.data);
            } else {
                swal("Error", res.data.errors, "error");
            }
            setLoading(false);
        });

    };

    const handleViewTransaction = (e) => {
        e.preventDefault();
        var dataArray = e.target.dataset;
        console.log(dataArray);
        var table = document.createElement("div");
        table.style.textAlign = "left";
        table.innerHTML = (`<table class="table align-left table-striped table-hover">
            <body style="align-text: left;">
                <tr>
                    <th>Refernce</th>
                    <td>${dataArray.reference}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>${dataArray.name}</td>
                </tr>
                <tr>
                    <th>Amount</th>
                    <td>${dataArray.amount}</td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td>${dataArray.product}</td>
                </tr>
                <tr>
                    <th>Service</th>
                    <td>${dataArray.service}</td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td>${dataArray.description}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>${dataArray.status}</td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td>${dataArray.date}</td>
                </tr>
            </body>
        </table>`);
        swal({
            content: table,
            buttons: {
                confirm: true,
                cancel: false,
            }
        });
    };

    const handleProductSelection = (e) => {
        var product_id = e.target.value;

        setTextInput({ ...textInput, product_id: product_id });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });
    };

    const handleLoadMoreTransaction = (e) => {
        e.preventDefault();
       
        setLoading(true);
        axios.post(`/api/filter-transactions${!user_id ? '-admin' : ''}`, textInput).then((res) => {
            if(res.data.status===200)
            {
                setTransactionData(res.data.data);
                $(document).ready(function () {
                    $('#table').DataTable();
                });
                setTextInput({...textInput, limit: textInput.limit + 10 });
                setLoading(false);
            }
        });

    }

    useEffect(() => {

        setLoading(true);
        axios.post(`/api/filter-transactions${!user_id ? '-admin' : ''}`, textInput).then((res) => {
            if(res.data.status===200)
            {
                setTransactionData(res.data.data);
                $(document).ready(function () {
                    $('#table').DataTable();
                });
                setTextInput({...textInput, limit: textInput.limit + 10 });
                setLoading(false);
            }
        });
    }, []);


    return(
        <div className="container py-5">
            <div className="card">
                <Loader isActive={loading} />
                <div className="card-header">
                    <h4>View service | </h4>
                </div>
                <div className="card-body">
                    <form onSubmit={handleTransactionFilter}>
                        <div className="row">
                            <div className="col-md-3 col-6">
                                <div className="form-group">
                                    <label htmlFor="type">Transaction Type</label>
                                    <select className="form-select" onChange={handleInput} name="type" id="transaction-type">
                                        <option value="">All</option>
                                        <option value="debit">Debits</option>
                                        <option value="credit">Credits</option>
                                        <option value="debit_transfer">Debit Transfer</option>
                                        <option value="credit_transfer">Transfer Transfer</option>
                                    </select>
                                </div>
                            </div>

                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Products:</label>
                                    <select
                                    name="product_id"
                                        onChange={handleProductSelection}
                                        value={textInput.product_id}
                                        className="form-select"
                                    >
                                        <option value="">--Choose Product--</option>
                                        {productList?.map((item, index) => (
                                            <option key={index} value={item.id}>
                                                {item.name}
                                            </option>
                                        ))}
                                    </select>
                                </div>
                            </div>
                            
                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Services:</label>
                                    <select name="service_id" onChange={handleInput} className="form-select">
                                        <option value="">--Choose Service--</option>
                                        {serviceList?.map((item, index) => (
                                            <option key={index} data-amount={item.amount} value={item.id}>
                                                {item.name}
                                            </option>
                                        ))}
                                    </select>
                                </div>
                            </div>
                            
                            <div className="col-md-3 col-6">
                                <div className="form-group mb-3">
                                    <label>Status:</label>
                                    <select name="status" onChange={handleInput} className="form-select">
                                        <option value="">--Choose Status--</option>
                                        <option value="success">Success</option>
                                        <option value="failed">Failed</option>
                                        <option value="pending">Pending</option>
                                    </select>
                                </div>
                            </div>

                            <div className="col-md-3 col-6">
                                <div className="form-group">
                                    <label htmlFor="from">Date from</label>                                    
                                    <input type="date" onChange={handleInput} name="from" className="form-control" id="from" />    
                                </div>                                
                            </div>
                            <div className="col-md-3 col-6">
                                <div className="form-group">
                                    <label htmlFor="to">Date to</label>                                    
                                    <input type="date" name="to" onChange={handleInput} className="form-control" id="to" />
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
                        <table id="table" className="table table-boardered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Reference</th>
                                    <th>Amount</th>
                                    <th>Description</th>
                                    <th>Name</th>
                                    <th>Product</th>
                                    <th>Service</th>
                                    <th>Status</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>
                                {transactionData.map((item, index)=> (
                                        <tr key={index}>
                                            <td>{index+1}</td>
                                            <td><Link to={`/admin/edit-user/${item.user.id}`}>{item.user.name}</Link></td>
                                            <td>{item.reference}</td>
                                            <td>{item.amount}</td>
                                            <td>{item.description}</td>                                            
                                            <td>{item.product?.name}</td>
                                            <td>{item.service?.name}</td>
                                            <td><span className="badge bg-info">{item.status}</span></td>
                                            <td>
                                                <button onClick={handleViewTransaction} 
                                                    className="btn btn-success btn-sm"
                                                    data-reference={item.reference}
                                                    data-amount={item.amount}
                                                    data-name={item.user.name}
                                                    data-product={item.product?.name}
                                                    data-service={item.service?.name}
                                                    data-status={item.status}
                                                    data-description={item.description}
                                                    data-date={item.created_at}
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
                                    <td colSpan={9}>
                                        <button onClick={handleLoadMoreTransaction} className="btn btn-primary btn-sm float-end">Load more transactions</button>
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

export default Transactions;