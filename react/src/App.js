import React from 'react';
import './App.css';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import axios from 'axios';
import AdminPrivateRoute from './AdminPrivateRoute';
import PublicRoute from './PublicRoute';
import UserRoute from './UserRoute';

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
    return (
        <div className="App">
            <BrowserRouter>
                <Switch>
                    <AdminPrivateRoute path="/admin" name="Admin" />
                    <PublicRoute path="/" name="Index" />
                    <UserRoute path="/user" name="Home" />
                </Switch>
            </BrowserRouter>
        </div>
    );
}

export default App;
