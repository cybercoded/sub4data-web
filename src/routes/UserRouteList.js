import CreatePin from "../components/frontend/user/CreatePin";
import Dashboard from "../components/frontend/user/Dashboard";
import Profile from "../components/frontend/user/Profile";

import Data from "../components/frontend/services/Data";
import Airtime from "../components/frontend/services/Airtime";
import Bill from "../components/frontend/services/Bill";
import Electricity from "../components/frontend/services/Electricity";
import UpdatePin from "../components/frontend/user/UpdatePin";
import UpdatePassword from "../components/frontend/user/UpdatePassword";
import Transactions from "../components/frontend/user/Transactions";
import TransferFund from "../components/frontend/user/TransferFund";
import FundWallet from "../components/frontend/user/FundWallet";
import VerifyPinOtp from "../components/frontend/user/VerifyPinOtp";
import MerchantPay from "../components/frontend/user/MerchantPay";
import UpgradeAccount from "../components/frontend/user/upgradeAccount";

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
    { path: '/user/fund-wallet', exact: true, name: 'FundWallet', component: FundWallet },
    { path: '/user/merchant-pay', exact: true, name: 'MerchantPay', component: MerchantPay },
    { path: '/user/pin-verify-otp', exact: true, name: 'VerifyPinOtp', component: VerifyPinOtp },
    { path: '/user/upgrade-account', exact: true, name: 'UpgradeAccount', component: UpgradeAccount }


];

export default UserRouteList;