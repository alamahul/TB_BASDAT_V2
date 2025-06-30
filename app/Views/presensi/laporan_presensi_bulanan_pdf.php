<?= $this->extend('templates/index') ?>

<?= $this->section('pageBody') ?>
<style>


    

    .table td,
      .table th {
        padding: 1px 2px; /* nilai default Bootstrap adalah 12px 15px */
        font-size: 12px;   /* kecilkan teks bila perlu */
      }
      table tr td {
        color: black;
      }

      table tr th {
        color: black;
      }

    
    h1 {
      color: black;
    }
</style>
<!-- Page body -->
<div class="page-body">
    <div class="container-xl">
        <div class="card mb-3">
            <div class="card-body">
                <div class="row g-3 flex-column-reverse flex-lg-row align-items-end">
                    <div class="col-lg-8">
                        <form method="get">
                            <div class="row align-items-end g-1">
                                <div class="col">
                                    <div class="row g-1">
                                        <div class="col">
                                            <select name="filter_bulan" class="form-select">
                                                <option value="01" <?= $filter_bulan === '01' ? 'selected' : '' ?>>Januari</option>
                                                <option value="02" <?= $filter_bulan === '02' ? 'selected' : '' ?>>Februari</option>
                                                <option value="03" <?= $filter_bulan === '03' ? 'selected' : '' ?>>Maret</option>
                                                <option value="04" <?= $filter_bulan === '04' ? 'selected' : '' ?>>April</option>
                                                <option value="05" <?= $filter_bulan === '05' ? 'selected' : '' ?>>Mei</option>
                                                <option value="06" <?= $filter_bulan === '06' ? 'selected' : '' ?>>Juni</option>
                                                <option value="07" <?= $filter_bulan === '07' ? 'selected' : '' ?>>Juli</option>
                                                <option value="08" <?= $filter_bulan === '08' ? 'selected' : '' ?>>Agustus</option>
                                                <option value="09" <?= $filter_bulan === '09' ? 'selected' : '' ?>>September</option>
                                                <option value="10" <?= $filter_bulan === '10' ? 'selected' : '' ?>>Oktober</option>
                                                <option value="11" <?= $filter_bulan === '11' ? 'selected' : '' ?>>November</option>
                                                <option value="12" <?= $filter_bulan === '12' ? 'selected' : '' ?>>Desember</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="filter_tahun" class="form-select filter_tahun" id="filter_tahun">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-outline-primary">Filter</button>
                                </div>
                            </div>
                        </form>
                    </div>

                   
                    <div class="col-lg-4 text-start text-lg-end">
                        <button type="button" class="btn btn-blue" id="exportPdf">
                        <svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="none"  stroke="currentColor"  stroke-width="2"  stroke-linecap="round"  stroke-linejoin="round"  class="icon icon-tabler icons-tabler-outline icon-tabler-printer"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M17 17h2a2 2 0 0 0 2 -2v-4a2 2 0 0 0 -2 -2h-14a2 2 0 0 0 -2 2v4a2 2 0 0 0 2 2h2" /><path d="M17 9v-4a2 2 0 0 0 -2 -2h-6a2 2 0 0 0 -2 2v4" /><path d="M7 13m0 2a2 2 0 0 1 2 -2h6a2 2 0 0 1 2 2v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2z" /></svg>
                            Cetak PDF
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <?php
        
        // var_dump($data_bulan);

        $data_bulan = date('F Y', strtotime($data_bulan));
        // var_dump(explode(' ', $data_bulan));
        $data_bulan = explode(' ', $data_bulan);
        $bulan = strtoupper($data_bulan[0]);
        $tahun = $data_bulan[1];

        //var_dump($bulan, $tahun);
         ?>

        <div class="row row-deck row-cards align-items-start" id="print-area">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                    <div class="row">
                        <div class="col-2">
                            <img src="<?= base_url('../assets/img/company/logo.png') ?>" width="110" height="32" alt="O-Present" class="navbar-brand-image">
                            <span class="ms-2">SIPEDES V2</span>
                        </div>
                        <div class="col-10 text-right">
                            <h3 class="card-title text-center">
                                LAPORAN PRESENSI BULAN <strong><?= $bulan ?> TAHUN <?= $tahun ?></strong><br>
                                DESA TEGALGEDE KECAMATAN PAKENJENG
                            </h3>
                        </div>
                    </div>
                        
                        
                        <div class="table-responsive">
                            <table class="table table-bordered tb-sm text-center" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th rowspan="2">NIPD</th>
                                        <th rowspan="2">Nama</th>
                                        <th colspan="31">PRESENSI</th>
                                        <th rowspan="2">Keterangan</th>
                                    </tr>
                                    <tr>
                                        <?php for ($tgl = 1; $tgl <= 31; $tgl++): ?>
                                            <th><?= str_pad($tgl, 2, '0', STR_PAD_LEFT) ?></th>
                                        <?php endfor; ?>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php  
                                array_shift($data_presensi);
                                //var_dump($data_presensi);
                                
                                ?>
                                    <?php foreach ($data_presensi as $pegawai): ?>
                                        <tr>
                                        <?php //var_dump($pegawai['izin']) ?>
                                            <td style="text-align: left;"><?= $pegawai['nip'] ?></td>
                                            <td style="text-align: left;"><?= $pegawai['nama'] ?></td>

                                            <?php
                                            $jumlahHari = cal_days_in_month(CAL_GREGORIAN, $filter_bulan, $filter_tahun);
                                            $total_poin = 0;
                                            $total_hari_kerja = 0;

                                            for ($tgl = 1; $tgl <= 31; $tgl++):
                                                $tanggal = sprintf('%04d-%02d-%02d', $filter_tahun, $filter_bulan, $tgl);

                                                if ($tgl > $jumlahHari) {
                                                    echo '<td style="background: #e9ecef"></td>';
                                                    continue;
                                                }

                                                $dayOfWeek = date('w', strtotime($tanggal)); // 0: Minggu, 6: Sabtu

                                                if ($dayOfWeek == 0 || $dayOfWeek == 6) {
                                                    echo '<td style="background: #e9ecef"></td>'; // libur
                                                    continue;
                                                }

                                                $total_hari_kerja++;

                                                $presensi = $pegawai['presensi'][$tanggal] ?? null;
                                                $izin = $pegawai['izin'][$tanggal] ?? null;

                                                if ($izin === 'TUGAS LUAR') {
                                                    echo '<td class="bg-secondary">TL</td>';
                                                    $total_poin += 0.5;
                                                } elseif ($izin === 'IZIN') {
                                                    echo '<td style="background: grey;">I</td>';
                                                    $total_poin += 0.5;
                                                } elseif ($presensi) {
                                                    if (strtotime($presensi['jam_masuk']) > strtotime('08:00:00')) {
                                                        echo '<td style="background:yellow;">H</td>';
                                                        $total_poin += 0.6;
                                                    } else {
                                                        echo '<td>H</td>';
                                                        $total_poin += 1;
                                                    }
                                                } else {
                                                    echo '<td style="background:red;"></td>';
                                                    // tidak hadir, 0 poin
                                                }

                                            endfor;

                                            $persen = $total_hari_kerja > 0 ? round(($total_poin / $total_hari_kerja) * 100, 2) : 0;
                                            ?>
                                            <td style="text-align: right;"><?= "{$total_poin} / {$total_hari_kerja} : {$persen} %" ?></td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</div>




<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<script>
document.getElementById("exportPdf").addEventListener("click", function () {
    // console.log(this);
    const element = document.getElementById("print-area");
    console.log(element)
    const opt = {
        margin:       0.5,
        filename:     'laporan-presensi-bulanan <?= $bulan ?>.pdf',
        image:        { type: 'jpeg', quality: 1 },
        html2canvas:  { scale: 1, useCORS: true },
        jsPDF:        { unit: 'in', format: 'a4', orientation: 'landscape' }
    };

    html2pdf().set(opt).from(element).save();
});

document.addEventListener('DOMContentLoaded', function() {
    // Ambil elemen select
    var selectTahuns = document.getElementsByClassName('filter_tahun');

    for (var i = 0; i < selectTahuns.length; i++) {
        var selectTahun = selectTahuns[i];
        var tahunSekarang = new Date().getFullYear();
        for (var tahun = <?= $tahun_mulai ?>; tahun <= tahunSekarang; tahun++) {
            var option = document.createElement('option');
            option.value = tahun;
            option.text = tahun;
            if (tahun == <?= $filter_tahun ?>) {
                option.selected = true;
            }
            selectTahun.add(option);
        }
    }
});
</script>


<?= $this->endSection() ?>