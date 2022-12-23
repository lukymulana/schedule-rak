<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">List Mould</h2>
    
    <div class="col-md-12">
        <div class="block">
            <div class="block-content block-content-full">
                <div style="text-align:center;">
                    <video id="previewKamera" style="width: 300px;height: 300px;"></video>
                    <br>
                    <select id="pilihKamera" style="max-width:400px"></select>
                </div>
                                
                <script>
                    let selectedDeviceId = null;
                    const codeReader = new ZXing.BrowserMultiFormatReader();
                    const sourceSelect = $("#pilihKamera");
            
                    $(document).on('change','#pilihKamera',function(){
                        selectedDeviceId = $(this).val();
                        if(codeReader){
                            codeReader.reset()
                            initScanner()
                        }
                    })
            
                    function initScanner() {
                        codeReader
                        .listVideoInputDevices()
                        .then(videoInputDevices => {
                            videoInputDevices.forEach(device =>
                                console.log(`${device.label}, ${device.deviceId}`)
                            );
            
                            if(videoInputDevices.length > 0){
                                
                                if(selectedDeviceId == null){
                                    if(videoInputDevices.length > 1){
                                        selectedDeviceId = videoInputDevices[1].deviceId
                                    } else {
                                        selectedDeviceId = videoInputDevices[0].deviceId
                                    }
                                }
                                
                                
                                if (videoInputDevices.length >= 1) {
                                    sourceSelect.html('');
                                    videoInputDevices.forEach((element) => {
                                        const sourceOption = document.createElement('option')
                                        sourceOption.text = element.label
                                        sourceOption.value = element.deviceId
                                        if(element.deviceId == selectedDeviceId){
                                            sourceOption.selected = 'selected';
                                        }
                                        sourceSelect.append(sourceOption)
                                    })
                            
                                }
            
                                codeReader
                                    .decodeOnceFromVideoDevice(selectedDeviceId, 'previewKamera')
                                    .then(result => {
            
                                            //hasil scan
                                            console.log(result.text)
                                            var type = result.text

                                            window.location.replace('<?=base_url('tracking/item/') ?>'+type);

                                            if(codeReader){
                                                codeReader.reset()
                                            }
                                    })
                                    .catch(err => console.error(err));
                                
                            } else {
                                alert("Camera not found!")
                            }
                        })
                        .catch(err => console.error(err));
                    }                
            
                    if (navigator.mediaDevices) {
                        initScanner()
                    } else {
                        alert('Cannot access camera.');
                    }
                </script>
                <!-- END JS -->
                <br>
                <hr>
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-vcenter js-dataTable-full">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Jenis</th>
                                <th>Type</th>
                                <th>Penyimpanan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $count = 1; foreach ($data_item as $di) { ?>
                                <tr>
                                    <td><?=$count; ?></td>
                                    <td><?=$di['jenis']?></td>
                                    <td><?=$di['type_item']?></td>
                                    <?php
                                        $cekItem = $this->m_tracking->getDataRakByItem($di['type_item']);
                                        if (!empty($cekItem)) {
                                            $status = 'Rak '.$cekItem[0]['id_rak'];
                                        } else {
                                            $status = '-';
                                        }
                                    ?>
                                    <td><?=$status?></td>
                                    <td>
                                        <a class="btn btn-primary" href="<?php echo base_url('tracking/item/'.$di['type_item']); ?>" >View</a>
                                    </td>
                                </tr>
                            <?php $count++; } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
       
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->