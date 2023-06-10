import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import Toastify from 'toastify-js';
import $ from 'jquery';
import { Loader } from '../../Global';

function Electricity(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [discount, setDiscount] = useState();
    const [productActive, setProductActive] = useState();
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextInput] = useState({
        product_id: '',
        service_id: '',
        meter_number: '54150268040',
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

    const handleVerification = (e) => {        
        e.persist();

        if(textInput.meter_number !== '' && textInput.product !== '' && textInput.service_id !== '') {

            setLoading(true);
            axios.post(`api/meternumber-verification`, {meter_number: textInput.meter_number, service_id: textInput.service_id}).then((res) => {
                if (res.data.status === 200) {
                    $('#beneficiary-name').val(res.data.name);
                    $('#validatation-container').removeAttr('hidden')
                    $('#proceed-btn').attr('hidden', 'hidden');
                    Toastify({
                        text: "Your card has been verified!",
                        duration: 3000,
                        className: "info",
                        close: true,
                        gravity: "top", // `top` or `bottom`
                        position: "center", // `left`, `center` or `right`
                        stopOnFocus: true, // Prevents dismissing of toast on hover
                        offset: {
                            y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
                        },
                    }).showToast();

                }else {
                    swal('Unable to verify!', 'Please check your smartcard number and try again', 'error');
                }
                setLoading(false);
            });
        }else {
            swal('All fields are required!', 'Fill and select all fields', 'error');
        }
    };

    const handleAmount = (e) => {
        var value = e.target.value;
        setTextInput({ ...textInput, [e.target.name]: value });

        var response = '';
        if (value < 500) {
            response = 'Amount should not be lesser than 500';
        }
        if (value > 10000) {
            response = 'Amount should not be greater than 10,000';
        }

        setErrorList({ ...errorList, amount: response });
    };


    const handlePurchaseElectricity = (e) => {
        e.persist();

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
                            axios.post(`/api/electricity-purchase/`, textInput).then((res) => {
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

        axios.get(`api/user-discount`).then((res) => {
            if (res.status === 200) {
                setDiscount(res.data.percentage);
            }
        });
    }, [props.match.params.id, history]);

    return (
        
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Electricity</b> Payment |
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />
                <form onSubmit={handlePurchaseElectricity} className="">
                <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.id && 'active'}`}
                                    onClick={() => {
                                        handleProductSelection(item.id, item.id);
                                    }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>

                    <div className="form-group mb-3">
                        <label>Electricity Services:</label>
                        <select name="product_id" onChange={handleProductSelection2} value={textInput.product_id} className="form-select">
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
                        <label>Electricity Plan:</label>
                        <select name="service_id" onChange={handleInput} value={textInput.service_id} className="form-select" required>
                            <option value="">--Choose Electricity Plan--</option>
                            {serviceList.map((item, index) => (
                                <option 
                                    key={index} 
                                    value={item.id}
                                >
                                    { item.name.split('=')[0]}
                                </option>
                            ))}
                        </select>
                        <small className="text-danger">{errorList?.services}</small>
                    </div>
                    
                    <div className="form-group mb-3">
                        <label>Meter number</label>
                        <input type="text" name="meter_number" onChange={handleInput} value={textInput.meter_number} className="form-control"></input>
                        <small className="text-danger">{errorList?.meter_number}</small>
                    </div>
                    
                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input type="text" name="amount" value={textInput.amount} onChange={handleAmount} className="form-control"></input>
                        <small className="text-danger">{errorList?.amount}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Amount to be charged</label>
                        <input
                            type="number"
                            name="amount_to_charged"
                            disabled
                            value={textInput.amount - (discount * textInput.amount) / 100 || 0}
                            className="form-control"
                        ></input>
                        <small className="text-info">{discount} % on all of your airtime recharge</small>
                    </div>
                    
                    <div id='proceed-btn' className="form-group mb-3">
                        <button 
                            type="button" 
                            onClick={handleVerification}
                            className="btn w-100 btn-primary"
                            disabled={textInput.product_id === '' || errorList.amount !== '' || textInput.amount === '' || textInput.service_id === '' || textInput.meter_number === ''} 
                        >
                            Verify smartcard
                        </button>
                    </div>
                    
                    <div id='validatation-container' hidden>
                        <div className="form-group mb-3">
                            <label>Beneficiary Name:</label>
                            <input type="text" id='beneficiary-name' name="name" disabled className="form-control"></input>
                            <small className="text-danger">{errorList?.name}</small>
                        </div>
                        <div className="form-group mb-3">
                            <button 
                                type="button" 
                                className="btn w-100 btn-primary"
                                onClick={handlePurchaseElectricity}
                                disabled={textInput.amount === '' || errorList.amount !== '' || textInput.product_id === '' || textInput.service_id === '' || textInput.meter_number === ''} 
                            >
                                Proceed
                            </button>
                        </div>
                    </div> 
                </form>
            </div>
        </div>
    );
}

export default Electricity;
