<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_Tracking extends CI_Model {
    public function __construct(){
		parent::__construct();
	}

    function getDataItem() {
        return $this->db->get('data_item')->result_array();
    }

    function getDataTrimdies() {
        return $this->db->get('data_trimdies')->result_array();
    }

    function getDataItemByType($type) {
        return $this->db->get_where('data_item', array('type_item' => $type))->result_array();
    }

    function getDataTrimdiesByType($type) {
        return $this->db->get_where('data_trimdies', array('type_trimdies' => $type))->result_array();
    }

    function simpanItem($id_rak,$data) {
        $this->db->where('id_rak', $id_rak);
        $this->db->update('data_rak', $data);
    }

    function getDataRakById($id_rak) {
        return $this->db->get_where('data_rak', array ('id_rak' => $id_rak))->result_array();
    }

    function getDataRakByItem($item) {
        return $this->db->get_where('data_rak', array ('keterangan' => $item))->result_array();
    }

    function ambilItem($type, $data) {
        $this->db->where('keterangan', $type);
        $this->db->update('data_rak', $data);
    }

    function inputDataRak($data) {
        $this->db->insert('data_rak',$data);
    }

    function inputDataTrim($data) {
        $this->db->insert('data_trimdies',$data);
    }

    function getDataMesin() {
        return $this->db->get('data_mesin')->result_array();
    }

    function getDataMesinById($id_mesin) {
        return $this->db->get_where('data_mesin', array('id_mesin' => $id_mesin))->result_array();
    }

    function pasangItem($id_mesin, $data) {
        $this->db->where('id_mesin', $id_mesin);
        $this->db->update('data_mesin', $data);
    }
}