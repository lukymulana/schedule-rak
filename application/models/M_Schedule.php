<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Schedule extends CI_Model {
    public function __construct(){
		parent::__construct();
	}

    function getDataPM() {
        return $this->db->get('data_pm')->result_array();
    }

    function getDataPMById($id_pm) {
        return $this->db->get_where('data_pm', array('id_pm' => $id_pm))->result_array();
    }

    function saveDateActual($id_pm, $data) {
        $this->db->where('id_pm', $id_pm);
        $this->db->update('data_pm', $data);
    }
}