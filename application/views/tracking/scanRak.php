<!-- Main Container -->
<main id="main-container">

<!-- Page Content -->
<div class="content">
    <!-- Bootstrap Design -->
    <h2 class="content-heading">Scan Rak</h2>
    
    <div class="col-md-12">
        <!-- Dynamic Table Full -->
        <div class="block">
            <div class="block-content block-content-full">
                <div style="text-align:center;">
                    <video id="previewKamera" style="width: 300px;height: 300px;"></video>
                    <br>
                    <select id="pilihKamera" style="max-width:400px"></select>
                </div>
                                
                <script>
                    var type = "<?=$type?>";
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
                                            var no_rak = result.text

                                            window.location.replace('<?=base_url('tracking/simpan/') ?>'+type+'/'+no_rak);

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

            </div>
        </div>
        <!-- END Dynamic Table Full -->
    </div>
</div>
<!-- END Page Content -->
</main>
<!-- END Main Container -->