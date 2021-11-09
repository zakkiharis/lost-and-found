<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model{
    private $table = "login";

    public function __construct()
    {
        parent::__construct();

        $this->load->database();

        $this->userTbl= 'user';
    }

    public function getByEmail($email)
    {
        return $this->db->get_where($this->userTbl, ["email" => $email])->row();
    }
    
    function getRows($params = array()){
        $this->db->select('nama , email , id');
        $this->db->from($this->userTbl);
        
        //fetch data by conditions
        if(array_key_exists("conditions",$params)){
            foreach($params['conditions'] as $key => $value){
                $this->db->where($key,$value);
            }
        }
        
        if(array_key_exists("id",$params)){
            $this->db->where('id',$params['id']);
            $query = $this->db->get();
            $result = $query->row_array();
        }else{
            //set start and limit
            if(array_key_exists("start",$params) && array_key_exists("limit",$params)){
                $this->db->limit($params['limit'],$params['start']);
            }elseif(!array_key_exists("start",$params) && array_key_exists("limit",$params)){
                $this->db->limit($params['limit']);
            }
            
            if(array_key_exists("returnType",$params) && $params['returnType'] == 'count'){
                $result = $this->db->count_all_results();    
            }elseif(array_key_exists("returnType",$params) && $params['returnType'] == 'single'){
                $query = $this->db->get();
                $result = ($query->num_rows() > 0)?$query->row_array():false;
            }else{
                $query = $this->db->get();
                $result = ($query->num_rows() > 0)?$query->result_array():false;
            }
        }

        //return fetched data
        return $result;
    }
    
    /*
     * Insert user data
     */
    public function insert($data){
        //add created and modified date if not exists
        if(!array_key_exists("created", $data)){
            $data['created'] = date("Y-m-d H:i:s");
        }
        if(!array_key_exists("modified", $data)){
            $data['modified'] = date("Y-m-d H:i:s");
        }
        
        //insert user data to users table
        $insert = $this->db->insert($this->userTbl, $data);
        
        //return the status
        return $insert?$this->db->insert_id():false;
    }
    
    /*
     * Cek password user data
     */
    function cek_user($email,$old_password){

        $this->db->where('email',$email);
        $this->db->where('password',$old_password);
        $query = $this->db->get('users');
        return $query->result_array();

    }
    /*
     * Change password user data
     */
    public function changePassword($userData, $email)
    {
        if(!array_key_exists('modified', $userData)){
            $userData['modified'] = date("Y-m-d H:i:s");
        }
        
        //update user data in users table
        $update = $this->db->update($this->userTbl, $userData, array('email'=>$email));
        
        //return the status
        return $update?true:false;
    }

    /*
     * Update user data
     */
    public function update($data, $id){
        //add modified date if not exists
        if(!array_key_exists('modified', $data)){
            $data['modified'] = date("Y-m-d H:i:s");
        }
        
        //update user data in users table
        $update = $this->db->update($this->userTbl, $data, array('id'=>$id));
        
        //return the status
        return $update?true:false;
    }
    
    /*
     * Delete user data
     */
    public function delete($id){
        //update user from users table
        $delete = $this->db->delete('users',array('id'=>$id));
        //return the status
        return $delete?true:false;
    }

    

    // function getUserId($id){
    //     $this->db->where('id',$id);
    //     $query = $this->db->get($this->table);
    //     return $query->result();
    // }

    // function updateBuku($id_buku,$data){
    //     //  print_r($id_buku);
    //     // print_r($data);
    //     //  die();
        
    //     return $this->db->where('id_buku', $id_buku)->update($this->table, $data);
    // }

    // function insertBuku($data){
    //     return $this->db->insert($this->table,$data);
    // }
    // function deleteBuku($id_buku){
    //     $this->db->where('id_buku', $id_buku);
    //     $query = $this->db->delete($this->table);
    //     die($query);

    //     if($this->db->affected_rows() == '1'){
    //         return true;
    //     }else{
    //         return false;
    //     }
    // }
}
?>
