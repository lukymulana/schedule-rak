<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
date_default_timezone_set("Asia/Jakarta");

class Schedule extends CI_Controller {

    public function __construct()
	{
		parent::__construct();
        $this->load->model('m_schedule');
    }

    public function index()
    {
        $this->showSchedule();
    }

    public function showSchedule()
    {
        $data['schedule'] = $this->m_schedule->getDataPM();

        $this->load->view('template/header');
		$this->load->view('schedule/viewSchedule', $data);
		$this->load->view('template/footer');
    }

    public function getDataPMById()
    {
        $id_pm = $this->input->post('id_pm');
        $data = $this->m_schedule->getDataPMById($id_pm);
        echo json_encode($data);
    }

    public function prosesSaveActual()
    {
        $id_pm = $this->input->post('id_pm');
        $actual_date = $this->input->post('tanggal_actual');
        $shift = $this->input->post('shift');

        $data = array(
            'actual_date' => $actual_date,
            'shift' => $shift
        );

        $this->m_schedule->saveDateActual($id_pm,$data);

        echo " 
            <script>
                alert('Success');
                window.location.href = '".base_url('schedule/')."';
            </script>
        ";
    }
}

 ?>