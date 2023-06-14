import Home from "../components/frontend/Home";
import Page403 from "../components/errors/Page403";
import Page404 from "../components/errors/Page404";
import Login from "../components/frontend/auth/Login";
import Register from "../components/frontend/auth/Register";
import Reset from "../components/frontend/auth/Reset";
import NewPassword from "../components/frontend/auth/NewPassword";
import VerifyOtp from "../components/frontend/auth/VerifyOtp";
import RegistrationVerify from "../components/frontend/auth/RegistrationVerify";
import TermsAndCondition from "../components/frontend/auth/TermsAndCondition";
import PrivacyPolicy from "../components/frontend/auth/PrivacyPolicy";


const PublicRouteList =[
    { path: '/', exact: true, name: 'Home', component: Home },
    { path: '/403', exact: true, name: 'Page403', component: Page403 },
    { path: '/404', exact: true, name: 'Page404', component: Page404 },
    { path: '/login', exact: true, name: 'Login', component: Login },
    { path: '/register', exact: true, name: 'Register', component: Register },
    { path: '/reset', exact: true, name: 'Reset', component: Reset },
    { path: '/new-password/:email/:otp', exact: true, name: 'NewPassword', component: NewPassword },
    { path: '/verify-otp/:email', exact: true, name: 'VerifyOtp', component: VerifyOtp },
    { path: '/verify-registration', exact: true, name: 'RegistrationVerify', component: RegistrationVerify },
    { path: '/terms-and-condition', exact: true, name: 'TermsAndCondition', component: TermsAndCondition },
    { path: '/privacy-policy', exact: true, name: 'PrivacyPolicy', component: PrivacyPolicy }

];

export default PublicRouteList;