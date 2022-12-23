<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">Rak</h2>
    
    <div class="col-md-12">
        <!-- Dynamic Table Full -->
        <div class="block">
            <div class="block-header block-header-default">
                <h3 class="block-title">Rak Mould Grid</h3>
            </div>
            <div class="block-content block-content-full">
                <div class="table-responsive">
                    <table class="table table-bordered table-vcenter">
                        <tr>
                            <th style="width: 6%;"></th>
                            <?php for ($i=1; $i <= 20; $i++) { ?>
                                <th style="width: 4.5%;text-align:center;" scope="col"><?=$i?></th>
                            <?php } ?>
                        </tr>
                        <tr>
                    <?php $char = range('A', 'E');
                        foreach($char as $c) {?>
                        <tr>
                            <th scope="col">Rak <?=$c?></th>
                            <?php for ($i=1; $i <= 20; $i++) { 
                                $id_rak = $c.$i;
                                $data_rak = $this->m_tracking->getDataRakById($id_rak);
                                $retVal = (!empty($data_rak)) ? $data_rak[0]['keterangan'] : '' ;
                            ?>
                            <td><?=$retVal?></td>
                            <?php } ?>
                        </tr>   
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
        <!-- END Dynamic Table Full -->
    </div>

    <div class="col-md-12">
        <!-- Dynamic Table Full -->
        <div class="block">
            <div class="block-header block-header-default">
                <h3 class="block-title">Rak Trimdies</h3>
            </div>
            <div class="block-content block-content-full">
                <div class="table-responsive">
                    <table class="table table-bordered table-vcenter" style="width: 100%;">
                        <tr>
                            <th style="width: 10%;"></th>
                            <?php for ($i=1; $i <= 20; $i++) { ?>
                                <th style="width: 10%;text-align:center;" scope="col"><?=$i?></th>
                            <?php } ?>
                        </tr>
                        <tr>
                    <?php $char = range('F', 'G');
                        foreach($char as $c) {?>
                        <tr>
                            <th scope="col">Rak <?=$c?></th>
                            <?php for ($i=1; $i <= 20; $i++) { 
                                $id_rak = $c.$i;
                                $data_rak = $this->m_tracking->getDataRakById($id_rak);
                                $retVal = (!empty($data_rak)) ? $data_rak[0]['keterangan'] : '' ;
                            ?>
                            <td><?=$retVal?></td>
                            <?php } ?>
                        </tr>   
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
        <!-- END Dynamic Table Full -->
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->