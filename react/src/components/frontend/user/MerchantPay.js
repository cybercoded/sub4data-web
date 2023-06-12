import axios from 'axios';
import React, { useEffect, useState } from 'react';
import swal from 'sweetalert';
import { Loader } from '../../Global';
import $ from 'jquery';

function MerchantPay() {
    const [loading, setLoading] = useState();
    const [textInput, setTextInput] = useState({
        amount: ''
    });

    const handleAmount = (e) => {
        e.persist();
        let amount = e.target.value.trim();
        let charges = (amount * textInput.charges) / 100;
        let total = (amount * textInput.charges) / 100 + Number(amount);
        $('#charge').text('₦' + new Intl.NumberFormat().format(charges));

        $('#total').text('₦' + new Intl.NumberFormat().format(total));
        setTextInput({ ...textInput, [e.target.name]: amount });
    };

    const handlePayment = (e) => {
        e.preventDefault();

        if (textInput.amount < 100) {
            swal('Error', 'Amount must be greater than 100', 'error');
            return;
        }
        if (textInput.amount > 5000) {
            swal('Error', 'Amount must not be greater than 5,000', 'error');
            return;
        }

        setLoading(true);
        axios.post(`api/merchant-pay`, textInput).then((res) => {
            if (res.data.status === 200) {
                window.open(res.data.url, '_blank', 'noreferrer');
            } else {
                swal('Error', res.data.errors, 'error');
            }
            setLoading(false);
        });
    };

    useEffect(() => {
        setLoading(true);
        axios.get(`/api/get-monnify-charges`).then((res) => {
            if (res.data.status === 200) {
                setTextInput({ ...textInput, charges: res.data.charge });
            } else {
                swal('Error', res.data.errors, 'error');
            }
            setLoading(false);
        });
    }, [textInput.charges]);

    return (
        <div className="container mt-5">
            <div className="text-muted h5 mb-4 pb-4 border-bottom">
                <b>Fund</b> Wallet |
            </div>
            
            <div className="card col-md-4 bg-light">
                <Loader isActive={loading} />
                <form onSubmit={handlePayment} className="card-body">
                    <div className="form-group">
                        <label for="amount">Amount</label>
                        <input
                            type="number"
                            className="form-control"
                            onChange={handleAmount}
                            name="amount"
                            id="amount"
                            aria-describedby="helpAmount"
                            placeholder="amount"
                        />
                    </div>
                    <div className="form-group">
                        <label htmlFor="">Accepted Cards</label>
                        <div className="icon-container d-flex">
                            <i className="fa-brands fa-cc-visa fa-2x me-2" style={{ color: 'navy' }}></i>
                            <i className="fa-brands fa-cc-mastercard fa-2x me-2" style={{ color: 'red' }}></i>
                            {/* <i className="fa-brands fa-cc-discover fa-2x me-2" style={{color: 'orange'}}></i> */}
                        </div>
                    </div>

                    <div>
                        <p>
                            Transaction charge
                            <span className="price float-end" id="charge"></span>
                        </p>
                        <hr />
                        <p>
                            Total
                            <span className="price float-end fw-bold" id="total"></span>
                        </p>
                    </div>

                    <div className="form-group mt-5">
                        <button type="submit" disabled={textInput.amount === ''} className="btn btn-primary w-100">
                            Proceed
                        </button>
                    </div>
                    <div className="text-center">
                        <img src="https://app.monnify.com/images/logo.svg" height="80px" alt="" width="100px" />
                    </div>
                </form>
            </div>
        </div>
    );
}

export default MerchantPay;
