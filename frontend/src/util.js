import axios from 'axios';
import Swal from 'sweetalert2';
import React, { useEffect } from 'react';
import Toastify from 'toastify-js';
import CookieConsent, { Cookies, getCookieConsentValue } from "react-cookie-consent";
import { Link } from 'react-router-dom';
const crypto = require('crypto');

let algorithm = 'aes-256-cbc';
let key = crypto.randomBytes(32);
let iv = crypto.randomBytes(16);

const get_local_storage_item = (item) => {

    let data = JSON.parse(localStorage.getItem(item));

    return data;
}

const url = () => {
    let url = `http://${window.location.hostname}:8000/`;

    return url;
}

const store_local_storage_item = (key, value) => {

    let data = localStorage.setItem(key, JSON.stringify(value));
    if (!data) {
        return false
    }

    return true;
}

const handleCopy = (value) => {
    navigator.clipboard.writeText(value)
    toastifyFunction("Copied to your clipboard");
}

let currentToast = null;

const toastifyFunction = (msg) => {

    if (currentToast) {
        currentToast.hideToast(); // Hide the current toast if it exists
        currentToast = null; // Reset the current toast reference
    }

    currentToast = Toastify({
        text: msg,
        duration: 3000,
        className: "info",
        close: true,
        gravity: "top", // `top` or `bottom`
        position: "right", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        offset: {
            y: 50 // vertical axis - can be a number or a string indicating unity. eg: '2em'
        },
        onClick: function() { // Callback after click
            currentToast = null; // Reset the current toast reference on click
        },
        callback: function() { // Callback after dismiss
            currentToast = null; // Reset the current toast reference after duration ends
        }
    }).showToast();
}

