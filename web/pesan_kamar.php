<?php

$nomor_invoice='INV-'.date('Ymd').'-'.(rand(10,100));
if (isset($_POST['checkin'])) {
    echo "<script>alert('berhasil!');window.location.href='index.php';</script>";
}
?>
<section class="contact-w3ls" id="reservation" style="background: #fff;">
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 contact-w3-agile2" data-aos="flip-left">
            <div class="contact-agileits">
                <div class="col-lg-12 col-md-12 col-sm-12 contact-w3-agile1" data-aos="flip-right">
                    <h4><?php echo $kamar_view['nama_kamar_tipe']; ?></h4>
                    <p class="contact-agile1">
                        Harga / Malam : <b>Rp <?php echo number_format($kamar_view['harga_malam']); ?></b>
                    </p>
                    <p class="contact-agile1">
                        Maximal Orang Dewasa : <b><?php echo $kamar_view['max_dewasa']; ?> Orang</b>
                    </p>
                    <p class="contact-agile1">
                        Maximal Anak-anak : <b><?php echo $kamar_view['max_anak']; ?> Orang</b>
                    </p>
                    <p class="contact-agile2">
                        <a href="?act=reservation&tamu=baru&kamar=<?php echo $kamar_view['id_kamar']; ?>"><b>Klik disini</b></a> jika nama tamu yang dimaksud tidak ditemukan untuk ditambah pada daftar buku tamu.
                    </p>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>
    </div>
</section>
