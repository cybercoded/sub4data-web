import React from 'react';
import './App.css';
import { BrowserRouter, Switch } from 'react-router-dom';
import axios from 'axios';
import Swal from 'sweetalert2';
import { Context, reducer } from './contexts/globalContext';
import ReactjsOverlayLoader from "reactjs-overlay-loader";
import AppRoutes from './routes';
import { get_local_storage_item, store_local_storage_item, toastifyFunction } from './util';


function App() {
    
    axios.defaults.baseURL = process.env.REACT_APP_URL;
    axios.defaults.headers.post['Content-Type'] = 'application/json';
    axios.defaults.headers.post['Accept'] = 'application/json';
    axios.defaults.withCredentials = true;
    axios.interceptors.request.use(function (config) {
        const token = get_local_storage_item('auth_token');
        config.headers.Authorization = token ? `Bearer ${token}` : '';
        return config;
    });

    const [stateLoading, setStateLoading] = React.useState(false);
    const [values, dispatch] = React.useReducer(reducer, {isLoading: false});

    React.useEffect(() => {
        if(!get_local_storage_item('auth_role')) {
            store_local_storage_item('auth_role', 'public');
        }
    }, [])
    
    axios.interceptors.request.use(
        function (request) {
            return request;
        },
        
        function (error) {
            console.error(error);
            return Promise.reject(error);
        }
    );

    axios.interceptors.response.use(
        function (response) {
            setStateLoading(false);
            return response;
        },
        function (error) {
            if (error.response?.status === 403) {
                Swal.fire('Forbidden', error.response.data.message, 'warning').then(() => {
                    window.history.back();
                });
            } else if (error.response?.status === 419) {
                Swal.fire('Timeout', "Your session is timed out, login again", 'warning').then(() => {
                    window.location.replace("/login");
                });
            }else if (error.response?.status === 401) {
                Swal.fire('Unauthenticated', "Please login your account", 'warning').then(() => {
                    window.location.replace("/login");
                });
            } else {
                toastifyFunction(error.message);
            }
            setStateLoading(false);
            return Promise.reject(error);
        }
    );
    
    return (
        <div className="App">
            <Context.Provider value={{ globalValues: values, setGlobalValues: dispatch }}>
                <BrowserRouter>
                    <Switch>
                        <AppRoutes name="Index" />
                    </Switch>
                </BrowserRouter>
                <ReactjsOverlayLoader isActive={stateLoading} 
                    icon={<img alt='loader' width={50} src={`${process.env.REACT_APP_URL}img/loading.gif`}/>} 
                />
            </Context.Provider>
        </div>
    );
}

export default App;