const passwordValidator = (passwordInputValue) => {
    const uppercaseRegExp   = /(?=.*?[A-Z])/;
    const lowercaseRegExp   = /(?=.*?[a-z])/;
    const digitsRegExp      = /(?=.*?[0-9])/;
    const specialCharRegExp = /(?=.*?[#?!@$%^&+_*-])/;
    const minLengthRegExp   = /.{8,}/;
    const passwordLength =      passwordInputValue.length;
    const uppercasePassword =   uppercaseRegExp.test(passwordInputValue);
    const lowercasePassword =   lowercaseRegExp.test(passwordInputValue);
    const digitsPassword =      digitsRegExp.test(passwordInputValue);
    const specialCharPassword = specialCharRegExp.test(passwordInputValue);
    const minLengthPassword =   minLengthRegExp.test(passwordInputValue);
    let errMsg = "";
    if(passwordLength===0){
        errMsg="Password is empty";
    }else if(!uppercasePassword){
        errMsg="At least one Uppercase";
    }else if(!lowercasePassword){
        errMsg="At least one Lowercase";
    }else if(!digitsPassword){
        errMsg="At least one digit";
    }else if(!specialCharPassword){
        errMsg="At least one Special Characters";
    }else if(!minLengthPassword){
        errMsg="At least minumum of 8 characters";
    }

    return errMsg;
}

const BreadCombs = ({ crumbs }) => {
    // Generate breadcrumb links JSX
    const breadcrumbLinks = crumbs.map((crumb, index) => (
        <React.Fragment key={crumb}>
            <span>
                <Link to={`/${crumb}`}>
                    {crumb.split('/')[crumb.split('/').length-1]}
                </Link>
            </span>
            {index < crumbs.length - 1 && ' / '} {/* Add separator if not the last breadcrumb */}
        </React.Fragment>
    ));

    return (
        <div className="mb-5">
            <div className="text-muted pb-4 border-bottom">
                {breadcrumbLinks}
            </div>
        </div>
    );
}

const CouponDiscount = ({textInput, handleInput, discount, errorList, setTextInput, setErrorList}) => {

    useEffect(() => {
        setTextInput((prev) => ({ ...prev, total: totalCalculation() }));
        console.log(textInput.price)
    }, [textInput.price || textInput.amount, textInput.percentage, discount]);

    const handleCouponVerify = () => {
        axios.get(`/api/verify-discount/${textInput.coupon}`).then((res) => {
            if (res.status === 200) {
                setTextInput((prev) => ({
                    ...prev,
                    percentage: parseFloat(res.data.percentage || 0),
                }));
                setErrorList((prev) => ({
                    ...prev,
                    coupon: res.data.message || null,
                }));
            }
        });
    };

    const totalCalculation = () => {
        const originalAmount = parseFloat(textInput.price || textInput.amount);
        const discountAmount = (discount * originalAmount) / 100;
        const originalDiscount = originalAmount - discountAmount;
        const couponDiscount = (originalDiscount * parseFloat(textInput.percentage)) / 100;
        let total = originalDiscount - couponDiscount;
        return total.toFixed(2);
    };


    return (
        <div>
            <div className="form-group mb-3">
                <label>Discount coupon</label>
                <div className='row'>
                    <div className='col-9'>
                        <input
                            type="text"
                            name="coupon"
                            value={textInput.coupon}
                            onChange={handleInput}
                            className="form-control"
                        />
                    </div>
                    <div className='col-3'>
                        <button type='button' onClick={handleCouponVerify} className='btn btn-primary w-100'>Apply</button>
                    </div>
                </div>
                <small className={`text-${textInput.percentage > 0 ? 'success' : 'danger'} fw-bold`}>{errorList.coupon}</small>
            </div>

            {textInput.percentage > 0 && (
                <div className="form-group mb-3">
                    <label>Amount to be charged</label>
                    <input
                        type="number"
                        name="amount_to_charged"
                        disabled
                        value={textInput.total}
                        className="form-control"
                    />
                </div>
            )}
        </div>
    );

};


const logOutFunction = (redirect) => {
    Swal.fire({
        title: 'Logout',
        text: `Are you sure you want to logout your account?`,
        icon: "warning",
        showCancelButton: true
    }).then((res) => {
        if (res.isConfirmed) {
            axios.get('/sanctum/csrf-cookie').then(() => {
                axios.post(`api/logout`).then((res) => {
                    if (res?.data.status === 200) {
                        deleteCookie('auth_token');
                        store_local_storage_item('auth_role', 'public');             
                        Swal.fire({icon: 'success', title: 'Success', text: res?.data.message, timer: 2000}).then(() => {
                            window.location.replace(`/${redirect || 'login'}`)
                        })
                    }
                    
                });
            });
        }
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

    if(!Array.isArray(errors)) {
        return errors;
    }

    // Construct error message for each field
    let errorMessage = '';
    for (const field in errors) {
        if (errors.hasOwnProperty(field)) {
            errorMessage += `<strong>${field}:</strong><br>`;
            errorMessage += `${errors[field].join('<br>')}<br>`;
        }
    }

    return errorMessage;
}

const setCookie = (cookieName, cookieValue, expirationDays) => {

    if(expirationDays) {
        let d = new Date();
        d.setTime(d.getTime() + (expirationDays * 24 * 60 * 60 * 1000));
        let expires = "expires=" + d.toUTCString();
        document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
    } else {
        document.cookie = cookieName + "=" + cookieValue + ";path=/";
    }
}

const deleteCookie = (cookieName) => {
    document.cookie = cookieName + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

const getCookie = (cookieName) => {
    let name = cookieName + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let cookieArray = decodedCookie.split(';');
    
    for (let i = 0; i < cookieArray.length; i++) {
      let cookie = cookieArray[i];
      while (cookie.charAt(0) === ' ') {
        cookie = cookie.substring(1);
      }
      if (cookie.indexOf(name) === 0) {
        return cookie.substring(name.length, cookie.length);
      }
    }
    return "";
}
  
 
const encrypt = (text) => {    
    let cipher = crypto.createCipheriv(algorithm, key, iv);
    let encrypted = cipher.update(text, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    return encrypted;
}

const decrypt = (encrypted) => {
    let decipher = crypto.createDecipheriv(algorithm, key, iv);
    let decrypted = decipher.update(encrypted, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
}

const initializeGoogleAnalytics = () => {
    if (getCookieConsentValue('isGoogleCookie') === 'true') {
        const script1 = document.createElement('script');
        script1.async = true;
        script1.src = `https://www.googletagmanager.com/gtag/js?id=G-2NEVN43WXL`;

        const script2 = document.createElement('script');
        script2.innerHTML = `
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());
            gtag('config', 'G-2NEVN43WXL');
        `;

        // Append scripts to the document head
        document.head.appendChild(script1);
        document.head.appendChild(script2);
    }
};

const CustomCookieConsent = () => {
    return <CookieConsent
        location="bottom"
        buttonClasses="btn btn-primary text-white"
        buttonText="OK, Continue!"
        cookieName="isGoogleCookie"
        style={{ background: "#333" }}
        expires={150}
        hideOnAccept={true}
        enableDeclineButton={true}
        customButtonWrapperAttributes={<button>button</button>}
        contentStyle={{ fontSize: "16px" }}
        onDecline={() => {
            toastifyFunction("We will no longer track your experience on this app");
        }}
        onAccept={() => {
            toastifyFunction("This app will use the cookies content to track your experience ");
            initializeGoogleAnalytics();
        }}
    >
        This site uses cookies from Google to deliver its services and to analyze traffic. Your IP address and user agent are shared with Google, together with performance and security metrics, to ensure quality of service, generate usage statistics and to detect and address abuse..{" "}
    </CookieConsent>
}

export {
    CouponDiscount,
    BreadCombs,
    passwordValidator,
    initializeGoogleAnalytics,
    deleteCookie,
    setCookie,
    getCookie,
    url,
    encrypt,
    decrypt,
    get_local_storage_item, 
    CustomCookieConsent, 
    handleCopy, 
    toastifyFunction, 
    RouteNotFound, 
    purchaser, 
    logOutFunction, 
    getPermission, 
    store_local_storage_item, 
    split_errors
}