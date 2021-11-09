<?php

use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');


require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';


class Login extends CI_Controller
{
    use REST_Controller {
        REST_Controller::__construct as private __resTraitConstruct;
    }

    public function __construct()
    {
        parent::__construct();
        $this->__resTraitConstruct();

        $this->load->model('Login_model', 'login');
        $this->methods['index_get']['limit'] = 100;
    }

    public function login_post() {

        $data = json_decode(file_get_contents('php://input'));
        
        // Get the post data
        $operation = $data -> operation;
        $email = $data-> user -> email;
        $password = $data -> user -> password;

        if ($operation == 'login') {
            // Validate the post data
            if(!empty($email) && !empty($password)){

                $hash = $this->db->get_where('user', ['email' => $email])->row_array();
                // Check if any user exists with the given credentials
                $con['returnType'] = 'single';
                $con['conditions'] = array(
                    'email' => $email,
                    'is_active' => 1
                );
                $user = $this->login->getRows($con);
                if (password_verify($password, $hash['password'])) {
                    if($user){
                        // Set the response and exit
                        $this->response([
                            'result' => 'success',
                            'status' => TRUE,
                            'message' => 'User login successful.',
                            'user' => $user
                        ], 200);
                    }else{
                        // Set the response and exit
                        //BAD_REQUEST (400) being the HTTP response code
                        $this->response("Wrong email or password.", 400);
                    }
                }else{
                    $this->response("Salah email or password.", 400);
                }
            }else{
                // Set the response and exit
                $this->response("Provide email and password.", 400);
            }
        }
    }
    
