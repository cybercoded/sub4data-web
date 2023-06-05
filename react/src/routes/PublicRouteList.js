import Home from "../components/frontend/Home";
import About from '../components/frontend/About';
import Contact from '../components/frontend/Profile';
import Page403 from "../components/errors/Page403";
import Page404 from "../components/errors/Page404";
import Login from "../components/frontend/auth/Login";
import Register from "../components/frontend/auth/Register";
import ThankYou from '../components/frontend/Thankyou';
import Dashboard from '../components/frontend/Dashoard';
import Profile from '../components/frontend/Profile';
import Data from '../components/frontend/services/Data';
import Airtime from '../components/frontend/services/Airtime';
import Bill from '../components/frontend/services/Bill';
import Electricity from '../components/frontend/services/Electricity';

const PublicRouteList =[
    { path: '/index', exact: true, name: 'Home', component: Home },
    { path: '/dashboard', exact: true, name: 'Dashboard', component: Dashboard },
    { path: '/about', exact: true, name: 'About', component: About },
    { path: '/contact', exact: true, name: 'Contact', component: Contact },
    { path: '/403', exact: true, name: 'Page403', component: Page403 },
    { path: '/404', exact: true, name: 'Page404', component: Page404 },
    { path: '/login', exact: true, name: 'Login', component: Login },
    { path: '/register', exact: true, name: 'Register', component: Register },
    { path: '/thank-you', exact: true, name: 'ThankYou', component: ThankYou },
    { path: '/profile', exact: true, name: 'Profile', component: Profile },
    
    { path: '/services/data/:id', exact: true, name: 'Data', component: Data },
    { path: '/services/airtime/:id', exact: true, name: 'Airtime', component: Airtime },
    { path: '/services/bill/:id', exact: true, name: 'Bill', component: Bill },
    { path: '/services/electricity/:id', exact: true, name: 'Electricity', component: Electricity },

];

export default PublicRouteList;