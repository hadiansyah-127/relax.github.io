<table align="left">
	<tr>
		<td>Nama Barang</td>
		<td style="padding:0 1em;">:</td>
		<td><strong><?=$row['nama']?></strong></td>
	</tr>
</table>
<div class="clearfix"></div>


<table class="data table">
	<thead>
		<tr>
			<th>Tanggal</th>
			<th>Terima <span class="label label-success"><span class="fa fa-plus"></span></span></th>
			<th>Diterima <span class="label label-danger"><span class="fa fa-minus"></span></span></th>
			<th>Keterangan</th>
			<th>Mutasi</th>
		</tr>
	</thead>
	<tbody>
	<?php
	$mutasi = 0;
	foreach($item_mutasi as $tgl=>$data){
		$tgll = date("Y-m-d H:i:s",$tgl);
		$kirim = "";
		if(isset($data['kirim'])){
			$kirim = $data['kirim'];
			$mutasi += $kirim;
		}
		$terjual = "";
		if(isset($data['terjual'])){
			$terjual = $data['terjual'];
			$mutasi -= $terjual;
		}
		$ket = isset($data['ket']) ? $data['ket'] : "";


		echo "
		<tr>
			<td>".indo_date($tgll,"half")."</td>
			<td>$kirim</td>
			<td>$terjual</td>
			<td><em>$ket</em></td>
			<td>$mutasi</td>
		</tr>
		";
	}
	?>
		<tr>
			<td colspan=4 align="right"><strong>Stok Saat Ini</strong></td>
			<td><strong><?=$mutasi?></strong></td>
		</tr>
	</tbody>
</table>