    public function registration_post() {
        // Get the post data
        $first_name = strip_tags($this->post('first_name'));
        $last_name = strip_tags($this->post('last_name'));
        $email = strip_tags($this->post('email'));
        $password = $this->post('password');
        $phone = strip_tags($this->post('phone'));
        $unique_id = uniqid('', true);


        // Validate the post data
        if(!empty($first_name) && !empty($last_name) && !empty($email) && !empty($password)){
            
            // Check if the given email already exists
            $con['returnType'] = 'count';
            $con['conditions'] = array(
                'email' => $email,
            );
            $userCount = $this->M_Login->getRows($con);

            if($userCount > 0){
                // Set the response and exit
                $this->response("The given email already exists.", REST_Controller::HTTP_BAD_REQUEST);
            }else{
                // Insert user data
                $userData = array(
                    'first_name' => $first_name,
                    'last_name' => $last_name,
                    'email' => $email,
                    'password' => md5($password),
                    'phone' => $phone,
                    'unique_id' => $unique_id
                );
                $insert = $this->M_Login->insert($userData);
                
                // Check if the user data is inserted
                if($insert){
                    // Set the response and exit
                    $this->response([
                        'status' => TRUE,
                        'message' => 'The user has been added successfully.',
                        'data' => $insert
                    ], REST_Controller::HTTP_OK);
                }else{
                    // Set the response and exit
                    $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
                }
            }
        }else{
            // Set the response and exit
            $this->response("Provide complete user info to add.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function user_get($id = 0) {
        // Returns all the users data if the id not specified,
        // Otherwise, a single user will be returned.
        $con = $id?array('id' => $id):'';
        $users = $this->user->getRows($con);
        
        // Check if the user data exists
        if(!empty($users)){
            // Set the response and exit
            //OK (200) being the HTTP response code
            $this->response($users, REST_Controller::HTTP_OK);
        }else{
            // Set the response and exit
            //NOT_FOUND (404) being the HTTP response code
            $this->response([
                'status' => FALSE,
                'message' => 'No user was found.'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function chgPass_put()
    {
        $data = json_decode(file_get_contents('php://input'));

        $operation = $data -> operation;
        $user = $data -> user;
    
        $email = $user -> email;
        $old_password = $user -> old_password;
        $new_password = $user -> new_password;

        $row = $this->M_Login->getByEmail($email);
        $name = strip_tags($row->name);
        $phone = strip_tags($row->phone);
        $unique_id = uniqid('', true);

        // Validate the post data
        if ($operation == 'chgPass' ) {
            if(!empty($user) && (!empty($email) || !empty($old_password) || !empty($new_password) || !empty($unique_id))){
                // Update user's account data
                if (!empty($this->M_Login->cek_user($email, $old_password))) {
                    $userData = array( 
                        'name' => $name,
                        'email' => $email,
                        'unique_id' => $unique_id,
                        'password' => $new_password,
                        'phone' => $phone
                    );

                    $update = $this->M_Login->changePassword($userData, $email);
                    
                    // var_dump($update);
                    // exit;
                    // Check if the user data is updated
                    if($update){
                        // Set the response and exit
                        $this->response([
                            'result' => "success",
                            'message' => 'The user info has been updated successfully.'
                        ], REST_Controller::HTTP_OK);
                    }else{
                        // Set the response and exit
                        $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
                    }
                }else{
                    $this->response("Invalid old Password.", REST_Controller::HTTP_BAD_REQUEST);
                }
            }else{
                // Set the response and exit
                $this->response("Provide at least one user info to update.", REST_Controller::HTTP_BAD_REQUEST);
            }
        }else{
            $this->response("Invalid variable operation.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }
    
    public function user_put() {
        $id = $this->put('id');
        
        // Get the post data
        $first_name = strip_tags($this->put('first_name'));
        $last_name = strip_tags($this->put('last_name'));
        $email = strip_tags($this->put('email'));
        $password = $this->put('password');
        $phone = strip_tags($this->put('phone'));
        
        // Validate the post data
        if(!empty($id) && (!empty($first_name) || !empty($last_name) || !empty($email) || !empty($password) || !empty($phone))){
            // Update user's account data
            $userData = array();
            if(!empty($first_name)){
                $userData['first_name'] = $first_name;
            }
            if(!empty($last_name)){
                $userData['last_name'] = $last_name;
            }
            if(!empty($email)){
                $userData['email'] = $email;
            }
            if(!empty($password)){
                $userData['password'] = $password;
            }
            if(!empty($phone)){
                $userData['phone'] = $phone;
            }
            $update = $this->user->update($userData, $id);
            
            // Check if the user data is updated
            if($update){
                // Set the response and exit
                $this->response([
                    'status' => TRUE,
                    'message' => 'The user info has been updated successfully.'
                ], REST_Controller::HTTP_OK);
            }else{
                // Set the response and exit
                $this->response("Some problems occurred, please try again.", REST_Controller::HTTP_BAD_REQUEST);
            }
        }else{
            // Set the response and exit
            $this->response("Provide at least one user info to update.", REST_Controller::HTTP_BAD_REQUEST);
        }
    }


    // //Menampilkna data customer
    // public function customer_get()
    // {
    //     $id = $this->uri->segment('4');
    //     if($id == ''){
    //         $customer = $this->MCustomer->getCustomer();
    //     }else{
    //         $customer = $this->MCustomer->getCustomerById($id);
    //     }
    //     $this->response($customer, 200);
    // }

    // //Mengubah data buku
	// function buku_post() {
    //     //mengambil ID yang dikirim melalui method post
    //     $id = $this->post('id_buku');
    //     //mengambil data yang dikirim melalui method post
    //     $data = array(
    //             'judul'      => $this->post('judul'),
    //             'pengarang'  => $this->post('pengarang'),
    //             'penerbit'   => $this->post('penerbit'),
    //             'gambar'      => $this->post('gambar'),
    //             'harga'      => $this->post('harga'),
    //             'deskripsi'  => $this->post('deskripsi')
    //     );

    //     //proses update data ke dalam database
    //     $update = $this->MBuku->updateBuku($id,$data);
    //     //pengecekan apakah proses update berhasil atau tidak
    //     if ($update) {
    //         $this->response($data, 200);
    //     } else {
    //         $this->response(array('status' => 'fail', 502));
    //     }
    // }

    // //Menambah data buku
	// function buku_put() {
    //     //mengambil data yang dikirim melalui method put
    //     $data = array(
    //             'judul'      => $this->put('judul'),
    //             'pengarang'  => $this->put('pengarang'),
    //             'penerbit'   => $this->put('penerbit'),
    //             'gambar'      => $this->put('gambar'),
    //             'harga'      => $this->put('harga'),
    //             'deskripsi'  => $this->put('deskripsi')
    //     );
    //     //proses insert data ke dalam database
    //     $insert = $this->MBuku->insertBuku($data);

    //     //pengecekan apakah proses insert berhasil atau tidak
    //     if ($insert) {
    //         $this->response($data, 200);
    //     } else {
    //         $this->response(array('status' => 'fail', 502));
    //     }
    // }

    // //Menghapus salah satu data buku
	// function buku_delete() {
    //     //mengambil data ID yang dikirim melalui method post
    //     $id = $this->delete('id');
    //     //proses delete data dari database
    //     $delete = $this->MBuku->deleteBuku($id);
    //     //pengecekan apakah proses delete berhasil atau tidak
    //     if ($delete) {
    //         $this->response(array('status' => 'success'), 201);
    //     } else {
    //         $this->response(array('status' => 'fail', 502));
    //     }
    // }

    //Masukan function selanjutnya disini

    
}


?>