import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import ReactOverlayLoader from "reactjs-overlay-loader";
import $ from 'jquery';

function Bill(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [productActive, setProductActive] = useState();
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextIput] = useState({
        product: '',
        serviceId: '',
        smartcard_number: '7023687567',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };
   
    const handleProductSelection = (product, product_id) => {        
        setProductActive(product);
        setTextIput({ ...textInput, product: product });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });

        $('#validatation-container').attr('hidden', 'hidden');
        $('#proceed-btn').removeAttr('hidden', 'hidden');
    };

    const handleVerification = (e) => {        
        e.persist();

        if(textInput.smartcard_number !== '' && textInput.product !== '' && textInput.serviceId !== '') {

            setLoading(true);
            axios.post(`api/smartcard-verification`, {smartcard_number: textInput.smartcard_number, product_code: textInput.serviceId}).then((res) => {
                if (res.data.status === 200) {
                    $('#beneficiary-name').val(res.data.name);
                    $('#validatation-container').removeAttr('hidden')
                    $('#proceed-btn').attr('hidden', 'hidden');

                }else {
                    swal('Unable to verify!', 'Please check your smartcard number and try again', 'error');
                }
                setLoading(false);
            });
        }else {
            swal('All fields are required!', 'Fill and select all fields', 'error');
        }
    };

    const handleServiceSelection = (e) => {
        var value = e.target.selectedOptions[0].dataset.amount;
        var api_servie_id = e.target.selectedOptions[0].dataset.api_id;
        setTextIput({ ...textInput, [e.target.name]: e.target.value, amount: value, serviceId: api_servie_id });
    };

    const dataSubmit = (e) => {
        e.persist();

        if(textInput.smartcard_number !== '' && textInput.product !== '' && textInput.serviceId !== '') {
            swal({
                text: 'Enter your transaction pin',
                content: 'input',
                button: {
                    text: 'Verify!',
                    closeModal: false
                }
            })
            .then((pin) => {

                return axios.get(`/api/verify-pin/${pin}`)
            })
            .then((results) => {
                let result = results.data;

                if(result.status === 200) {
                    swal({
                        title: "Are you sure?",
                        text: "Are you sure to proceed with your transaction!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true,
                    })
                    .then((willDelete) => {
                        if (willDelete) {
                          swal("Poof! Your imaginary file has been deleted!", {
                            icon: "success",
                          });
                        }
                    });
                }else {
                    swal('Oh noes!', result.message, 'error');
                }
            })
            .catch((err) => {
                if (err) {
                    swal('Oh noes!', 'The AJAX request failed!', 'error');
                } else {
                    swal.stopLoading();
                    swal.close();
                }
            });
        }
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
                <b>Bill</b> Payment /
            </div>
            <div className="bg-light card card-body col-md-6">
                <ReactOverlayLoader isActive={loading} 
                    icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
                />
                <form onSubmit={dataSubmit} className="">
                    <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.slug && 'active'}`}
                                    onClick={() => { handleProductSelection(item.slug, item.id); }}
                                    style={{ marginRight: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>
                    
                    
                    <div className="form-group mb-3">
                        <label>Bill Plan:</label>
                        <select name="services" onChange={handleServiceSelection} className="form-select" required>
                            <option value="">--Choose Bill Plan--</option>
                            {serviceList.map((item, index) => (
                                <option 
                                    key={index} 
                                    data-amount={item.amount} 
                                    data-api_id={item.api_servie_id} 
                                    value={item.id}
                                >
                                    {item.name}
                                </option>
                            ))}
                        </select>
                        <small className="text-danger">{errorList?.services}</small>
                    </div>
                    
                    <div className="form-group mb-3">
                        <label>Smartcard number</label>
                        <input type="text" name="smartcard_number" onChange={handleInput} value={textInput.smartcard_number} className="form-control"></input>
                        <small className="text-danger">{errorList?.smartcard_number}</small>
                    </div>
                    
                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input type="text" disabled value={textInput.amount} className="form-control"></input>
                        <small className="text-danger">{errorList?.amount}</small>
                    </div>
                    
                    <div id='proceed-btn' className="form-group mb-3">
                        <button type="button" onClick={handleVerification} className="btn w-100 btn-primary">
                            Verify smartcard
                        </button>
                    </div>
                    
                    <div id='validatation-container' hidden>
                        <div className="form-group mb-3">
                            <label>Beneficiary Name:</label>
                            <input type="text" id='beneficiary-name' name="name" disabled className="form-control"></input>
                            <small className="text-danger">{errorList?.name}</small>
                        </div>
                        <div className="form-group mb-3" >
                            <button type="button" className="btn w-100 btn-primary">
                                Proceed
                            </button>
                        </div>
                    </div> 
                </form>
            </div>
        </div>
    );
}

export default Bill;
