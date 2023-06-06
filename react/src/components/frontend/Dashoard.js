import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ReactjsOverlayLoader from 'reactjs-overlay-loader';
import $ from 'jquery';

function Dashboard() {
    const [loading, setLoading] = useState(true);
    const [categoryList, setCategoryList] = useState([]);
    const [bankList, setBankList] = useState([]);

    useEffect(() => {
        axios.get(`api/view-category`).then((res) => {
            if (res.data.status === 200) {
                setCategoryList(res.data.category);
            }
            setLoading(false);
        });

        axios.get(`api/user-banks`).then((res) => {
            if (res.data.status === 200) {
                setBankList(res.data.banks);
            }
            setLoading(false);
        });
    }, []);

    const handleCopy = (elementId) => {
        // Create a "hidden" input
        var aux = document.createElement("input");

        // Assign it the value of the specified element
        aux.setAttribute("value", document.getElementById(elementId).innerHTML);

        // Append it to the body
        document.body.appendChild(aux);

        // Highlight its content
        aux.select();

        // Copy the highlighted text
        document.execCommand("copy");

        // Remove it from the body
        document.body.removeChild(aux);
    };

    return (
        <div className="container mt-5">
            <ReactjsOverlayLoader
                isActive={loading}
                icon={<img alt="loader" width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif'} />}
            />

            <div>
                <div style={{overflowX: 'scroll', overflowY: 'hidden'}}>
                    <div style={{width: 4000}}>
                        { bankList.map((item, index) => (
                                <div key={index} className='card bg-light my-bank-card bg-light border-danger float-start' style={{minWidth: 250, marginRight: 10}}>
                                    <div className="card-body" style={{height: 150}}>
                                        <div>
                                            {item.bank_name}
                                            <span className="float-endd">{item.account_name}</span>
                                        </div>
                                        <div className='h1'>{item.account_number}</div>
                                        <div className='mt-3'>
                                            <button className='btn btn-sm btn-info' 
                                                onClick={() =>  navigator.clipboard.writeText(item.account_number)}                                            
                                            >
                                                Copy Account Number
                                            </button>
                                        </div>                                        
                                    </div>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>
            
            <div className="row">
                {categoryList.map((item, index) => (
                    <Link to={`services/${item.slug}/${item.id}`} key={index} className="col-md-3 col-6 text-muted text-decoration-none">
                        <div className="card bg-light rd-5 mb-4">
                            <div className="card-body text-center">
                                <div>
                                    <img
                                        src={`http://localhost:8000/${item.image}`}
                                        className="mb-2"
                                        width="50"
                                        height="50"
                                        alt={item.name}
                                    />
                                </div>
                                <div className="h5">{item.name}</div>
                            </div>
                        </div>
                    </Link>
                ))}
            </div>
        </div>
    );
}

export default Dashboard;
