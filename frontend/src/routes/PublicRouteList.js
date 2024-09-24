import Home from "../components/frontend";
import Login from "../components/frontend/auth/Login";
import Register from "../components/frontend/auth/Register";
import Reset from "../components/frontend/auth/Reset";
import NewPassword from "../components/frontend/auth/NewPassword";
import RegistrationVerify from "../components/frontend/auth/RegistrationVerify";
import TermsAndCondition from "../components/frontend/auth/TermsAndCondition";
import PrivacyPolicy from "../components/frontend/auth/PrivacyPolicy";
import MFAverify from "../components/frontend/auth/MFAverify";
import VerifyOTPs from "../components/frontend/auth/VerifyOTPs";


const PublicRouteList =[
    { path: '/', exact: true, name: 'Home', component: Home },
    { path: '/login', exact: true, name: 'Login', component: Login },
    { path: '/login/:auto_login', exact: true, name: 'Login', component: Login },
    { path: '/register', exact: true, name: 'Register', component: Register },
    { path: '/reset', exact: true, name: 'Reset', component: Reset },
    { path: '/new-password', exact: true, name: 'NewPassword', component: NewPassword },
    { path: '/verify-otp/:destination/:email/:otp', exact: true, name: 'VerifyOTPs', component: VerifyOTPs },

    { path: '/verify-mfa/:email', exact: true, name: 'MFAverify', component: MFAverify },
    { path: '/verify-registration/:destination/:name/:email/:otp/:password', exact: true, name: 'RegistrationVerify', component: RegistrationVerify },
    { path: '/terms-and-condition', exact: true, name: 'TermsAndCondition', component: TermsAndCondition },
    { path: '/privacy-policy', exact: true, name: 'PrivacyPolicy', component: PrivacyPolicy }

];

export default PublicRouteList;