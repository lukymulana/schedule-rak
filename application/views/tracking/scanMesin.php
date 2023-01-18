<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">List Mesin</h2>
    
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

                                            window.location.replace('<?=base_url('tracking/mesin/') ?>'+type);

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
                                <th>Nama Mesin</th>
                                <th>Status</th>
                                <th>Last Updated</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $count = 1; foreach ($data as $d) { ?>
                                <tr>
                                    <td><?=$count; ?></td>
                                    <td><?='Mesin '.$d['no_mesin']?></td>
                                    <?php
                                        if ($d['status'] == 0) {
                                            $status = '-';
                                        } else {
                                            $status = 'Digunakan';
                                        }
                                    ?>
                                    <td><?=$status?></td>
                                    <?php
                                        if (empty($d['last_updated'])) {
                                            $last_updated = '-';
                                        } else {
                                            $last_updated = date('d-m-Y H:i', strtotime($d['last_updated']));
                                        }
                                    ?>
                                    <td><?=$last_updated?></td>
                                    <td>
                                        <a class="btn btn-primary" href="<?=base_url('tracking/mesin/'.$d['id_mesin']); ?>" >View</a>
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