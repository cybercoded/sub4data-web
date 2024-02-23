import React from 'react';
import './App.css';
import { HashRouter, Switch, useHistory } from 'react-router-dom';
import axios from 'axios';
import swal from 'sweetalert';
import Toastify from 'toastify-js';
import { Context, reducer } from './contexts/globalContext';
import ReactjsOverlayLoader from "reactjs-overlay-loader";
import AppRoutes from './routes';


function App() {

    const history=useHistory();

    // axios.defaults.baseURL = process.env.REACT_APP_URL;
    axios.defaults.baseURL = 'http://localhost:8000';
    axios.defaults.headers.post['Content-Type'] = 'application/json';
    axios.defaults.headers.post['Accept'] = 'application/json';
    axios.defaults.withCredentials = true;
    axios.interceptors.request.use(function (config) {
        const token = localStorage.getItem('auth_token');
        config.headers.Authorization = token ? `Bearer ${token}` : '';
        return config;
    });
    const [stateLoading, setStateLoading] = React.useState(false);
    const [values, dispatch] = React.useReducer(reducer, {isLoading: false});

    axios.interceptors.request.use(
        function (request) {
            if(! JSON.parse(localStorage.getItem('isBackgroundLoader')) ) {
                setStateLoading(true);
            }
            return request;
        },
    
        error =>  Promise.reject(error)
    );

    axios.interceptors.response.use(
        function (response) {
            setStateLoading(false);
            return response;
        },
        function (error) {
            if (error.response.status === 403) {
                swal('Forbidden', error.response.data.message, 'warning').then(() => {
                    window.history.back();
                });
            } else if (error.response.status === 419) {
                swal('Timeout', "Your session is timed out, login again", 'warning').then(() => {
                    window.location.replace("/login");
                });
            }else if (error.response.status === 401) {
                swal('Unauthenticated', "Please login your account", 'warning').then(() => {
                    window.location.replace("/login");
                });
            } else {
                Toastify({
                    text: error.message,
                    duration: 4000,
                    className: "warning",
                    close: true,
                    oldestFirst: false,
                    gravity: "top", // `top` or `bottom`
                    position: "center", // `left`, `center` or `right`
                    stopOnFocus: true, // Prevents dismissing of toast on hover
                    offset: {
                        y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
                    },
                }).showToast();
            }
            setStateLoading(false);
            return Promise.reject(error);
        }
    );
    
    return (
        <div className="App">
            <Context.Provider value={{ globalValues: values, setGlobalValues: dispatch }}>
                <HashRouter>
                    <Switch>
                        <AppRoutes name="Index" />
                    </Switch>
                </HashRouter>
                <ReactjsOverlayLoader isActive={stateLoading} 
                    icon={<img alt='loader' width={50} src={`img/loading.gif`}/>} 
                />
            </Context.Provider>
        </div>
    );
}

export default App;
