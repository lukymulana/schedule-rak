<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">Information</h2>
    
    <div class="col-md-12">
        <!-- Dynamic Table Full -->
        <div class="block">
            <div class="block-content block-content-full">
                <table>
                    <tr>
                        <td>Jenis</td>
                        <td>:</td>
                        <td><?=$data[0]["jenis"]?></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>:</td>
                        <td><?=$data[0]["type_trimdies"]?></td>
                    </tr>
                    <tr>
                        <td>No Trimdies</td>
                        <td>:</td>
                        <td><?=$data[0]["no_trimdies"]?></td>
                    </tr>
                    <tr>
                        <td>Jarak Pisau</td>
                        <td>:</td>
                        <td><?= $jarak = ($data[0]["jarak_pisau"]) ? $data[0]["jarak_pisau"] : '-' ; ?></td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>:</td>
                        <td><?=$view_status?></td>
                    </tr>
                    <tr>
                        <td>History</td>
                        <td></td>
                        <td>1.</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>2.</td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- END Dynamic Table Full -->
        <?php 
            if($status == 1) { ?>
                <form action="<?=base_url()?>tracking/ambilItem" method="post">
                    <input type="hidden" name="type" value="<?=$data[0]["type_trimdies"]?>">
                    <input type="submit" class="btn btn-danger" value="Ambil">
                </form>
            <?php } elseif ($status == 0) { ?>
                <form action="<?=base_url()?>tracking/scanRak" method="post">
                    <input type="hidden" name="type" value="<?=$data[0]["type_trimdies"]?>">
                    <input type="submit" class="btn btn-primary" value="Simpan">
                </form>
            <?php }
        ?>
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->