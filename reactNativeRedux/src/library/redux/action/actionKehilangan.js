
const initialState = {
    loading: false,
    loaded: false,
    posts: [],
    error: null
};

import {
    FETCH_SOURCES,
    FETCH_KEHILANGAN,
    FETCH_KEHILANGAN_SUCCESS,
    FETCH_KEHILANGAN_ERROR
} from './types';


export const fetchKehilangan = () => ({
    type: FETCH_KEHILANGAN,
});

export const fetchSources = () => ({
    type: FETCH_SOURCES,
});

export const fetchKehilanganSuccess = (payload) => ({
    type: FETCH_KEHILANGAN_SUCCESS,
    payload
});

export const fetchKehilanganError = error => ({
    type: FETCH_KEHILANGAN_ERROR,
    error
});

