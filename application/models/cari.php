<?php
class Orang_model extends CI_Model {
	public function __construct()
	{
		$this->load->database();
	}
	public function cariBarang()
	{
		$cari = $this->input->GET('cari', TRUE);
		$data = $this->db->query("SELECT * from cc_master where nama like '%$cari%' ");
		return $data->result();
	}
 
 
}