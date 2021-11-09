<?php

class Temuan_model extends CI_Model
{
    public function getTemuan($id = null)
    {   
        if ($id === null) {
            return $this->db->get('tabeltemuan')->result_array();
        }else{
            return $this->db->get_where('tabeltemuan',['id' => $id])->result_array();
        }
    }

    public function deleteKehilangan($id)
    {
        $this->db->delete('tabeltemuan', [ 'id' => $id]);
        return $this->db->affected_rows();
    }

    public function createTemuan($data)
    {
        $this->db->insert('tabelTemuan', $data);
        return $this->db->affected_rows();
    }

    // public function updateTemuan($data, $id)
    // {
    //     $this->db->update('tabelTemuan', $data , ['id' => $id]);
    //     return $this->db->affected_rows();
    // }
}
?>