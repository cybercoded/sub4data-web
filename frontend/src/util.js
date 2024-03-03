import { inArray } from "jquery";

const get_local_storage_item = (item) => {

    let data = JSON.parse(localStorage.getItem(item));

    return data;
}

const store_local_storage_item = (key, value) => {

    let data = localStorage.setItem(key, JSON.stringify(value));
    if (!data) {
        return false
    }

    return true;
}

const getPermission = (permission) => {
    let list = JSON.parse(localStorage.getItem('permissions')) || [];
    return list.includes(permission);
};


const split_errors = (errors) => {
    let errorMessage = '';

    // Construct error message for each field
    for (const field in errors) {
        if (errors.hasOwnProperty(field)) {
        errorMessage += `${field}:\n`;
        errorMessage += errors[field].join('\n');
        errorMessage += '\n';
        }
    }

    return errorMessage;
}

export {get_local_storage_item, getPermission, store_local_storage_item, split_errors}