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
                        <td>Nama Mesin</td>
                        <td>:</td>
                        <td><?='Mesin '.$data[0]["no_mesin"]?></td>
                    </tr>
                    <?php
                        if ($data[0]['status'] == 0) {
                            $status = '-';
                        } else {
                            $status = 'Digunakan';
                        }
                    ?>
                    <tr>
                        <td>Status</td>
                        <td>:</td>
                        <td><?=$status?></td>
                    </tr>
                    <tr>
                        <td>Item</td>
                        <td>:</td>
                        <td><?=$data[0]['item']?></td>
                    </tr>
                    <?php
                        if (empty($d['last_updated'])) {
                            $last_updated = '-';
                        } else {
                            $last_updated = date('d-m-Y H:i', strtotime($d['last_updated']));
                        }
                    ?>
                    <tr>
                        <td>Status</td>
                        <td>:</td>
                        <td><?=$last_updated?></td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- END Dynamic Table Full -->
        <?php 
            if($data[0]['status'] == 1) { ?>
                <form action="<?=base_url()?>tracking/ambilItemMesin" method="post">
                    <input type="hidden" name="type" value="<?=$data[0]["id_mesin"]?>">
                    <input type="submit" class="btn btn-danger" value="Ambil Item">
                </form>
            <?php } elseif ($data[0]['status'] == 0) { ?>
                <form action="<?=base_url()?>tracking/scanItemMesin" method="post">
                    <input type="hidden" name="type" value="<?=$data[0]["id_mesin"]?>">
                    <input type="submit" class="btn btn-primary" value="Pasang Item">
                </form>
            <?php }
        ?>
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->