import axios from 'axios';
import React from 'react';
import { useHistory } from 'react-router-dom';
import swal from 'sweetalert';


const Logout = () => {

    
    const history = useHistory();

    React.useEffect(() => {            
        axios.get('/sanctum/csrf-cookie').then(() => {
            axios.post(`api/logout`).then((res) => {
                if (res.data.status === 200) {
                    localStorage.removeItem('auth_token');
                    localStorage.removeItem('auth_name');
                    swal('Success', res.data.message, 'success').then(() => {
                        history.push('/login');
                    });
                    
                }
                
            });
        });
    }, [history]);

    return <></>
};

export default Logout;
