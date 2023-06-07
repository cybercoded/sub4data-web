import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../Global';

function Airtime(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [productActive, setProductActive] = useState();
    const [discount, setDiscount   ] = useState();
    const [productList, setProductList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextIput] = useState({
        product_id: '',
        phone: '',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });

    };

    const handleAmount = (e) => {
        var value = e.target.value;
        setTextIput({ ...textInput, [e.target.name]: value });

        var response = '';
        if (value < 50) {
            response = 'Amount should not be lesser than 50';
        }
        if (value > 5000) {
            response = 'Amount should not be greater than 5,000';
        }

        setErrorList({ ...errorList, amount: response });
    };

    const handlePurchaseAirtime = (e) => {
        e.preventDefault();

        swal({
            text: 'Enter your transaction pin',
            content: 'input',
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
                        dangerMode: true
                    }).then((willDelete) => {
                        if (willDelete) {
                            setLoading(true);
                            axios.post(`/api/airtime-purchase/`, textInput).then((res) => {
                                if (res.data.status === 200) {
                                    swal('Success!', 'Your transaction has been successfully processed!', 'success').then((res) => {                                        
                                        history.push('/user/dashboard');
                                    });
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

        setLoading(true);
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

        axios.get(`api/user/`).then((res) => {
            if (res.status === 200) {
                if(res.data.pin === null) {
                    swal('Error', 'You must create a Transaction PIN to Use this App', 'warning').then((res) => {
                        history.push('/user/create-pin')
                    })
                }
            }
        });
    }, [props.match.params.id, history]);

    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Airtime</b> Purchase |
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />
                <form onSubmit={handlePurchaseAirtime} className="">
                    <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.api_product_id && 'active'}`}
                                    onClick={() => {
                                        setProductActive(item.api_product_id);
                                        setTextIput({...textInput, product_id: item.api_product_id });
                                    }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>
                    <div className="form-group mb-3">
                        <label>Phone number</label>
                        <input type="phone" name="phone" maxLength={11} minLength={11} onChange={handleInput} value={textInput.phone} className="form-control"></input>
                        <small className="text-danger">{errorList?.phone}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input type="text" name="amount" onChange={handleAmount} value={textInput.amount} className="form-control"></input>
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

                    <div className="form-group mb-3">
                        <button
                            type="submit"
                            disabled={errorList.amount !== '' || textInput.phone === '' || textInput.product_id === ''}
                            className="btn btn-primary w-100"
                        >
                            Proceed
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Airtime;
