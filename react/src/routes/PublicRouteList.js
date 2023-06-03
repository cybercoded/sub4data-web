import Home from "../components/frontend/Home";
import About from '../components/frontend/About';
import Contact from '../components/frontend/Profile';
import Page403 from "../components/errors/Page403";
import Page404 from "../components/errors/Page404";
import Login from "../components/frontend/auth/Login";
import Register from "../components/frontend/auth/Register";
import ViewCategory from '../components/frontend/collections/ViewCategory';
import ViewProduct from '../components/frontend/collections/ViewProduct';
import ProductDetail from '../components/frontend/collections/ProductDetail';
import Cart from '../components/frontend/Cart';
import ThankYou from '../components/frontend/Thankyou';
import Dashboard from '../components/frontend/Dashoard';
import Profile from '../components/frontend/Profile';
import Data from '../components/frontend/Data';

const PublicRouteList =[
    { path: '/index', exact: true, name: 'Home', component: Home },
    { path: '/dashboard', exact: true, name: 'Dashboard', component: Dashboard },
    { path: '/about', exact: true, name: 'About', component: About },
    { path: '/contact', exact: true, name: 'Contact', component: Contact },
    { path: '/403', exact: true, name: 'Page403', component: Page403 },
    { path: '/404', exact: true, name: 'Page404', component: Page404 },
    { path: '/login', exact: true, name: 'Login', component: Login },
    { path: '/register', exact: true, name: 'Register', component: Register },
    { path: '/collections', exact: true, name: 'ViewCategory', component: ViewCategory },
    { path: '/collections/:slug', exact: true, name: 'ViewProduct', component: ViewProduct },
    { path: '/collections/:category/:product', exact: true, name: 'ProductDetail', component: ProductDetail },
    { path: '/cart', exact: true, name: 'Cart', component: Cart },
    { path: '/thank-you', exact: true, name: 'ThankYou', component: ThankYou },
    { path: '/profile', exact: true, name: 'Profile', component: Profile },
    { path: '/data', exact: true, name: 'Data', component: Data },

];

export default PublicRouteList;