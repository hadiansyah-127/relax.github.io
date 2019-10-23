<form action="" method="get" class="form-horizontal well no-print">
	<div class="form-group">
		<label class="control-label col-sm-3">
			Tampilkan Data			
		</label>
		<div class="col-sm-9">
			<label for="show1" class="block">
				<input type="radio" id="show1" <?php if(isset($_GET['show'])){if($_GET['show'] == 1){echo "checked";}}?> name="show" value="1" onchange="this.form.submit()">
				Master Barang
			</label>


			<label for="show2" class="block">
				<input type="radio" id="show2" <?php if(isset($_GET['show'])){if($_GET['show'] == 2){echo "checked";}}?> name="show" value="2" onchange="this.form.submit()">
				Barang ke Divisi
			</label>
		</div>
	</div>

	<?php
	if(isset($_GET['show'])){
		if($_GET['show'] == 2){
	?>
	<div class="form-group">
		<label class="control-label col-sm-3">
			Filter Divisi
		</label>
		<div class="col-sm-9">
			<select name="filter" name="divisi" class="form-control" onchange="this.form.submit()">
				<option value="">- Seluruh Divisi -</option>
				<?php
				foreach($listdiv as $iddv=>$dvname){
					$sel = "";
					if(isset($_GET['filter'])){
						if($_GET['filter'] == $iddv){
							$sel = "selected";
						}
					}
					echo "
					<option $sel value='$iddv'>$dvname</option>";
				}
				?>
			</select>
		</div>
	</div>
	<?php
		}
	}
	?>

	<div class="form-group">
		<label class="control-label col-sm-3">
			
		</label>
		<div class="col-sm-9">
			<label for="dtl">
				<input type="checkbox" name="dtl" id="dtl" value="1" onchange="this.form.submit()" <?php if(isset($_GET['dtl'])){if($_GET['dtl'] == 1){echo "checked";}}?>> Tampilkan Dalam Mode Detail
			</label>
		</div>
	</div>

</form>



<div class="print-area">

<?php
if(isset($show)):
echo "
	<a href='javascript:;' onclick='window.print()' class='btn btn-primary no-print'><span class='fa fa-print fa-fw'></span> Print</a>
";

	if($show == 1) :
					?>

	<table class="data table">
		<thead>
			<tr>
				<th>NO.</th>
				<th>NAMA BARANG</th>
				<th>TANGGAL</th>
				<th>MASUK GUDANG</th>
				<th>KELUAR GUDANG</th>
				<?php
				if(isset($_GET['dtl'])){
					echo "<th>KETERANGAN</th>";
				}
				else{
					echo "<th>SISA</th>";
				}
				?>
			</tr>			
		</thead>

		<tbody>
		<?php
		if(isset($query)){
			$n = 1;
			foreach($query as $idmaster=>$isi){
				if(isset($list_cc[$idmaster])){

					$nama = $list_cc[$idmaster];
					$mutasi = 0;
					$masuk = $keluar = 0;
					foreach($isi as $tgl => $row){
						$date = date("Y-m-d",$tgl);

						$terima = "";
						if(isset($row['terima'])){
							$terima = $row['terima'];
							$mutasi += $terima;
						}
						$kirim = "";
						if(isset($row['kirim'])){
							$kirim = $row['kirim'];
							$mutasi -= $kirim;
						}

						$ket = isset($row['ket']) ? "<em>$row[ket]</em>" : "";


						if($detail == 1){
							echo "
							<tr>
								<td>$n</td>
								<td>$nama</td>
								<td>".indo_date($date,"half")."</td>
								<td>$terima</td>
								<td>$kirim</td>
								<td>$ket</td>
							</tr>
							";
							$n++;
						}
						else{
							$masuk += intval($terima);
							$keluar += intval($kirim);
						}
					}

					if($detail == 1){
						echo "
						<tr class='active'>
							<td colspan=4 align='right'>Stok Akhir</td>
							<td><strong>$mutasi</strong></td>
							<td></td>
						</tr>
						<tr>
							<td colspan=6></td>
						</tr>
						";
					}
					else{
						echo "
						<tr>
							<td>$n</td>
							<td>$nama</td>
							<td>".indo_date($date,"half")."</td>
							<td>$masuk</td>
							<td>$keluar</td>
							<td><strong>$mutasi</strong></td>
						</tr>
						";
						$n++;
					}
				}
			}
		}
		?>
		</tbody>
	</table>

