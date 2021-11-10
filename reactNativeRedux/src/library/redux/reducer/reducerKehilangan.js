
import fetch from 'cross-fetch';
import 'react-native-console-time-polyfill';

const initialState = {
    loading: false,
    data: [],
    error: null
};

const sourcesKehilangan = (state = initialState, action) => {
    switch (action.type) {
        case 'FETCH_SOURCES':
            return {
                ...state,
                loading: true,
                error: null
            };
        case 'FETCH_KEHILANGAN_SUCCESS':
            return {
                ...state,
                loading: false,
                error: null,
                data: action.payload,
            };
        case 'FETCH_KEHILANGAN_ERROR':
            return {
                ...state,
                loading: false,
                error: action.error,
                data: []
            };
        default:
            return state;
    }
};

export default sourcesKehilangan;

export const callApiKehilangan = async (URL) => {
    try {
        const res = await fetch(URL);
        if (res.status >= 400) {
            throw new Error("Bad request from server");
        } else if (res.status >= 204) {
            throw new Error("id not found or data empty");
        }
        const response = await res.json();
        return response;
    } catch (err) {
        return { data: err.message };
    }
}

export function fetchSources() {
    return dispatch => {
        dispatch({ type: 'FETCH_SOURCES' });
        callApiKehilangan('http://localhost/rest-server/api/kehilangan?X-API-KEY=pass')
            .then(response => {
                dispatch({ type: 'FETCH_KEHILANGAN_SUCCESS', payload: response });
            })
            .catch(err => {
                dispatch({ type: 'FETCH_KEHILANGAN_ERROR', payload: err });
            })

    };
}































