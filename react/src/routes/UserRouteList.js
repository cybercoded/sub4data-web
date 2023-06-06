import Dashboard from '../components/frontend/Dashoard';
import Profile from '../components/frontend/Profile';
import Data from '../components/frontend/services/Data';
import Airtime from '../components/frontend/services/Airtime';
import Bill from '../components/frontend/services/Bill';
import Electricity from '../components/frontend/services/Electricity';
import UpdatePin from '../components/frontend/UpdatePin';
import UpdatePassword from '../components/frontend/UpdatePassword';


const UserRouteList =[
    { path: 'dashboard', exact: true, name: 'Dashboard', component: Dashboard },
    { path: '/profile', exact: true, name: 'Profile', component: Profile },
    
    { path: '/services/data/:id', exact: true, name: 'Data', component: Data },
    { path: '/services/airtime/:id', exact: true, name: 'Airtime', component: Airtime },
    { path: '/services/bill/:id', exact: true, name: 'Bill', component: Bill },
    { path: '/services/electricity/:id', exact: true, name: 'Electricity', component: Electricity },

    { path: '/update-pin', exact: true, name: 'UpdatePin', component: UpdatePin },
    { path: '/update-password', exact: true, name: 'UpdatePassword', component: UpdatePassword }


];

export default UserRouteList;