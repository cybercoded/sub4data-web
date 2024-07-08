import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import Swal from 'sweetalert2';
import { BreadCombs, CouponDiscount, purchaser, url } from '../../../util';
import { Context } from '../../../contexts/globalContext';

function Data(props) {
    const {globalValues} = React.useContext(Context);
    const history = useHistory();
    
    const [productActive, setProductActive] = useState('');
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);
    const [discount, setDiscount] = useState(0);    
    const [errorList, setErrorList] = useState({});

    const [textInput, setTextInput] = useState({
        product_id: '',
        service_id: '',
        phone: '',
        percentage: 0,
        price: 0,
        coupon: '',
        amount: 0,
        total: 0
    });

    const handleInput = (e) => {
        e.persist();
        setTextInput({ ...textInput, [e.target.name]: e.target.value });
    };

    const handleProductSelection = (product_id) => {
        setProductActive(product_id);
        setTextInput({ ...textInput, product_id: product_id.toString(), service_id: '' });
        
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res?.status === 200) {
                setServiceList(res?.data.services);
            }
            
        });

    };

    const handleProductSelection2 = (e) => {
        var product_id = e.target.value;

        setTextInput({ ...textInput, product_id: product_id, service_id: '' });

        
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res?.status === 200) {
                setServiceList(res?.data.services);
            }
            
        });
        setProductActive(Number(product_id));

    };

    const handleServiceSelection = (e) => {
        var amount = e.target.selectedOptions[0].dataset.amount;
        var price = e.target.selectedOptions[0].dataset.price;
        var value = e.target.value;
        setTextInput({ ...textInput, amount: amount, price: price, service_id: value });

    };

    const handlePurchaseData = (e) => {
        e.preventDefault();

        purchaser('/api/data-purchase/', textInput);
       
    };

    useEffect(() => {
        const slug = props.match.params.slug;
        axios.get(`api/view-product/${slug}`).then((res) => {
            if (res?.status === 200) {
                setProductList(res?.data.product);
            }
            
        });
    }, [props.match.params.id, history]);

    return (
        <div className="container mt-5">
            <BreadCombs crumbs={['user/dashboard', 'user/services/data/data']} />
            <div className="d-flex justify-content-center">                
                <form onSubmit={handlePurchaseData} className="col-md-6 col-sm-8 col-lg-5 col-xl-4">
                    <div className='text-center mb-5'>
                        <img
                            src={`${url()}${globalValues.category?.find(category => category.slug === 'data')?.image}`}
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
                                        handleProductSelection(item.id);
                                    }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`${url()}${item.image}`} className='img-fluid' width="40" height="45" alt={item.name} />
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
                                <option key={index} data-amount={item.amount} data-price={item.price} value={item.id}>
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
