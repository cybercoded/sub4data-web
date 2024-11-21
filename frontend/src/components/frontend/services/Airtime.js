import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import Swal from 'sweetalert2';
import { BreadCombs, CouponDiscount, purchaser, url } from '../../../util';
import { Context } from '../../../contexts/globalContext';

function Airtime(props) {
    const { globalValues } = React.useContext(Context);
    const history = useHistory();
    const [productActive, setProductActive] = useState(null);
    const [discount, setDiscount] = useState(0);    
    const [errorList, setErrorList] = useState({});
    const [productList, setProductList] = useState([]);
    const [textInput, setTextInput] = useState({
        product_id: '',
        phone: '',
        percentage: 0,
        coupon: '',
        amount: 0,
        total: 0
    });

    useEffect(() => {
        const slug = props.match.params.slug;
        
        axios.get(`/api/view-product/${slug}`).then((res) => {
            if (res.status === 200) {
                setProductList(res.data.product);
            }
        });

        axios.get(`/api/user/`).then((res) => {
            if (res.status === 200 && res.data.pin === null) {
                Swal.fire('Error', 'You must create a Transaction PIN to Use this App', 'warning').then(() => {
                    history.push('/user/create-pin');
                });
            }
        });
    }, [props.match.params.slug, history]);

    const handleInput = (e) => {
        const { name, value } = e.target;
        setTextInput((prev) => ({ ...prev, [name]: value }));
    };

    const handleAmount = (e) => {
        const { name, value } = e.target;
        let response = '';

        if (value < 50 && textInput.percentage === 0) {
            response = 'Amount should not be lesser than 50';
        } else if (value > 5000) {
            response = 'Amount should not be greater than 5,000';
        }

        setErrorList((prev) => ({ ...prev, amount: response }));
        setTextInput((prev) => ({ ...prev, [name]: value }));
    };

    const handlePurchaseAirtime = (e) => {
        e.preventDefault();
        purchaser('/api/airtime-purchase/', textInput);
    };    

    return (
        <div className="container mt-3">
            <BreadCombs crumbs={['user/dashboard', 'user/services/airtime/airtime']} />
            <div className="d-flex justify-content-center">
                <form onSubmit={handlePurchaseAirtime} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">
                    <div className='text-center mb-5'>
                        <img
                            src={`${url()}${globalValues.category?.find(category => category.slug === 'airtime')?.image}`}
                            alt=""
                            style={{ width: 60 }}
                        />
                    </div>
                    <div className="bg-light p-2 mb-3 d-flex flex-wrap justify-content-center">
                        {productList.map((item, index) => (
                            <button
                                type="button"
                                key={index}
                                className={`btn btn-outline-primary btn-sm ${productActive === item.id && 'active'}`}
                                onClick={() => {
                                    setProductActive(item.id);
                                    setTextInput((prev) => ({ ...prev, product_id: item.id }));
                                    setDiscount(item.discount);
                                }}
                                style={{ margin: 2 }}
                            >
                                <img src={`${url()}${item.image}`} className='img-fluid' width="40" height="45" alt={item.name} />
                            </button>
                        ))}
                    </div>
                    <div className="form-group mb-3">
                        <label>Phone number</label>
                        <input
                            type="phone"
                            name="phone"
                            maxLength={11}
                            minLength={11}
                            onChange={handleInput}
                            value={textInput.phone}
                            className="form-control"
                        />
                        <small className="text-danger">{errorList.phone}</small>
                    </div>
                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input
                            type="text"
                            name="amount"
                            onChange={handleAmount}
                            value={textInput.amount}
                            className="form-control"
                        />
                        <small className="text-danger">{errorList.amount}</small>
                    </div>

                    <CouponDiscount 
                        textInput={textInput} 
                        errorList={errorList} 
                        discount={discount}
                        handleInput={handleInput}
                        setTextInput={setTextInput} 
                        setErrorList={setErrorList}  
                    />
                    
                    <div className="form-group mb-3">
                        <button
                            type="submit"
                            disabled={!!errorList.amount || !textInput.phone || !textInput.product_id}
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
