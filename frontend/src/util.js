import axios from 'axios';
import Swal from 'sweetalert2';
import React from 'react';
import Toastify from 'toastify-js';

const get_local_storage_item = (item) => {

    let data = JSON.parse(localStorage.getItem(item));

    return data;
}

const store_local_storage_item = (key, value) => {

    let data = localStorage.setItem(key, JSON.stringify(value));
    if (!data) {
        return false
    }

    return true;
}

const toastifyFunction = (msg) => {
    Toastify({
        text: msg,
        duration: 3000,
        className: "info",
        close: true,
        gravity: "top", // `top` or `bottom`
        position: "center", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        offset: {
            y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
        },
    }).showToast();
}

const logOutFunction = () => {
    axios.get('/sanctum/csrf-cookie').then(() => {
        axios.post(`api/logout`).then((res) => {
            if (res?.data.status === 200) {
                localStorage.removeItem('auth_token');
                store_local_storage_item('auth_role', 'public');             
                Swal.fire({icon: 'success', title: 'Success', text: res?.data.message, timer: 2000}).then(() => {
                    window.location.replace('/login')
                })
            }
            
        });
    });
}

const getPermission = (permissions, permission) => {
    let permitted = permissions?.includes(permission);
   
    return permitted;
}

const purchaser = async (url, data) => {
    try {
        const { value: pin } = await Swal.fire({
            title: 'Enter your transaction pin',
            text: 'Enter your transaction pin',
            input: 'password',
            closeOnClickOutside: false,
            showCancelButton: true,
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Verify!',
            cancelButtonColor: '#d33',
            inputAttributes: {
                maxLength: 4
            },
            inputValidator: (value) => {
                if (!value) {
                    return 'You need to enter a pin!';
                }
                if (!/^\d{4}$/.test(value)) {
                    return 'PIN must be 4 digits!';
                }
            }
        });

        if (pin) {
            const pinVerificationResponse = await axios.get(`/api/verify-pin/${pin}`);
            const result = pinVerificationResponse.data;

            if (result.status === 200) {
                const { isConfirmed } = await Swal.fire({
                    title: 'Are you sure?',
                    text: 'Are you sure to proceed with your transaction!',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, proceed!',
                    cancelButtonText: 'No, cancel',
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    reverseButtons: true
                });

                if (isConfirmed) {
                    const airtimePurchaseResponse = await axios.post(url, data);
                    if (airtimePurchaseResponse.data.status === 200) {
                        Swal.fire('Success!', 'Your transaction has been successfully processed!', 'success');
                        window.history.replace('/user/dashboard');
                    } else {
                        Swal.fire('Error!', airtimePurchaseResponse.data.errors, 'error');
                    }
                }
            } else {
                Swal.fire('Error!', result.message, 'error');
            }
        }
    } catch (error) {
        Swal.fire('Error!', 'Something went wrong!', 'error');
    }
};


const RouteNotFound = () => {
    return (
        
        <div className="d-flex align-items-center justify-content-center" style={{ textAlign: 'center', height: '90vh' }}>
          <div>
            <i className='fa fa-erroot fa-4x  text-danger'></i>
            <h2 className='fw-bold'>404 - Page not found</h2>
            <p className='text-muted'>The requested page does not exist.</p>
          </div>
        </div>
        
    );
  };

const split_errors = (errors) => {
    let errorMessage = '';

    // Construct error message for each field
    for (const field in errors) {
        if (errors.hasOwnProperty(field)) {
            errorMessage += `<strong>${field}:</strong><br>`;
            errorMessage += `${errors[field].join('<br>')}<br>`;
        }
    }

    return errorMessage;
}

export {get_local_storage_item, toastifyFunction, RouteNotFound, purchaser, logOutFunction, getPermission, store_local_storage_item, split_errors}