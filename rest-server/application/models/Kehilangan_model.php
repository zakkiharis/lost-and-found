<?php

class Kehilangan_model extends CI_Model
{
    public function getKehilangan($id = null)
    {   
        if ($id === null) {
            return $this->db->get('tabelkehilangan')->result_array();
        }else{
            return $this->db->get_where('tabelkehilangan',['id' => $id])->result_array();
        }
    }

    public function deleteKehilangan($id)
    {
        $this->db->delete('tabelkehilangan', ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function createKehilangan($data)
    {
        $this->db->insert('tabelkehilangan', $data);
        return $this->db->affected_rows();
    }

    // public function updateTemuan($data, $id)
    // {
    //     $this->db->update('tabelkehilangan', $data , ['id' => $id]);
    //     return $this->db->affected_rows();
    // }
}
?>