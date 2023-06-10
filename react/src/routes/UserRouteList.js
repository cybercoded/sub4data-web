import Dashboard from '../components/frontend/Dashoard';
import Profile from '../components/frontend/Profile';
import Data from '../components/frontend/services/Data';
import Airtime from '../components/frontend/services/Airtime';
import Bill from '../components/frontend/services/Bill';
import Electricity from '../components/frontend/services/Electricity';
import UpdatePin from '../components/frontend/UpdatePin';
import UpdatePassword from '../components/frontend/UpdatePassword';
import CreatePin from '../components/frontend/CreatePin';
import Transactions from '../components/frontend/Transactions';
import TransferFund from '../components/frontend/TransferFund';
import VerifyPinOtp from '../components/frontend/VerifyPinOtp';


const UserRouteList =[
    { path: '/user/dashboard', exact: true, name: 'Dashboard', component: Dashboard },
    { path: '/user/profile', exact: true, name: 'Profile', component: Profile },
    
    { path: '/user/services/data/:id', exact: true, name: 'Data', component: Data },
    { path: '/user/services/airtime/:id', exact: true, name: 'Airtime', component: Airtime },
    { path: '/user/services/bill/:id', exact: true, name: 'Bill', component: Bill },
    { path: '/user/services/electricity/:id', exact: true, name: 'Electricity', component: Electricity },

    { path: '/user/create-pin', exact: true, name: 'CreatePin', component: CreatePin },
    { path: '/user/update-pin', exact: true, name: 'UpdatePin', component: UpdatePin },
    { path: '/user/update-password', exact: true, name: 'UpdatePassword', component: UpdatePassword },
    { path: '/user/transactions', exact: true, name: 'Transactions', component: Transactions },
    { path: '/user/transfer-fund', exact: true, name: 'TransferFund', component: TransferFund },
    { path: '/user/pin-verify-otp', exact: true, name: 'VerifyPinOtp', component: VerifyPinOtp }

];

export default UserRouteList;