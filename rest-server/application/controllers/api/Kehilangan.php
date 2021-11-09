<?php

use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');


require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';


class Kehilangan extends CI_Controller
{
    use REST_Controller {
        REST_Controller::__construct as private __resTraitConstruct;
    }

    public function __construct()
    {
        parent::__construct();
        $this->__resTraitConstruct();

        $this->load->model('Kehilangan_model', 'kehilangan');
        // $this->methods['index_get']['limit'] = 1000;
    }

    public function index_get()
    {   
        $id = $this->get('id');

        if ($id === null) {
            $kehilangan = $this->kehilangan->getKehilangan();
        }else{
            $kehilangan = $this->kehilangan->getKehilangan($id);
        }
        

        if ($kehilangan) {
            $this->response($kehilangan
            , 200);
        }else{
            $this->response([
                'status' => false,
                'data' => 'id not found or data empty'
            ], 204);
        }
    }

    public function index_delete()
    {
        $id = $this->delete('id');

        if ($id === null) {
            $this->response([
                'status' => false,
                'data' => 'Provide an id'
            ], 400);
        } else {
            if ($this->kehilangan->deleteKehilangan($id) > 0) {

                $this->response([
                    'status' => true,
                    'id' => $id,
                    'message' => 'Deleted'
                ], 204);
            } else {
                $this->response([
                    'status' => false,
                    'data' => 'id not found'
                ], 400);
            }
        }
    }

    public function index_post()
    {
        $data = [
            'id_user' => $this->post('id_user'),
            'nama' => $this->post('nama'),
            'peran' => $this->post('peran'),
            'nama_barang' => $this->post('nama_barang'),
            'jenis_barang' => $this->post('jenis_barang'),
            'gambar' => $this->post('gambar'),
            'detail_informasi' => $this->post('detail_informasi'),
            'tempat_kehilangan' => $this->post('tempat_kehilangan'),
            'waktu_kehilangan' => $this->post('waktu_kehilangan'),
            'nomor_hp' => $this->post('nomor_hp'),
            'id_line' => $this->post('id_line'),
        ];

        if ($this->kehilangan->createKehilangan($data) > 0) {
            $this->response([
                'status' => true,
                'message' => 'data kehilangan telah ditambahkan'
            ], 201);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Gagal menambahkan data kehilangan'
            ], 400);
        }
    }

    public function index_put()
    {   
        $id = $this->put('id');
        $data = [
            'nrp' => $this->put('nrp'),
            'nama' => $this->put('nama'),
            'email' => $this->put('email'),
            'jurusan' => $this->put('jurusan')
        ];

        if ($this->mahasiswa->updateMahasiswa($data, $id) > 0) {
            $this->response([
                'status' => true,
                'message' => 'data mahasiswa has been updated'
            ], 200);
        } else {
            $this->response([
                'status' => false,
                'message' => 'failed to update data!'
            ], 400);
        }
    }

}


?>