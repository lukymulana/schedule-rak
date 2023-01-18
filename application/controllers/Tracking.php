<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Jakarta");

class Tracking extends CI_Controller {

    public function __construct()
	{
		parent::__construct();
        $this->load->model('m_tracking');
    }

    public function index()
    {
        $this->item();
    }

    public function item($type_item=null)
    {
        // $data['schedule'] = $this->m_schedule->getDataPM();
        if ($type_item==null) {
            $data['data_item'] = $this->m_tracking->getDataItem();

            $this->load->view('template/header');
            $this->load->view('tracking/scanItem',$data);
            $this->load->view('template/footer');
        } else {
            $cekItem = $this->m_tracking->getDataRakByItem($type_item);
            if (!empty($cekItem)) {
                $status = 1;
                $viewStatus = 'Disimpan pada rak '.$cekItem[0]['id_rak'];
            } else {
                $status = 0;
                $viewStatus = '-';
            }
            $data['status'] = $status;

            $dataItem = $this->m_tracking->getDataItemByType($type_item);

            if (empty($dataItem)) {
                echo "  <script type='text/javascript'>
                            alert('Item tidak ditemukan!');
                            window.location.href = '" . base_url() . "tracking/item';
                        </script> 
                ";
            } else {
                $data['data'] = $dataItem;
                $data['view_status'] = $viewStatus;

                $this->load->view('template/header');
                $this->load->view('tracking/viewItem',$data);
                $this->load->view('template/footer');
            }
        }
    }

    public function trimdies($type_item=null)
    {
        // $data['schedule'] = $this->m_schedule->getDataPM();
        if ($type_item==null) {
            $data['data_item'] = $this->m_tracking->getDataTrimdies();

            $this->load->view('template/header');
            $this->load->view('tracking/scanTrimdies',$data);
            $this->load->view('template/footer');
        } else {
            $trim = str_replace('.',' ',$type_item);
            $cekItem = $this->m_tracking->getDataRakByItem($trim);
            if (!empty($cekItem)) {
                $status = 1;
                $viewStatus = 'Disimpan pada rak '.$cekItem[0]['id_rak'];
            } else {
                $status = 0;
                $viewStatus = '-';
            }
            $data['status'] = $status;

            $dataItem = $this->m_tracking->getDataTrimdiesByType($trim);

            if (empty($dataItem)) {
                echo "  <script type='text/javascript'>
                            alert('Item tidak ditemukan!');
                            window.location.href = '" . base_url() . "tracking/trimdies';
                        </script> 
                ";
            } else {
                $data['data'] = $dataItem;
                $data['view_status'] = $viewStatus;

                $this->load->view('template/header');
                $this->load->view('tracking/viewTrimdies',$data);
                $this->load->view('template/footer');
            }
        }
    }

    public function rak()
    {
        
        $this->load->view('template/header');
        $this->load->view('rak/viewRak');
        $this->load->view('template/footer');
    }

    public function scanRak()
    {
        $type_item = str_replace('.',' ',$this->input->post('type'));

        $data['type'] = $type_item;
        $this->load->view('template/header');
        $this->load->view('tracking/scanRak', $data);
        $this->load->view('template/footer');
    }

    public function scanItemMesin()
    {
        $id_mesin = $this->input->post('type');

        $data['id_mesin'] = $id_mesin;
        $this->load->view('template/header');
        $this->load->view('tracking/scanItemMesin', $data);
        $this->load->view('template/footer');
    }

    public function simpan($type = null, $no_rak = null) {
        if ($type == null and $no_rak == null) {
            echo "Data tidak boleh kosong";
        } else {     
            $data_rak = $this->m_tracking->getDataRakById($no_rak);
            $item = str_replace('%20',' ',$type);
            $data_item =  $this->m_tracking->getDataItemByType($item);
            $data_trim =  $this->m_tracking->getDataTrimdiesByType($item);

            if (!empty($data_item)) {
                $jenis = $data_item[0]['jenis'];
                $link = 'item';
            } elseif (!empty($data_trim)) {
                $jenis = $data_trim[0]['jenis'];
                $link = 'trimdies';
            }

            if ($data_rak[0]['status'] == 1) {
                echo "  <script type='text/javascript'>
                            alert('Rak sudah digunakan!');
                            window.location.href = '" . base_url() . "tracking/".$link."';
                        </script>
                ";
            } elseif ($data_rak[0]['jenis_rak'] != $jenis) {
                echo "  <script type='text/javascript'>
                            alert('Rak tidak sesuai!');
                            window.location.href = '" . base_url() . "tracking/".$link."';
                        </script>
                ";
            } else {
                $data = array (
                    "status" => 1,
                    "last_update" => date('Y-m-d H:i:s'),
                    "keterangan" => $item,
                );
    
                $this->m_tracking->simpanItem($no_rak, $data);
    
                echo "  <script type='text/javascript'>
                        alert('Item Disimpan');
                        window.location.href = '" . base_url() . "tracking/rak';
                    </script>
                ";
            }
        }
    }
    
    public function pasangItem($id_mesin = null, $item = null) {
        if ($id_mesin == null and $item == null) {
            echo "Data tidak boleh kosong";
        } else {     
            $data_mesin = $this->m_tracking->getDataMesinById($id_mesin);
            $dataItem = str_replace('%20',' ',$item);

            if ($data_mesin[0]['status'] == 1) {
                echo "  <script type='text/javascript'>
                            alert('Rak sudah digunakan!');
                            window.location.href = '" . base_url() . "tracking/mesin;
                        </script>
                ";
            } else {
                $data = array (
                    "status" => 1,
                    "last_updated" => date('Y-m-d H:i:s'),
                    "item" => $dataItem,
                );
    
                $this->m_tracking->pasangItem($id_mesin, $data);
    
                echo "  <script type='text/javascript'>
                        alert('Item Dipasang');
                        window.location.href = '" . base_url() . "tracking/mesin';
                    </script>
                ";
            }
        }
    }
    
    public function ambilItem()
    {
        $type_item = $this->input->post('type');

        $data = array (
            "status" => 0,
            "last_update" => date('Y-m-d H:i:s'),
            "keterangan" => NULL
        );

        $this->m_tracking->ambilItem($type_item, $data);

        echo "  <script type='text/javascript'>
                    alert('Silahkan ambil item');
                    window.location.href = '" . base_url() . "tracking/rak';
                </script>
            ";
    }

    public function ambilItemMesin()
    {
        $id_mesin = $this->input->post('type');

        $data = array (
            "status" => 0,
            "last_updated" => date('Y-m-d H:i:s'),
            "item" => NULL
        );

        $this->m_tracking->pasangItem($id_mesin, $data);

        echo "  <script type='text/javascript'>
                    alert('Silahkan ambil item');
                    window.location.href = '" . base_url() . "tracking/mesin';
                </script>
            ";
    }

    public function mesin($id_mesin = null)
    {
        if ($id_mesin==null) {
            $data['data'] = $this->m_tracking->getDataMesin();
        
            $this->load->view('template/header');
            $this->load->view('tracking/scanMesin', $data);
            $this->load->view('template/footer');
        } else {
            $dataMesin = $this->m_tracking->getDataMesinById($id_mesin);

            if (empty($dataMesin)) {
                echo "  <script type='text/javascript'>
                            alert('Mesin tidak ditemukan!');
                            window.location.href = '" . base_url() . "tracking/mesin';
                        </script> 
                ";
            } else {
                $data['data'] = $dataMesin;

                $this->load->view('template/header');
                $this->load->view('tracking/viewMesin',$data);
                $this->load->view('template/footer');
            }
        }
    }
}

 ?>