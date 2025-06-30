<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use DateTime;

class PresensiSeeder extends Seeder
{
    public function run()
    {

        // id_pegawai	tanggal_masuk	jam_masuk	foto_masuk	tanggal_keluar	jam_keluar	foto_keluar
        // $data = [
        //     [
        //         'id_pegawai'            => '2',
        //         'tanggal_masuk'         => '2025-01-01',
        //         'jam_masuk'    => '08:00:00',
        //         'foto_masuk'           => 'masuk-2025-01-01-08-00-00-default.png',
        //         'tanggal_keluar'       => '2025-06-29',
        //         'jam_keluar'           => '17:35:12',
        //         'foto_keluar'          => 'keluar-2025-06-29-19-33-55-default.png',
        //     ]
        
        // ];

        $data = [];

        $startDate = new DateTime('2025-01-01');
        $endDate = new DateTime('2025-05-31');
        
        for ($i = 2; $i <= 11; $i++) {
            $currentDate = clone $startDate;
            while ($currentDate <= $endDate) {
                $dayOfWeek = $currentDate->format('N'); // 1 (for Monday) through 7 (for Sunday)
        
                // Only include data for Monday to Friday
                if ($dayOfWeek >= 1 && $dayOfWeek <= 5) {
                    $tanggal = $currentDate->format('Y-m-d');
        
                    $jam_masuk_hour = sprintf('%02d', mt_rand(7, 8)); // Between 07 and 08
                    $jam_masuk_minute = sprintf('%02d', mt_rand(0, 59));
                    $jam_masuk_second = sprintf('%02d', mt_rand(0, 59));
                    $jam_masuk = "{$jam_masuk_hour}:{$jam_masuk_minute}:{$jam_masuk_second}";
        
                    $jam_keluar_hour = sprintf('%02d', mt_rand(16, 17)); // Between 16 and 17
                    $jam_keluar_minute = sprintf('%02d', mt_rand(0, 59));
                    $jam_keluar_second = sprintf('%02d', mt_rand(0, 59));
                    $jam_keluar = "{$jam_keluar_hour}:{$jam_keluar_minute}:{$jam_keluar_second}";
        
                    $data[] = [
                        'id_pegawai' => (string)$i,
                        'tanggal_masuk' => $tanggal,
                        'jam_masuk' => $jam_masuk,
                        'foto_masuk' => "masuk-{$tanggal}-" . str_replace(':', '-', $jam_masuk) . "-default.png",
                        'tanggal_keluar' => $tanggal,
                        'jam_keluar' => $jam_keluar,
                        'foto_keluar' => "keluar-{$tanggal}-" . str_replace(':', '-', $jam_keluar) . "-default.png",
                    ];
                }
        
                $currentDate->modify('+1 day');
            }
        }


            $this->db->table('presensi')->insertBatch($data);
    }
}
