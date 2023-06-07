import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';
import { Loader } from '../../Global';

function Airtime(props) {
    const history = useHistory();
    const [loading, setLoading] = useState(true);
    const [productActive, setProductActive] = useState();
    const [productList, setProductList] = useState([]);
    const [errorList, setErrorList] = useState([]);
    const [textInput, setTextIput] = useState({
        product: '',
        tel: '',
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

    const loginSubmit = (e) => {
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

        setLoading(true);
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
                <b>Airtime</b> Purchase |
            </div>
            <div className="bg-light card card-body col-md-6">
                <Loader isActive={loading} />
                <form onSubmit={loginSubmit} className="">
                    <div className="form-group mb-3">
                        {productList.map((item, index) => {
                            return (
                                <button
                                    type="button"
                                    key={index}
                                    className={`btn btn-outline-primary ${productActive === item.slug && 'active'}`}
                                    onClick={() => {
                                        setProductActive(item.slug);
                                    }}
                                    style={{ marginRight: 2 }}
                                >
                                    <img src={`http://localhost:8000/${item.image}`} width="50" height="50" alt={item.name} />
                                </button>
                            );
                        })}
                    </div>
                    <div className="form-group mb-3">
                        <label>Phone number</label>
                        <input type="tel" name="tel" onChange={handleInput} value={textInput.tel} className="form-control"></input>
                        <small className="text-danger">{errorList?.tel}</small>
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
                            value={textInput.amount - (2 * textInput.amount) / 100}
                            className="form-control"
                        ></input>
                        <small className="text-info">2% on all of your airtime recharge</small>
                    </div>

                    <div className="form-group mb-3">
                        <button type="submit" disabled={errorList.amount !== ''} className="btn btn-primary w-100">
                            Proceed
                        </button>
                    </div>
                </form>
            </div>
        </div>
    );
}

export default Airtime;
