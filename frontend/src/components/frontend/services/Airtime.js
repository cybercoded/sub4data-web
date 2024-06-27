import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import Swal from 'sweetalert2';
import { BreadCombs, purchaser, url } from '../../../util';
import { Context } from '../../../contexts/globalContext';


function Airtime(props) {
    const {globalValues} = React.useContext(Context);
    const history = useHistory();    
    const [productActive, setProductActive] = useState();
    const [discount, setDiscount   ] = useState();
    const [productList, setProductList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextInput] = useState({
        product_id: '',
        phone: '',
        percentage: 0,
        coupon: 'SUB64937',
        amount: 100,
        total: 0
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, total: total_calculation(), [e.target.name]: e.target.value });
    };

    const handleAmount = (e) => {
        var value = e.target.value;
        setTextInput({ ...textInput, [e.target.name]: value });

        var response = '';
        if (value < 50 && textInput.percentage == 0) {
            response = 'Amount should not be lesser than 50';
        }
        if (value > 5000) {
            response = 'Amount should not be greater than 5,000';
        }

        setErrorList({ ...errorList, amount: response });
    };

    const handlePurchaseAirtime = async (e) => {
        e.preventDefault();
        
        purchaser('/api/airtime-purchase/', textInput);
        
    };

    const handleCouponVerify = (e) => {
        e.persist();

        axios.get(`api/verify-discount/${textInput.coupon}`).then((res) => {
            if (res.status === 200) {
                setTextInput({...textInput, total: total_calculation(), percentage: res.data.percentage});
                setErrorList({coupon: res.data.message || null})

                console.log(`discount_percentage => ${textInput.percentage} amount => ${textInput.amount}`);
            }            
        });
    }  
    

    useEffect(() => {
        const slug = props.match.params.slug;

        console.log(slug+'-'+props.match.params)
        axios.get(`api/view-product/${slug}`).then((res) => {
            if (res.status === 200) {
                setProductList(res.data.product);
            }
            
        });

        axios.get(`api/user/`).then((res) => {
            if (res.status === 200) {
                if(res.data.pin === null) {
                    Swal.fire('Error', 'You must create a Transaction PIN to Use this App', 'warning').then((res) => {
                        history.push('/user/create-pin')
                    })
                }
            }
        });
    }, [props.match.params.slug, history]);

    const total_calculation = () => {

        let originalAmount = textInput.amount;
        let originalDiscount = originalAmount - ( (discount * textInput.amount) / 100).toFixed(2);
        let couponDiscount = originalDiscount * parseFloat(textInput.percentage) / 100;
        let total = originalDiscount - couponDiscount;
        console.log(total)
        return  total;
    }

    return (
        <div className="container mt-3">
            <BreadCombs crumbs={['user/dashboard', 'user/services/data/data']} />
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
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary btn-sm ${productActive === item.id && 'active'}`}
                                    onClick={() => {
                                        setProductActive(item.id);
                                        setTextInput({...textInput, product_id: item.id });
                                        setDiscount(item.discount);
                                    }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`${url()}${item.image}`} className='img-fluid' width="40" height="45" alt={item.name} />
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
                        <label>Discount coupon</label>
                        <div className='row'>
                            <div className='col-9'>
                                <input type="text" name="coupon" value={textInput.coupon} onChange={handleInput} className="form-control"></input>
                            </div>
                            <div className='col-3'>
                                <button type='button' onClick={handleCouponVerify} className='btn btn-primary w-100'>Apply</button>
                            </div>
                        </div>
                        <small className="text-info fw-bold">{errorList?.coupon}</small>
                    </div>


                    <div className="form-group mb-3">
                        <label>Amount to be charged</label>
                        <input
                            type="number"
                            name="amount_to_charged"
                            disabled
                            value={textInput.total}
                            className="form-control"
                        ></input>
                        <small className="text-info fw-bold">{discount && `₦${discount} % discount on all of your airtime recharge`}</small>
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
