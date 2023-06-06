import Dashboard from '../components/admin/Dashboard';

import Category from '../components/admin/category/Category';
import ViewCategory from '../components/admin/category/ViewCategory';
import EditCategory from '../components/admin/category/EditCategory';

import AddProduct from '../components/admin/product/AddProduct';
import ViewProduct from '../components/admin/product/ViewProduct';
import EditProduct from '../components/admin/product/EditProduct';

import AddServices from '../components/admin/services/AddServices';
import ViewServices from '../components/admin/services/ViewServices';
import EditServices from '../components/admin/services/EditServices';

import Profile from '../components/admin/Profile';
import EditUser from '../components/admin/user/EditUuser';

const AdminRouteList =[
    { path: '/admin', exact: true, name: 'Admin' },
    { path: '/admin/dashboard', exact: true, name: 'Dashboard', component: Dashboard },    

    { path: '/admin/add-category', exact: true, name: 'Category', component: Category },
    { path: '/admin/edit-category/:id', exact: true, name: 'EditCategory', component: EditCategory },
    { path: '/admin/view-category', exact: true, name: 'ViewCategory', component: ViewCategory },

    { path: '/admin/add-product', exact: true, name: 'AddProduct', component: AddProduct },
    { path: '/admin/view-product', exact: true, name: 'ViewProduct', component: ViewProduct },
    { path: '/admin/edit-product/:id', exact: true, name: 'EditProduct', component: EditProduct },

    { path: '/admin/add-services', exact: true, name: 'AddServices', component: AddServices },
    { path: '/admin/view-services', exact: true, name: 'ViewServices', component: ViewServices },
    { path: '/admin/edit-services/:id', exact: true, name: 'EditServices', component: EditServices },
    
    { path: '/admin/edit-user/:id', exact: true, name: 'EditUser', component: EditUser },
    
    { path: '/admin/profile', exact: true, name: 'Profile', component: Profile },

];

export default AdminRouteList;