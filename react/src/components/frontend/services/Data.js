import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../Global';

function Data(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [productActive, setProductActive] = useState('');
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);
    const [errorList, setErrorList] = useState([]);

    const [textInput, setTextInput] = useState({
        product_id: '',
        service_id: '',
        phone: '',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });

    };

    const handleProductSelection = (product_id) => {
        setProductActive(product_id);
        setTextInput({ ...textInput, product_id: product_id.toString(), service_id: '' });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });

    };

    const handleProductSelection2 = (e) => {
        var product_id = e.target.value;

        setTextInput({ ...textInput, product_id: product_id, service_id: '' });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });
        setProductActive(Number(product_id));

    };

    const handleServiceSelection = (e) => {
        var amount = e.target.selectedOptions[0].dataset.amount;
        var value = e.target.value;
        setTextInput({ ...textInput, amount: amount, service_id: value });

    };

    const handlePurchaseData = (e) => {
        e.preventDefault();

        swal({
            text: 'Enter your transaction pin',
            content: 'input',
            closeOnClickOutside: false,
            button: {
                text: 'Verify!',
                closeModal: false
            }
        })
            .then((pin) => {
                return axios.get(`/api/verify-pin/${pin}`);
            })
            .then((results) => {
                let result = results.data;

                if (result.status === 200) {
                    swal({
                        title: 'Are you sure?',
                        text: 'Are you sure to proceed with your transaction!',
                        icon: 'warning',
                        buttons: true,
                        dangerMode: true,
                        closeOnClickOutside: false
                    }).then((willDelete) => {
                        if (willDelete) {
                            setLoading(true);
                            axios.post(`/api/data-purchase/`, textInput).then((res) => {
                                if (res.data.status === 200) {
                                    swal('Success!', 'Your transaction has been successfully processed!', 'success').then((res) => {                                        
                                        history.push('/user/dashboard');
                                    });
                                }else {
                                    swal('Error!', res.data.errors, 'error');
                                }
                                setLoading(false);
                            });
                        }
                    });
                } else {
                    swal('Oh noes!', result.message, 'error');
                }
            });
    };

    useEffect(() => {
        const product_id = props.match.params.id;
        axios.get(`api/view-product/${product_id}`).then((res) => {
            if (res.status === 200) {
                setProductList(res.data.product);
            }
            setLoading(false);
        });
    }, [props.match.params.id, history]);

    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Data</b> Purchase |
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />
                <form onSubmit={handlePurchaseData} className="">
                    <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.id && 'active'}`}
                                    onClick={() => {
                                        handleProductSelection(item.id);
                                    }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>

                    <div className="form-group mb-3">
                        <label>Data Services:</label>
                        <select
                            name="product_id"
                            onChange={handleProductSelection2}
                            value={textInput.product_id}
                            className="form-select"
                        >
                            <option value="">--Choose Data Service--</option>
                            {productList?.map((item, index) => (
                                <option key={index} value={item.id}>
                                    {item.name}
                                </option>
                            ))}
                        </select>
                        <small className="text-danger">{errorList?.services}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Data Plan:</label>
                        <select name="service_id" onChange={handleServiceSelection} className="form-select">
                            <option value="">--Choose Data Plan--</option>
                            {serviceList?.map((item, index) => (
                                <option key={index} data-amount={item.amount} value={item.id}>
                                    {item.name}
                                </option>
                            ))}
                        </select>
                        <small className="text-danger">{errorList?.services}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Phone number</label>
                        <input type="phone" name="phone" onChange={handleInput} value={textInput.phone} className="form-control"></input>
                        <small className="text-danger">{errorList?.phone}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input type="text" disabled value={textInput.amount} className="form-control"></input>
                        <small className="text-danger">{errorList?.amount}</small>
                    </div>

                    <div className="form-group mb-3">
                        <button 
                            type="submit" 
                            disabled={textInput.product_id === '' || textInput.service_id === '' || textInput.phone === ''} 
                            className="btn w-100 btn-primary"
                        >
                            Proceed
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Data;