<?php
elseif($show == 2):
?>
<br>
<br>
	<table align="left">
	<tr>
		<td><strong>Nama KA.SUBAG</strong</td>
		<td style="padding:0 1em;"><strong>:</strong></td>


		<!-- <?php
				foreach($listdiv as $iddv=>$dvname){
					$sel = "";
					if(isset($_GET['filter'])){
						if($_GET['filter'] == $iddv){
							$sel = "selected";
						}
					}
					echo "
					<option $sel value='$iddv'>$dvname</option>";
				}
				?> -->
		
	</tr>
</table>
<br>
<br>
	<table class="data table">
		<thead>
			<tr>
				<th>No.</th>
				<th>DIVISI</th>
				<th>TANGGAL</th>
				<th>NAMA BARANG</th>
				<th>BANYAKNYA</th>
				<?php
				if(isset($_GET['dtl'])){
					echo "<th>KETERANGAN</th>";
				}
				else{
					echo "<th>SISA</th>";
				}
				?>
			</tr>
		</thead>
		<tbody>
		<?php
		if(isset($query)){
			$n = 1;
			foreach($query as $iddivisi=>$isi){
				if(isset($listdiv[$iddivisi])){

					$divisi = $listdiv[$iddivisi];

					foreach($isi as $idmaster => $isis){
						$ccname = $list_cc[$idmaster];
						$mutasi = 0;
						$masuk = $keluar = 0;

						foreach($isis as $tgl => $row){
							$date = date("Y-m-d",$tgl);

							$kirim = "";
							if(isset($row['kirim'])){
								$kirim = $row['kirim'];
								$mutasi += $kirim;
							}


							

							$ket = isset($row['ket']) ? "<em>$row[ket]</em>" : "";


							if($detail == 1){
								echo "
								<tr>
									<td>$n</td>
									<td>$divisi</td>
									<td>".indo_date($date,"half")."</td>
									<td>$ccname</td>
									<td>$kirim</td>
									<td>$ket</td>
								</tr>
								";
								$n++;
							}
							else{
								$masuk += intval($kirim);
								
							}
						}

						if($detail == 1){
							echo "
							<tr class='active'>
								<td colspan=5 align='right'>Sisa Barang</td>
								<td><strong>$mutasi</strong></td>
								<td></td>
							</tr>
							<tr>
								<td colspan=7></td>
							</tr>
							";
						}
						else{
							echo "
							<tr>
								<td>$n</td>
								<td>$divisi</td>
								<td>".indo_date($date,"half")."</td>
								<td>$ccname</td>
								<td>$masuk</td>
								
								<td><em><strong>$mutasi</strong></em></td>
							</tr>
							";
							$n++;
						}




					}


				}
			}
		}
		?>
		</tbody>
	</table>
	<br>
	<br>
	<table>
		<tr>
			<td style="padding:0 2em; color: white;">KA.SUBAG <br>
			PERLENGKAPAN</td>
			<td style="padding:0 12em; color: white;">BAG.Gudang</td>
			<td style="padding:0 6em; color: white;">Penerima</td>
			<td style="padding:0 9em; color: white;">KA.BID/BAG/UNIT</td>
		</tr>
	</table>
	<br><br><br><br><br>
	<table>
		<tr>
			<td style="padding:0 2em; color: white;"> .............................. </td>
			<td style="padding:0 11em; color: white;"> ............................. </td>
			<td style="padding:0 4em; color: white;"> ............................. </td>
			<td style="padding:0 9em; color: white;"> ............................. </td>
		</tr>
	</table>

<?php
endif;
endif;
?>

</div>
