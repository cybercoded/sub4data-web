import React from "react";
import ReactjsOverlayLoader from "reactjs-overlay-loader";

    
export const Loader = ({isActive}) => (
    <ReactjsOverlayLoader isActive={isActive} 
        icon={<img alt='loader' width={50} src={'http://localhost/sub4data-web/react/src/assets/admin/assets/img/loading.gif' }/>} 
    />
);