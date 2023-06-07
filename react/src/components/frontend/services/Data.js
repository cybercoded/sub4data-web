import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import ReactOverlayLoader from "reactjs-overlay-loader";
import { Loader } from '../../Global';

function Data(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [productActive, setProductActive] = useState();
    const [productList, setProductList] = useState([]);
    const [serviceList, setServiceList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextIput] = useState({
        productId: '',
        serviceId: '',
        tel: '',
        amount: ''
    });

    const handleInput = (e) => {
        e.persist();
        setTextIput({ ...textInput, [e.target.name]: e.target.value });
    };
   
    const handleProductSelection = (product, product_id) => {        
        setProductActive(product);
        setTextIput({ ...textInput, productId: product_id });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });
    };

    const handleProductSelection2 = (e) => {
        
        var slug = e.target.selectedOptions[0].dataset.slug;        
        var product_id = e.target.value;      
                
        setProductActive(slug);
        setTextIput({ ...textInput, productId: product_id });

        setLoading(true);
        axios.get(`api/view-services/${product_id}`).then((res) => {
            if (res.status === 200) {
                setServiceList(res.data.services);
            }
            setLoading(false);
        });
    };

    const handleServiceSelection = (e) => {
        var value = e.target.selectedOptions[0].dataset.amount;
        var api_servie_id = e.target.selectedOptions[0].dataset.api_id;
        setTextIput({ ...textInput, [e.target.name]: e.target.value, amount: value, serviceId: api_servie_id });
    };

    const dataSubmit = (e) => {
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
                <form onSubmit={dataSubmit} className="">
                    <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.slug && 'active'}`}
                                    onClick={() => { handleProductSelection(item.slug, item.id); }}
                                    style={{ margin: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>
                    
                    
                    <div className="form-group mb-3">
                        <label>Data Services:</label>
                        <select name="product" onChange={handleProductSelection2} value={textInput.productId} className="form-select">
                            <option value="">--Choose Data Service--</option>
                            {productList?.map((item, index) => (
                                <option 
                                    key={index} 
                                    value={item.id}
                                    data-slug={item.slug} 
                                >
                                    {item.name}
                                </option>                                
                            ))}
                        </select>
                        <small className="text-danger">{errorList?.services}</small>
                    </div>
                    
                    <div className="form-group mb-3">
                        <label>Data Plan:</label>
                        <select name="service" onChange={handleServiceSelection} className="form-select">
                            <option value="">--Choose Data Plan--</option>
                            {serviceList?.map((item, index) => (
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
                        <label>Phone number</label>
                        <input type="tel" name="tel" onChange={handleInput} value={textInput.tel} className="form-control"></input>
                        <small className="text-danger">{errorList?.tel}</small>
                    </div>

                    <div className="form-group mb-3">
                        <label>Amount</label>
                        <input type="text" disabled value={textInput.amount} className="form-control"></input>
                        <small className="text-danger">{errorList?.amount}</small>
                    </div>

                    <div className="form-group mb-3">
                        <button type="submit" disabled={errorList.amount !== ''} className="btn w-100 btn-primary">
                            Proceed
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Data;
