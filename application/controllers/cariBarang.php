<?php
class Orang extends CI_Controller {
 
	public function __construct()
	{
		parent::__construct();
		$this->load->helper("url");
		$this->load->model('cari');
	}
 
	public function cari() 
	{
		$this->load->view('search');
	}
 
	public function hasil()
	{
		$data2['cari'] = $this->cari->cariOrang();
		$this->load->view('result', $data2);
	}
}