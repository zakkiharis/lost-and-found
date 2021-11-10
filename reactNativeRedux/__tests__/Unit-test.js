import { callApiKehilangan } from '../src/library/redux/reducer/reducerKehilangan';

import configureMockStore from 'redux-mock-store';
import thunk from 'redux-thunk';

const middlewares = [thunk]
const mockStore = configureMockStore(middlewares)

const url = "http://localhost/rest-server/api/kehilangan";

beforeEach(() => {
  fetch.resetMocks();
  jest.setTimeout(10000);
});

describe('API Unit Testing', () => {
  test('Test returns result if array', () => {
    fetch.mockResponseOnce(JSON.stringify([{ id: 133 }]));
  });


  test('returns result call api', () => {
    fetch.mockResponseOnce(JSON.stringify([{ id: 113 }]));
    const onResponse = jest.fn();
    const onError = jest.fn();

    return callApiKehilangan(url + '?X-API-KEY=pass')
      .then(onResponse)
      .catch(onError)
      .finally(() => {
        expect(onResponse).toHaveBeenCalled();
        expect(onError).not.toHaveBeenCalled();
        expect(onResponse.mock.calls[0][0][0]).toEqual(
          {
            "id": "133",
            "id_user": "59",
            "nama": "Zakki Haris",
            "peran": "Mahasiswa",
            "nama_barang": "Kaos Kaki Hitam ",
            "jenis_barang": "Elektronik",
            "gambar": "gambar_kaos.png",
            "detail_informasi": "Kaos kaki eletrik ditemukakn di jalan raya kali urang",
            "tempat_kehilangan": "Kaliurang KM 14",
            "waktu_kehilangan": "2020-01-16",
            "nomor_hp": "2147483647",
            "id_line": "jack",
            "status": "0",
            "waktusekarang": "2020-12-13 09:35:56"
          }
        );
      });
  });


  test('throw an error if object empty', () => {
    fetch.mockResponseOnce(JSON.stringify({}));
    const onResponse = jest.fn();
    return callApiKehilangan(url + '?X-API-KEY=pass&id=22')
      .then(onResponse)
      .finally(() => {
        expect(onResponse).toHaveBeenCalled();
        expect(onResponse.mock.calls[0]).toEqual([{ "data": "id not found or data empty" }])
      });

  });

  test('throws an error if bad request', () => {
    fetch.mockResponseOnce(JSON.stringify([{}]));
    const onResponse = jest.fn();
    return callApiKehilangan(url + '?X-API-KEY=pas')
      .then(onResponse)
      .finally(() => {
        expect(onResponse).toHaveBeenCalled();
        expect(onResponse.mock.calls[0]).toEqual([{ "data": "Bad request from server" }])
      });
  });

});
