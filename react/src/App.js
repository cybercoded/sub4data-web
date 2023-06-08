import React from 'react';
import './App.css';
import { BrowserRouter, Switch, useHistory } from 'react-router-dom';
import axios from 'axios';
import AdminPrivateRoute from './AdminPrivateRoute';
import PublicRoute from './PublicRoute';
import UserRoute from './UserRoute';
import swal from 'sweetalert';
import Toastify from 'toastify-js';


axios.defaults.baseURL = 'http://localhost:8000';
axios.defaults.headers.post['Content-Type'] = 'application/json';
axios.defaults.headers.post['Accept'] = 'application/json';
axios.defaults.withCredentials = true;
axios.interceptors.request.use(function (config) {
    const token = localStorage.getItem('auth_token');
    config.headers.Authorization = token ? `Bearer ${token}` : '';
    return config;
});

function App() {

    const history = useHistory();
    
    axios.interceptors.response.use(
        function (response) {
            return response;
        },
        function (error) {
            if (error.response.status === 403) {
                swal('Forbidden', error.response.data.message, 'warning');
                history.push('/403');
            } else {
                Toastify({
                    text: error.message,
                    duration: 4000,
                    className: "warning",
                    close: true,
                    gravity: "top", // `top` or `bottom`
                    position: "center", // `left`, `center` or `right`
                    stopOnFocus: true, // Prevents dismissing of toast on hover
                    offset: {
                        y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
                    },
                }).showToast();
            }
            return Promise.reject(error);
        }
    );
    
    return (
        <div className="App">
            <BrowserRouter>
                <Switch>
                    <PublicRoute path="/" name="Index" />
                </Switch>
                <Switch>
                    <UserRoute path="/user" name="User" />
                </Switch>
                <Switch>
                    <AdminPrivateRoute path="/admin" name="Admin" />
                </Switch>
            </BrowserRouter>
        </div>
    );
}

export default App;
